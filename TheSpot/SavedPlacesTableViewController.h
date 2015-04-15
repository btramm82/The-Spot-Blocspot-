//
//  SavedPlacesTableViewController.h
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 4/1/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "DetailsViewController.h"
#import "PlacesOfInterest.h"

@interface SavedPlacesTableViewController : UITableViewController

@property (nonatomic, strong) PlacesOfInterest *place;

@end
