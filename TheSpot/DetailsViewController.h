//
//  DetailsViewController.h
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 3/11/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "MapViewController.h"
#import "AppDelegate.h"
#import "SavedPlacesTableViewController.h"

@interface DetailsViewController : UIViewController <NSCoding>

@property (nonatomic, strong) NSManagedObject *place;

@property (strong, nonatomic) MKMapItem *item;
@property (weak, nonatomic) IBOutlet UITextField *detailsName;
@property (weak, nonatomic) IBOutlet UITextField *detailsURL;
@property (weak, nonatomic) IBOutlet UITextField *detailsAddress;
@property (weak, nonatomic) IBOutlet UITextField *detailsAddressTwo;
@property (weak, nonatomic) IBOutlet UITextField *detailsPhone;


- (IBAction)saveDetails:(id)sender;








@end
