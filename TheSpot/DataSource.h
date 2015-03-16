//
//  DataSource.h
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 3/16/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "DetailsViewController.h"
#import "MapViewController.h"

@interface DataSource : NSObject

+(instancetype) sharedInstance;

@property (strong, nonatomic,readonly) MKMapItem *item;

@end
