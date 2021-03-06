//
//  BNRItemStore.m
//  Homepwner
//
//  Created by Jeff Y Liu on 9/24/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "BNRItemStore.h"
#import "BNRItem.h"

@interface BNRItemStore()

@property (nonatomic, strong) NSMutableArray *privateItems;

@end

@implementation BNRItemStore

static BNRItemStore *sharedStore = nil;

+ (BNRItemStore *)sharedStore {
    if (!sharedStore) {
        sharedStore = [[super allocWithZone:nil] init];
    }
    return sharedStore;
}

+ (id)allocWithZone:(struct _NSZone *)zone {
    return [self sharedStore];
}

- (id)init {
    self = [super init];
    if (self) {
        self.privateItems = [[NSMutableArray alloc] init];
    }
    return self;
}

- (NSArray *)allItems {
    return self.privateItems;
}

- (BNRItem *)createItem {
    BNRItem *p = [BNRItem randomItem];
    
    [self.privateItems addObject:p];
    
    return p;
}
@end
