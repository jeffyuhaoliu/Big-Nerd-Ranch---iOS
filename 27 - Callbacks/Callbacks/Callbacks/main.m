//
//  main.m
//  Callbacks
//
//  Created by Jeff Y Liu on 9/22/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRLogger.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        BNRLogger *logger = [[BNRLogger alloc] init];

        // Callback - Delegation
//        NSURL *url = [NSURL URLWithString:@"http://www.gutenberg.org/cache/epub/205/pg205.txt"];
//        
//        NSURLRequest *request = [NSURLRequest requestWithURL:url];
//        
//        __unused NSURLConnection *fetchConn = [[NSURLConnection alloc] initWithRequest:request
//                                                                              delegate:logger
//                                                                      startImmediately:YES];

        // Callback - Target Action
//        __unused NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2.0
//                                                          target:logger
//                                                        selector:@selector(sayOuch:)
//                                                        userInfo:nil
//                                                         repeats:YES];

        // Callback - Notification
//        [[NSNotificationCenter defaultCenter] addObserver:logger
//                                                 selector:@selector(zoneChange:)
//                                                     name:NSSystemTimeZoneDidChangeNotification
//                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserverForName:NSSystemTimeZoneDidChangeNotification
                                                          object:nil queue:nil
                                                      usingBlock:^(NSNotification *n) {
                                                          NSLog(@"The system time zone has changed");
                                                      }];
        
        // We don't usually do this
        [[NSRunLoop currentRunLoop] run];
    }
    return 0;
}

