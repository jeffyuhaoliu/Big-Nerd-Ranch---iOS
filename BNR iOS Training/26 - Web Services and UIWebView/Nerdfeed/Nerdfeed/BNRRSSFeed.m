//
//  BNRRSSFeed.m
//  Nerdfeed
//
//  Created by Jeff Y Liu on 9/26/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "BNRRSSFeed.h"
#import "BNRRSSItem.h"

@interface BNRRSSFeed()

@property (nonatomic, strong) NSMutableArray *items;

@end

@implementation BNRRSSFeed

- (id)init
{
    self = [super init];
    if (self) {
        self.items = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)readFromJSONObject:(NSDictionary *)jsonObject {
    NSDictionary *feed = jsonObject[@"feed"];
    NSDictionary *author = jsonObject[@"author"];
    NSDictionary * name = jsonObject[@"name"];
    
    self.title = name[@"label"];
    
    for (NSDictionary *item in [feed objectForKey:@"entry"]) {
        BNRRSSItem *i = [[BNRRSSItem alloc] init];
        [i readFromJSONObject:item];
        [self.items addObject:i];
    }
}

@end
