//
//  main.m
//  DateList
//
//  Created by Jeff Y Liu on 9/21/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Create three NSDate objects
        NSDate *now = [NSDate date];
        NSDate *tomorrow = [now dateByAddingTimeInterval:24.0 * 60.0 * 60.0];
        NSDate *yesterday = [now dateByAddingTimeInterval:-24.0 * 60.0 * 60.0];
        
        // Create an array containing all three (nil terminates the list); NSNull is used to denote a null value in an array
        //NSArray *dateList = [[NSArray alloc] initWithObjects:now, [NSNull null], tomorrow, yesterday, nil];
        NSArray *dateList = @[now, tomorrow, yesterday];

        NSLog(@"The list of dates is: %@", dateList);
        
        // Print a couple of dates
        NSLog(@"The first date is %@", [dateList objectAtIndex:0]);
        NSLog(@"The first date is %@", dateList[2]);
        
        // How many dates are in the array?
        NSLog(@"There are %lu dates", [dateList count]);
        
        NSUInteger dateCount = [dateList count];
        for (int i=0; i < dateCount; i++) {
            NSDate *d = dateList[i];
            NSLog(@"Here is a date: %@", d);
        }
        for (NSDate *d in dateList) {
            NSLog(@"Here is a date: %@", d);
        }
        
        // Create an empty mutable array
        NSMutableArray *dateMutableList = [NSMutableArray array];
        
        // Add two dates to the array
        [dateMutableList addObject:now];
        [dateMutableList addObject:tomorrow];
        
        // Add yesterday at the begining of the list
        [dateMutableList insertObject:yesterday atIndex:0];

        // How many dates are in the array?
        NSLog(@"There are %lu dates", [dateMutableList count]);
        
        // Iterate over the array
        for(int i=0; i < [dateMutableList count]; i++) {
            NSLog(@"Here is a date: %@", dateMutableList[i]);
        }
        
        // Remove yesterday
        [dateMutableList removeObjectAtIndex:0];
        NSLog(@"Now the first date is %@", dateMutableList[0]);
    }
    return 0;
}

