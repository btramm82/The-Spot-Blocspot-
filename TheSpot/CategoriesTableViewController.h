//
//  CategoriesTableViewController.h
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 4/6/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LocationCategory.h"
#import "PlacesOfInterest.h"
#import "CategoryDetailsTableViewController.h"

@interface CategoriesTableViewController : UITableViewController

@property (nonatomic, strong) PlacesOfInterest *placesOfInterest;

@end
