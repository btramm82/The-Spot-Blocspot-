//
//  DataSource.m
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 3/16/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import "DataSource.h"

@interface DataSource ()

@property (nonatomic, strong) MKMapItem *item;

@end

@implementation DataSource

+ (instancetype) sharedInstance {
    static dispatch_once_t once;
    static id sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}



@end
