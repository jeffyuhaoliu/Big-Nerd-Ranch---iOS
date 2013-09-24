//
//  BNREmployee.h
//  BMITime
//
//  Created by Jeff Y Liu on 9/21/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "BNRPerson.h"
// Using @class gives the compiler less information, but makes processing of this particular file faster
@class BNRAsset;

@interface BNREmployee : BNRPerson {
    NSMutableArray *_assets;
}

// atomic will lock the property - this is default
// nonatomic will not block the property - most property in iOS uses nonatomic
@property (nonatomic) unsigned int employeeID;
@property (nonatomic) unsigned int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;
@property (nonatomic, copy) NSArray *assets;

- (void)addAsset:(BNRAsset *)a;
- (unsigned int)valueOfAssets;

@end
