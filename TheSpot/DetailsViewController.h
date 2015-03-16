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
#import "DataSource.h"




@interface DetailsViewController : UIViewController
@property (strong, nonatomic) MKMapItem *item;
@property (weak, nonatomic) IBOutlet UITextField *detailsName;
@property (weak, nonatomic) IBOutlet UITextField *detailsURL;
@property (weak, nonatomic) IBOutlet UITextField *detailsAddress;
@property (weak, nonatomic) IBOutlet UITextField *detailsPhone;
@property (weak, nonatomic) IBOutlet UITextField *detailsNote;








@end
