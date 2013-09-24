//
//  main.m
//  TimesTwo
//
//  Created by Jeff Y Liu on 9/21/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        // Memory management is being managed automatically by ARC
        NSDate *currentTime = [[NSDate alloc] init];
        NSLog(@"currentTime's value is %p", currentTime);
        
        NSDate *startTime = currentTime;
        
        sleep(2);
        
        currentTime = [NSDate date];
        NSLog(@"currentTIme's value is now %p", currentTime);
        NSLog(@"The address of the orginal object is %p", startTime);
    }
    return 0;
}

