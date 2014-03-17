//
//  MapPoint.m
//  WhereIam
//
//  Created by Willrock on 17.03.14.
//  Copyright (c) 2014 Willrock. All rights reserved.
//

#import "MapPoint.h"

@implementation MapPoint
@synthesize coordinate, title;

-(id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t{
    self = [super init];
    if(self){
        coordinate = c;
        [self setTitle:t];
    }
    return self;
}
-(id)init{
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"MyHome"];
}

@end
