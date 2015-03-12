//
//  MapViewController.m
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 3/7/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import "MapViewController.h"
#import <CoreLocation/CoreLocation.h>


@interface MapViewController () <UITextFieldDelegate>
@property (strong, nonatomic) CLLocationManager *locationManager;
@property (strong, nonatomic) ResultsTableViewController *searchResultsController;


@end

@implementation MapViewController


#pragma mark - Initializer


- (void)viewWillAppear:(BOOL)animated {
    // Do any additional setup after loading the view.
    self.locationManager = [[CLLocationManager alloc]init];
    self.locationManager.desiredAccuracy = kCLLocationAccuracyHundredMeters;
    self.locationManager.distanceFilter = kCLDistanceFilterNone;
    self.locationManager.delegate = self;
    
    // Check for iOS 8. Without this guard the code will crash with "unknown selector" on iOS 7.
    if ([self.locationManager respondsToSelector:@selector(requestAlwaysAuthorization)]) {
        [self.locationManager requestAlwaysAuthorization];
    }
    
    [self.locationManager startUpdatingLocation];
    
    self.searchText.delegate = self;
    UINavigationController *nVC = self.tabBarController.viewControllers[1];
    _searchResultsController = (ResultsTableViewController *)nVC.topViewController;
}

-(void) viewDidLoad {
    [super viewDidLoad];
    _mapView.delegate = self;
    _mapView.showsUserLocation = YES;
    
}
    
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - MKMapViewDelegateMethods

-(void) mapViewWillStartLocatingUser:(MKMapView *)mapView {
    // Check authorization status with class method
    CLAuthorizationStatus status = [CLLocationManager authorizationStatus];
    
    //If User has never been asked to decide on location authorization
    if (status == kCLAuthorizationStatusNotDetermined) {
        [self.locationManager requestWhenInUseAuthorization];
    } else if (status == kCLAuthorizationStatusDenied)
        NSLog(@"Location Service  Denied");
}


-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 2000, 2000);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];


// Add User Location Annotaion
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"Current location";
}


typedef enum : NSInteger {
    kCallOutAccessoryRight = 0,
    kCallOutAccessoryLeft = 1
    }

    CallOutAccessoryType;
    
- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(id<MKAnnotation>)annotation {
        if ([annotation isKindOfClass:[MKUserLocation class]])
            return nil;
        
        static NSString *identifier = @"customAnnotationView";
        
        MKPinAnnotationView *pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:identifier];
        
        if (!pinView)
        {
            pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:@"CustomPinAnnotationView"];
            pinView.canShowCallout = YES;
            pinView.pinColor = MKPinAnnotationColorGreen;
            pinView.animatesDrop = YES;
            
            pinView.rightCalloutAccessoryView     = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
            pinView.rightCalloutAccessoryView.tag = kCallOutAccessoryRight;
            
            pinView.leftCalloutAccessoryView = [UIButton buttonWithType:UIButtonTypeContactAdd];
            pinView.leftCalloutAccessoryView.tag  = kCallOutAccessoryLeft;
        }
        else
        {
            pinView.annotation = annotation;
        }
        
        return pinView;
    }

- (void)mapView:(MKMapView *)mapView annotationView:(MKAnnotationView *)view calloutAccessoryControlTapped:(UIControl *)control {
    
    //here, can set annotation info in some property of detailView
    
    if (control.tag == kCallOutAccessoryRight)  {
        
        
        NSLog(@"Present info sheet for %@ here", [view.annotation title]);
    }
    else if (control.tag == kCallOutAccessoryLeft) {
        
        // This will be used for later most likely to add item to category
        Annotation *myAnnotation = view.annotation;
        NSAssert([myAnnotation isKindOfClass:[Annotation class]],@"Annotation should be MapItemAnnotation: %@", myAnnotation);
        
        [myAnnotation.item openInMapsWithLaunchOptions:@{MKLaunchOptionsMapCenterKey:[NSValue valueWithMKCoordinate:mapView.region.center], MKLaunchOptionsMapSpanKey:[NSValue valueWithMKCoordinateSpan:mapView.region.span],MKLaunchOptionsDirectionsModeKey : MKLaunchOptionsDirectionsModeDriving}];
        
        NSLog(@"Do whatever you want if left accessory tapped");
    }
}



    

#pragma mark - CLLocationManagerDelegate methods
-(void) locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    
}

#pragma mark - Map Searching

- (void) performSearch {
    MKLocalSearchRequest *request = [[MKLocalSearchRequest alloc] init];
    request.naturalLanguageQuery = _searchText.text;
    request.region = _mapView.region;

    _matchingItems = [[NSMutableArray alloc] init];
    
    MKLocalSearch *search = [[MKLocalSearch alloc]initWithRequest:request];

    
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
               if (response.mapItems.count == 0)
                   NSLog(@"No Matches");
               else
                   for (MKMapItem *item in response.mapItems) {
                       [_matchingItems addObject:item];
                       
                       
            Annotation *annotation = [[Annotation alloc] initWithMapItem:item];
            [_mapView addAnnotation:annotation];
                NSLog(@"name = %@", item.name);
                NSLog(@"Phone = %@", item.phoneNumber);
            }
        if ([_matchingItems count]) {
            _searchResultsController.mapItems = _matchingItems;
            [self.tabBarController setSelectedIndex:1];
        } else {
            // alertbox "no results found"
        }
    }];
}


#pragma mark - Map Actions
- (IBAction)textFieldReturn:(id)sender {
    [sender resignFirstResponder];
    [_mapView removeAnnotations:[_mapView annotations]];
    [self performSearch];
   // [self performSegueWithIdentifier:@"DisplaySearchResults" sender:self];

}


#pragma mark - Segue

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"DisplaySearchResults"]) {
        ResultsTableViewController *searchResults = [segue destinationViewController];
        searchResults.mapItems = _matchingItems;
    }
}



@end