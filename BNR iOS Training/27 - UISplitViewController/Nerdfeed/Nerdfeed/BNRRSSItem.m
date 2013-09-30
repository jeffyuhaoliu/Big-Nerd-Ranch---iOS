//
//  BNRRSSItem.m
//  Nerdfeed
//
//  Created by Jeff Y Liu on 9/26/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "BNRRSSItem.h"

@implementation BNRRSSItem

- (void)readFromJSONObject:(NSDictionary *)jsonObject {
    NSDictionary *name = jsonObject[@"im:name"];
    self.title = name[@"label"];
    
    // The link to the preview audio sample is burried deep in the JSON
    NSArray *linkArray = jsonObject[@"link"];
    for (NSDictionary *d in linkArray) {
        NSDictionary *attrs = d[@"attributes"];
        if ([attrs[@"im:assetType"] isEqualToString:@"preview"]) {
            NSDictionary *attrs = d[@"attributes"];
            self.link = attrs[@"href"];
        }
    }
}
@end
