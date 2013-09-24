//
//  main.m
//  SecondsAlive
//
//  Created by Jeff Y Liu on 9/21/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        // This is the answer for Chapter 14 Challenge
        NSDateComponents *comps = [[NSDateComponents alloc] init];
        [comps setYear: 1985];
        [comps setMonth:6];
        [comps setDay:28];
        [comps setHour:13];
        [comps setMinute:10];
        [comps setSecond:0];
        
        NSCalendar *g = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
        NSDate *dateOfBirth = [g dateFromComponents:comps];
        NSDate *now = [[NSDate alloc] init];
        
        double secondsSinceEarlierDate = [now timeIntervalSinceDate:dateOfBirth];
        
        NSLog(@"I have been alive for %.0f seconds.", secondsSinceEarlierDate);
    }
    return 0;
}

