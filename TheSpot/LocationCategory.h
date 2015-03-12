//
//  LocationCategory.h
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 3/11/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PointOfInterest;

@interface LocationCategory : NSManagedObject

@property (nonatomic, retain) NSString *categoryColor;
@property (nonatomic, retain) NSString *categoryName;
@property (nonatomic, retain) PointOfInterest *pointOfInterest;

@end
