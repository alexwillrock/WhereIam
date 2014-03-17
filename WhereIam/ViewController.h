//
//  ViewController.h
//  WhereIam
//
//  Created by Willrock on 17.03.14.
//  Copyright (c) 2014 Willrock. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface ViewController : UIViewController <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>
{
    CLLocationManager *locationManager;
    
    IBOutlet MKMapView *worldView;
    IBOutlet UIActivityIndicatorView *activityIndicator;
    IBOutlet UITextField *locationTitleField;
}

-(void)findLocation;
-(void)foundLocation:(CLLocation *)loc;

@property (nonatomic) CLLocationDistance distanceFilter;

@end
