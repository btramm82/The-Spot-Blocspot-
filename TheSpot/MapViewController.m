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


-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(userLocation.coordinate, 800, 800);
    [self.mapView setRegion:[self.mapView regionThatFits:region] animated:YES];
    
    // Add Annotaion
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = userLocation.coordinate;
    point.title = @"Current location";
    
    
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
    
    MKLocalSearch *search =
    [[MKLocalSearch alloc]initWithRequest:request];
    
    [search startWithCompletionHandler:^(MKLocalSearchResponse *response, NSError *error) {
        if (response.mapItems.count == 0)
            NSLog(@"No Matches");
        else
            for (MKMapItem *item in response.mapItems) {
                [_matchingItems addObject:item];
                MKPointAnnotation *annotation =
                [[MKPointAnnotation alloc]init];
                annotation.coordinate = item.placemark.coordinate;
                annotation.title = item.name;
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