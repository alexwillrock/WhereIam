//
//  ViewController.m
//  WhereIam
//
//  Created by Willrock on 17.03.14.
//  Copyright (c) 2014 Willrock. All rights reserved.
//

#import "ViewController.h"
#import "MapPoint.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize distanceFilter;
- (void)viewDidLoad
{
    [super viewDidLoad];
    locationManager = [[CLLocationManager alloc] init];
    [locationManager setDelegate:self];
    
    [locationManager setDesiredAccuracy:kCLLocationAccuracyBest];
    
    [locationManager setDistanceFilter:50];
    [worldView setShowsUserLocation:YES];
}

-(void)findLocation{
    [locationManager startUpdatingLocation];
    [activityIndicator startAnimating];
    [locationTitleField setHidden:YES];
}

-(void)foundLocation:(CLLocation *)loc{
    CLLocationCoordinate2D coord = [loc coordinate];
    
    MapPoint *mp = [[MapPoint alloc] initWithCoordinate:coord title:[locationTitleField text]];
    
    [worldView addAnnotation:mp];
    
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [worldView setRegion:region animated:YES];
    
    [locationTitleField setText:@"@"];
    [activityIndicator stopAnimating];
    [locationTitleField setHidden:NO];
    [locationManager stopUpdatingHeading];
}

-(void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSLog(@"%@", newLocation);
    if ([locationManager distanceFilter] > 50) {
        NSLog(@"new location %@", newLocation);
    }
    
    NSTimeInterval t = [[newLocation timestamp]timeIntervalSinceNow];
    if(t < 180){
        return;
    }
    [self foundLocation:newLocation];
}

-(void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation{
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [worldView setRegion:region animated:YES];
}

-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"не удалось найти локацию %@", error);
}

-(void)dealloc{
    [locationManager setDelegate:nil];
}

-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    [self findLocation];
    [textField resignFirstResponder];
    
    return YES;
}

@end
