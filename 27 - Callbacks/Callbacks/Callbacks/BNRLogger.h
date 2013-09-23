//
//  BNRLogger.h
//  Callbacks
//
//  Created by Jeff Y Liu on 9/22/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRLogger : NSObject <NSURLConnectionDelegate, NSURLConnectionDataDelegate> {
    NSMutableData *_incomingData;
}

// Timer target/action callback
- (void)sayOuch:(NSTimer *)t;
// A Notification callback
- (void)zoneChange:(NSNotification *)n;
@end
