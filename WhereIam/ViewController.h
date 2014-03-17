//
//  ViewController.h
//  WhereIam
//
//  Created by Willrock on 17.03.14.
//  Copyright (c) 2014 Willrock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate>
{
    CLLocationManager *locationManager;
}

@property (nonatomic) CLLocationDistance distanceFilter;

@end
