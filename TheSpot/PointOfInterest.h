//
//  PointOfInterest.h
//  TheSpot
//
//  Created by BRIAN TRAMMELL on 3/11/15.
//  Copyright (c) 2015 TDesigns. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import <MapKit/MapKit.h>

@class LocationCategory;

@interface PointOfInterest : NSManagedObject

@property (nonatomic, retain) MKMapItem *mapItem;
@property (nonatomic, retain) NSString *note;
@property (nonatomic, retain) NSNumber *visited;
@property (nonatomic, retain) NSSet *LocationCategory;

@end

@interface PointOfInterest (CoreDataGereratedAccessors)

-(void)addLocationCategoryObject:(LocationCategory *)value;
-(void)removeLocationCategoryObject:(LocationCategory *)value;
-(void)addLocationCategory:(NSSet *)values;
-(void)removeLocationCategory:(NSSet *)values;

@end

