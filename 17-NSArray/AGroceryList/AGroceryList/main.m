//
//  main.m
//  AGroceryList
//
//  Created by Jeff Y Liu on 9/21/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        NSMutableArray *arr = [NSMutableArray array];
        [arr addObjectsFromArray:@[@"Loaf of bread", @"Container of milk", @"Stick of butter"]];
        for (NSString *item in arr) {
            NSLog(@"Item: %@", item);
        }
    }
    return 0;
}

