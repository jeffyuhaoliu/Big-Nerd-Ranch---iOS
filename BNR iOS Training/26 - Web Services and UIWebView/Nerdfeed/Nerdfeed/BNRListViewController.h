//
//  BNRListViewController.h
//  Nerdfeed
//
//  Created by Jeff Y Liu on 9/26/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>
@class BNRWebViewController;

@interface BNRListViewController : UITableViewController

@property (nonatomic, strong) BNRWebViewController *webViewController;

@end
