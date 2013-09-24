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
        // NSDate is an inmmutable object. Inmmutable object is thread safe.
        NSDate *now = [NSDate date];
        // Can also use...
        // NSDate *now = [[NSDate alloc] init];
        // NSDate *now = [NSDate new];
        
        // %p is used to reference to the object's pointer
        NSLog(@"This NSDate object lives at %p", now);
        // %@ is used to reference the object
        NSLog(@"The date is %@", now); // sends [now description]
        
        double seconds = [now timeIntervalSince1970];
        NSLog(@"It has been %f seconds since the start of 1970", seconds);
        
        // Objective-C will allow you to send any type of message and it will compile...
        // The compliler does its best to check, but sometimes still will compile it
        //[now performSelector:@selector(timeintervalSince1970)];
    }
    return 0;
}

