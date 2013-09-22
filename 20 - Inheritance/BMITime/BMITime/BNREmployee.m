//
//  BNREmployee.m
//  BMITime
//
//  Created by Jeff Y Liu on 9/21/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "BNREmployee.h"

@implementation BNREmployee

- (double)yearsOfEmployment
{
    // Do I have a non-nil hireDate?
    // BOOL - YES (1) and NO (0)
    if (self.hireDate) {
        // NSTimeInterval is the same as double
        NSTimeInterval secs = [self.hireDate timeIntervalSinceNow];
        return secs / 31557600.0; // Seconds per year
    } else {
        return 0;
    }
}

- (float)bodyMassIndex
{
    // This returns the super class's implementation
    return ([super bodyMassIndex] * 0.9);
}

- (NSString *)description {
    return [NSString stringWithFormat:@"<Employee %d>", self.employeeID];
}
@end
