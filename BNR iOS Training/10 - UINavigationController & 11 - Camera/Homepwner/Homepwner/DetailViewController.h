//
//  DetailViewController.h
//  Homepwner
//
//  Created by Jeff Y Liu on 9/24/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BNRItem.h"
#import "BNRImageStore.h"

@interface DetailViewController : UIViewController

@property (nonatomic, strong) BNRItem *item;

@end
