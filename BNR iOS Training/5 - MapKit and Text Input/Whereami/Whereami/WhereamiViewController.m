//
//  WhereamiViewController.m
//  Whereami
//
//  Created by Jeff Y Liu on 9/23/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "WhereamiViewController.h"
@import CoreLocation;
#import <MapKit/MapKit.h>
// Or...
//@import MapKit
#import "BNRMapPoint.h"

@interface WhereamiViewController () <CLLocationManagerDelegate, MKMapViewDelegate, UITextFieldDelegate>

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (nonatomic, weak) IBOutlet MKMapView *worldMap;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *activityIndicator;
@property (nonatomic, weak) IBOutlet UITextField *locationTitleField;

@end

@implementation WhereamiViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Create location manager object
        self.locationManager = [[CLLocationManager alloc] init];
        
        // There will be a warning from this line of code; ignore it for now
        self.locationManager.delegate = self;
        
        // And we want it to be as accurate as possible
        // regardless of how much time/power it takes
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    }
    
    return self;
}

- (void)viewDidLoad {
    self.worldMap.showsUserLocation = YES;
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    CLLocation *newLocation = [locations lastObject];
    NSLog(@"%@", newLocation);
    
    // How many seconds ago was this new location created?
    NSTimeInterval t = [newLocation.timestamp timeIntervalSinceNow];
    
    // CLLocationManagers will return the last found location of the
    // device first, you don't want that data in this case.
    // If this location was made more than 3 minutes ago, ignore it.
    // Notice that this value is negative.
    if (t < -180) {
        // This is cached data, you don't want it, keep keep looking
        return;
    }
    [self foundLocation:newLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"Could not find location: %@", error);
}

- (void)mapView:(MKMapView *)mapView didUpdateUserLocation:(MKUserLocation *)userLocation {
    CLLocationCoordinate2D loc = [userLocation coordinate];
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(loc, 250, 250);
    [self.worldMap setRegion:region animated:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // This method isn't implemented yet - but will soon
    [self findLocation];
    
    [textField resignFirstResponder];
    
    return YES;
}

- (void)findLocation {
    [self.locationManager startUpdatingLocation];
    [self.activityIndicator startAnimating];
    self.locationTitleField.hidden = YES;
}

- (void)foundLocation:(CLLocation *)loc {
    CLLocationCoordinate2D coord = loc.coordinate;
    
    // Create an instance of BNRMapPoint with the current data
    BNRMapPoint *mp = [[BNRMapPoint alloc] initWithCoordinate:coord title:self.locationTitleField.text];
    
    // Add it to the map view
    [self.worldMap addAnnotation:mp];
    
    // Zoom to the region of this location
    MKCoordinateRegion region = MKCoordinateRegionMakeWithDistance(coord, 250, 250);
    [self.worldMap setRegion:region animated:YES];
    
    // Reset the UI
    self.locationTitleField.text = @"";
    self.locationTitleField.hidden = NO;
    [self.activityIndicator stopAnimating];
    [self.locationManager stopUpdatingLocation];
}

@end
