//
//  BNRPerson.m
//  BMITime
//
//  Created by Jeff Y Liu on 9/21/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "BNRPerson.h"

@implementation BNRPerson

//- (void)setHeightInMeters:(float)h
//{
//    _heightInMeters = h;
//}
//
//- (float)heightInMeters
//{
//    return _heightInMeters;
//}
//
//- (void)setWeightInKilos:(int)w
//{
//    _weightInKilos = w;
//}
//
//- (int)weightInMeters
//{
//    return _weightInKilos;
//}

- (float)bodyMassIndex
{
    float h = self.heightInMeters;
    return self.weightInKilos / (h * h);
}
@end
