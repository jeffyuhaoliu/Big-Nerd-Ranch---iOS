//
//  BNRWebViewController.m
//  Nerdfeed
//
//  Created by Jeff Y Liu on 9/26/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "BNRWebViewController.h"

@implementation BNRWebViewController

- (void)loadView {
    UIWebView *wv = [[UIWebView alloc] init];
    self.view = wv;
}

- (void)setLink:(NSString *)link {
    _link = link;
    if (_link) {
        NSURL *url = [NSURL URLWithString:_link];
        NSURLRequest *req = [NSURLRequest requestWithURL:url];
        [(UIWebView *)self.view loadRequest:req];
    }
}

@end
