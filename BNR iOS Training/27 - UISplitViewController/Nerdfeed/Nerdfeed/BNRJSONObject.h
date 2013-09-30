//
//  BNRJSONObject.h
//  Nerdfeed
//
//  Created by Jeff Y Liu on 9/26/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol BNRJSONObject <NSObject>

- (void)readFromJSONObject:(NSDictionary *)jsonObject;

@end
