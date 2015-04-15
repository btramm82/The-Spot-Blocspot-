//
//  PlacesOfInterest.h
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 4/7/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class LocationCategory;

@interface PlacesOfInterest : NSManagedObject

@property (nonatomic, retain) NSString * address;
@property (nonatomic, retain) NSString * addressTwo;
@property (nonatomic, retain) NSNumber * latitude;
@property (nonatomic, retain) NSNumber * longitude;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * note;
@property (nonatomic, retain) NSString * phoneNumber;
@property (nonatomic, retain) NSString * website;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) LocationCategory *locationCategory;

@end
