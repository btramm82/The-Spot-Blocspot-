//
//  MapViewController.h
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 3/7/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>
#import "ResultsTableViewController.h"
#import "ResultsTableViewCell.h"
#import <AddressBook/AddressBook.h>
#import "Annotation.h"
#import "DetailsViewController.h"


@interface MapViewController : UIViewController <MKMapViewDelegate, CLLocationManagerDelegate>


// Interface Properties
@property (strong, nonatomic) NSMutableArray *matchingItems;
@property (strong, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) IBOutlet UITextField *searchText;
@property (strong, nonatomic) MKMapItem *item;

- (IBAction)textFieldReturn:(id)sender;




@end
