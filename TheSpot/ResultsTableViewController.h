//
//  ResultsTableViewController.h
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 3/9/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "ResultsTableViewCell.h"
#import "DetailsViewController.h"



@interface ResultsTableViewController : UITableViewController <UITextViewDelegate, UITableViewDelegate, UITableViewDataSource>


@property (strong, nonatomic) NSArray *mapItems;






@end
