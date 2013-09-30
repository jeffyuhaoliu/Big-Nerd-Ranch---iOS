//
//  BNRRSSFeed.h
//  Nerdfeed
//
//  Created by Jeff Y Liu on 9/26/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BNRJSONObject.h"

@interface BNRRSSFeed : NSObject <BNRJSONObject>

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong, readonly) NSMutableArray *items;

@end
