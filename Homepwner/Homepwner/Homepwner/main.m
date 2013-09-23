//
//  main.m
//  Homepwner
//
//  Created by Jeff Y Liu on 9/22/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRItem.h"
#import "BNRInheritedItem.h"

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
//        BNRItem *item = [[BNRItem alloc] init];
        // Initialize with class method
//        BNRItem *item = [BNRItem item];
//        item.itemName = @"SomeItem";
//        item.serialNumber = @"7UAC9";
//        item.valueInDollars = 40;
//        BNRItem *item = [[BNRItem alloc] initWithItemName:@"SomeItem" valueInDollars:40 serialNumber:@"7UAC9"];
//        BNRInheritedItem *item = [[BNRInheritedItem alloc] initWithItemName:@"SomeItem"
//                                                             valueInDollars:40
//                                                               serialNumber:@"7UAC9"];
        BNRInheritedItem *item = [BNRInheritedItem item];
        NSLog(@"Item Info: %@", item);
    }
    return 0;
}

