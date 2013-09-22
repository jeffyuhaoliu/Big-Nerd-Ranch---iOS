//
//  main.m
//  BMITime
//
//  Created by Jeff Y Liu on 9/21/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNREmployee.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Create an instance of BNREmployee
        BNREmployee *mikey = [[BNREmployee alloc] init];

        // Give properties interesting values using setter methods
        mikey.weightInKilos = 96;
        mikey.heightInMeters = 1.8;
        mikey.employeeID = 15;
        mikey.hireDate = [NSDate date];

        // Log some properties using getter methods
        NSLog(@"mikey has a weight of %d", mikey.weightInKilos);
        NSLog(@"mikey has a height of %f", mikey.heightInMeters);
//        NSLog(@"Employee %u hired on %@", mikey.employeeID, mikey.hireDate);
        NSLog(@"Employee %@ hired on %@", mikey, mikey.hireDate);
        
        float bmi = [mikey bodyMassIndex];
        double years = [mikey yearsOfEmployment];
        NSLog(@"BMI of %.2f, has worked with us for %.2f years", bmi, years);
    }
    return 0;
}

