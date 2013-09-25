//
//  TimeViewController.m
//  HypnoTime
//
//  Created by Jeff Y Liu on 9/24/13.
//  Copyright (c) 2013 BigNerdRanch. All rights reserved.
//

#import "TimeViewController.h"

@interface TimeViewController()

@property (nonatomic, weak) IBOutlet UILabel *timeLabel;

@end

@implementation TimeViewController

- (IBAction)showCurrentTime:(id)sender {
    NSDate *now = [NSDate date];
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.timeStyle = NSDateFormatterMediumStyle;
    
    self.timeLabel.text = [formatter stringFromDate:now];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    
    if (self) {
        // Get the tab bar item
        UITabBarItem *tbi = self.tabBarItem;
        
        // Give it a label
        tbi.title = @"Time";
        
        UIImage *i = [UIImage imageNamed:@"Time.png"];
        tbi.image = i;
    }
    
    return self;
}

- (void)viewDidLoad {
    // Always call the super implementation of viewDidLoad
    [super viewDidLoad];
    
    NSLog(@"TimeViewController loaded its view.");
    
    NSLog(@"timeLabel = %@", self.timeLabel);
    self.timeLabel.backgroundColor = [UIColor redColor];
}
@end
