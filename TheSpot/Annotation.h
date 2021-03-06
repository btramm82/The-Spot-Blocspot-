//
//  Annotation.h
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 3/10/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import "MapViewController.h"
#import "AppDelegate.h"
#import "PlacesOfInterest.h"


@interface Annotation : NSObject <MKAnnotation, MKMapViewDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) MKMapItem *item;
@property (nonatomic,strong) PlacesOfInterest *place;

-(id)initWithMapItem:(MKMapItem *)item;
-(NSString *)title;
-(NSString *)subtitle;
-(CLLocationCoordinate2D)coordinate;



@end
