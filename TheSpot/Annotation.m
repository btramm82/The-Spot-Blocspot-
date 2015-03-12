//
//  Annotation.m
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 3/10/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import "Annotation.h"

@implementation Annotation 




- (id)initWithMapItem:(MKMapItem *)item {
    self = [super init];
    if (self) {
        _item = item;
    }
    return self;
}

- (NSString *)title {
    return _item.name;
}

- (NSString *)subtitle{
    return _item.placemark.title;
}

- (CLLocationCoordinate2D)coordinate {
    return _item.placemark.coordinate;
}



@end


