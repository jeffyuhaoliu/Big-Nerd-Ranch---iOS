//
//  BNREmployee.h
//  BMITime
//
//  Created by Teech on 9/20/13.
//  Copyright (c) 2013 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRPerson.h"
@class BNRAsset;

@interface BNREmployee : BNRPerson {
    NSMutableSet *_assets;
}

@property (nonatomic) unsigned int employeeID;
@property (nonatomic) NSDate *hireDate;
@property (nonatomic, copy) NSSet *assets;

- (void)addAsset:(BNRAsset *)a;
- (unsigned int)valueOfAssets;

@end
