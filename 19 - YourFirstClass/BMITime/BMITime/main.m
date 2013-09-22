//
//  main.m
//  BMITime
//
//  Created by Jeff Y Liu on 9/21/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

// < > tells XCode to look at some sort of include
#import <Foundation/Foundation.h>
// Double quotes tells XCode to look in this class
#import "BNRPerson.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        BNRPerson *mikey = [[BNRPerson alloc] init];
//        [mikey setWeightInKilos:96];
//        [mikey setHeightInMeters:1.8];
        mikey.weightInKilos = 96;
        mikey.heightInMeters = 1.8;
        float bmi = [mikey bodyMassIndex];
//        NSLog(@"Mikey (%d, %f) has a BMI of %.2f", [mikey weightInKilos], [mikey heightInMeters], bmi);
        NSLog(@"Mikey (%d, %f) has a BMI of %.2f", mikey.weightInKilos, mikey.heightInMeters, bmi);
    }
    return 0;
}

