//
//  BNRLogger.m
//  Callbacks
//
//  Created by Jeff Y Liu on 9/22/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "BNRLogger.h"

@implementation BNRLogger

#pragma mark - Notification Center
- (void)zoneChange:(NSNotification *)note {
    NSLog(@"The system time zone has changed!");
}

#pragma mark - Timer support - Callback: Target Action
- (void)sayOuch:(NSTimer *)t {
    NSLog(@"Ouch!");
}
#pragma mark - NSURLConnection Delegate

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    NSLog(@"connection failed: %@", [error localizedDescription]);
    _incomingData = nil;
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    NSLog(@"received %lu bytes", [data length]);
    
    // Create a mutable data if it doesn't already exist
    if (!_incomingData) {
        _incomingData = [[NSMutableData alloc] init];
    }
    
    [_incomingData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"Got it all!");
    NSString *string = [[NSString alloc] initWithData:_incomingData
                                             encoding:NSUTF8StringEncoding];
    _incomingData = nil;
    NSLog(@"string has %lu characters", [string length]);
    
    // Uncomment the next line to see the entire fetched file
    NSLog(@"The whole string is %@", string);
}
@end
