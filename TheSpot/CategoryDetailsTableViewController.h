//
//  CategoryDetailsTableViewController.h
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 4/8/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"
#import "PlacesOfInterest.h"
#import "LocationCategory.h"
#import "CategoriesTableViewController.h"
#import "DetailsViewController.h"

@interface CategoryDetailsTableViewController : UITableViewController

//@property (nonatomic, strong) NSManagedObject *categoryName;
@property (nonatomic, strong) LocationCategory *categoryName;



@end
