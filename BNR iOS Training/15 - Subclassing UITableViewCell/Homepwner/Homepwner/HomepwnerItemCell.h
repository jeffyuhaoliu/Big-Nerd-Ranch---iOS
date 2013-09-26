//
//  HomepwnerItemCell.h
//  Homepwner
//
//  Created by Jeff Y Liu on 9/25/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomepwnerItemCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *thumbnailView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *serialNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *valueLabel;

@end
