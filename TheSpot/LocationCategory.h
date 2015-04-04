//
//  LocationCategory.h
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 4/1/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class PlacesOfInterest;

@interface LocationCategory : NSManagedObject

@property (nonatomic, retain) NSString * categoryColor;
@property (nonatomic, retain) NSString * categoryName;
@property (nonatomic, retain) NSSet *placesOfInterest;
@end

@interface LocationCategory (CoreDataGeneratedAccessors)

- (void)addPlacesOfInterestObject:(PlacesOfInterest *)value;
- (void)removePlacesOfInterestObject:(PlacesOfInterest *)value;
- (void)addPlacesOfInterest:(NSSet *)values;
- (void)removePlacesOfInterest:(NSSet *)values;

@end
