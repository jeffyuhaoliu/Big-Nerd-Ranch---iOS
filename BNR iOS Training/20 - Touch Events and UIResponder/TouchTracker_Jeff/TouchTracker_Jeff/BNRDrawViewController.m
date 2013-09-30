//
//  BNRDrawViewController.m
//  TouchTracker_Jeff
//
//  Created by Jeff Y Liu on 9/26/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "BNRDrawViewController.h"
#import "BNRDrawView.h"

@implementation BNRDrawViewController

- (void)loadView {
    self.view = [[BNRDrawView alloc] initWithFrame:CGRectZero];
}

@end
