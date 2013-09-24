//
//  main.m
//  TimeAfterTime
//
//  Created by Jeff Y Liu on 9/21/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        NSDate *now = [[NSDate alloc] init];
        NSLog(@"This NSDate object lives at %p", now);
        NSLog(@"The date is %@", now);
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %f seconds since the start of 1970", seconds);
        
        NSDate *later = [now dateByAddingTimeInterval:100000];
        // Output: In 100,000 seconds it will be 2013-09-22 21:29:38 +0000
        NSLog(@"In 100,000 seconds it will be %@,", later);
        
        NSCalendar *cal = [NSCalendar currentCalendar];
        // Output: My calendar is <__NSCFCalendar: 0x10010aac0>
        NSLog(@"My calendar is %@", cal);
        // Output: My calendar is gregorian
        NSLog(@"My calendar is %@", [cal calendarIdentifier]);

        unsigned long day = [cal ordinalityOfUnit:NSDayCalendarUnit
                                           inUnit:NSMonthCalendarUnit
                                          forDate:now];
        // Output: This day is 21 of the month
        NSLog(@"This day is %lu of the month", day);
    }
    return 0;
}

