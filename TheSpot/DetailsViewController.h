//
//  DetailsViewController.h
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 3/11/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MapViewController.h"

@interface DetailsViewController : UIViewController

@property (strong, nonatomic) MKMapItem *item;
@property (strong, nonatomic) IBOutlet UITextField *detailsName;
@property (strong, nonatomic) IBOutlet UITextField *detailsAddress;
@property (strong, nonatomic) IBOutlet UITextField *detailsNote;
@property (strong, nonatomic) IBOutlet UITextField *detailsPhone;
@property (strong, nonatomic) IBOutlet UITextField *detailsCategory;
@property (strong, nonatomic) IBOutlet UITextField *detailsURL;



@end
