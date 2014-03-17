//
//  MapPoint.h
//  WhereIam
//
//  Created by Willrock on 17.03.14.
//  Copyright (c) 2014 Willrock. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface MapPoint : NSObject <MKAnnotation>
-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t;

@property (nonatomic, readonly) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy)NSString *title;
                         
@end
