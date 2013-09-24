//
//  BNREmployee.h
//  BMITime
//
//  Created by Jeff Y Liu on 9/21/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "BNRPerson.h"

@interface BNREmployee : BNRPerson

// atomic will lock the property - this is default
// nonatomic will not block the property - most property in iOS uses nonatomic
@property (nonatomic) unsigned int employeeID;
@property (nonatomic) unsigned int officeAlarmCode;
@property (nonatomic) NSDate *hireDate;

- (double)yearsOfEmployment;

@end
