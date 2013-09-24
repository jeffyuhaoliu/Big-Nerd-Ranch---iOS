//
//  BNRItem.h
//  Homepwner
//
//  Created by Jeff Y Liu on 9/22/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic) NSString *itemName;
@property (nonatomic) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly) NSDate *dateCreated;

+ (id)item;
- (id)initWithItemName:(NSString *)itemName valueInDollars:(int)valueInDollars serialNumber:(NSString *)serialNumber;
@end
