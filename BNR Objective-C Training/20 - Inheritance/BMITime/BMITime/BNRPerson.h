//
//  BNRPerson.h
//  BMITime
//
//  Created by Jeff Y Liu on 9/21/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRPerson : NSObject
//{
//    // It has two instance variables
//    float _heightInMeters;
//    int _weightInKilos;
//}

// You will be able to set those instance variables using these methods
//- (void)setHeightInMeters:(float)h;
//- (float)heightInMeters;
//
//- (void)setWeightInKilos:(int)w;
//- (int)weightInKilos;
// Use @property instead of writing our own accessor methods and you don't need to declare instance variables anymore
@property float heightInMeters;
@property int weightInKilos;

// This method calculates the Body Mass Index
- (float)bodyMassIndex;
@end
