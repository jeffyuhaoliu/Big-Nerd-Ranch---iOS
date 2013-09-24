//
//  BNRItem.m
//  Homepwner
//
//  Created by Jeff Y Liu on 9/22/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+ (id)item {
//    return [[self alloc] init];
    BNRItem *item = [[self alloc] init];
    return item;
}

- (NSString *)description {
//    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    NSString *str = [NSString stringWithFormat:@"%@ (%@): Worth $%i, recorded on %@", _itemName, _serialNumber, _valueInDollars, _dateCreated];
    return str;
}

- (id)init {
    self = [super init];
    _dateCreated = [NSDate date];
    return self;
}

- (id)initWithItemName:(NSString *)itemName valueInDollars:(int)valueInDollars serialNumber:(NSString *)serialNumber {
    self = [self init];
    self.itemName = itemName;
    self.serialNumber = serialNumber;
    self.valueInDollars = valueInDollars;
    return self;
}
@end
