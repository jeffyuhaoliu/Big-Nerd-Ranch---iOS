//
//  BNRMapPoint.m
//  Whereami
//
//  Created by Jeff Y Liu on 9/23/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "BNRMapPoint.h"

@interface BNRMapPoint()

@property (nonatomic) CLLocationCoordinate2D coordinate;

@end

@implementation BNRMapPoint

- (id)initWithCoordinate:(CLLocationCoordinate2D)c title:(NSString *)t {
    self = [super init];
    if (self) {
        self.coordinate = c;
        self.title = t;
    }
    return self;
}

- (id)init {
    return [self initWithCoordinate:CLLocationCoordinate2DMake(43.07, -89.32) title:@"Hometown"];
}

@end
