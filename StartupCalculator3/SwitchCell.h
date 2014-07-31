//
//  SwitchCell.h
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/26/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SwitchCell : UITableViewCell

@property (nonatomic, strong) void (^onSwitchChange) (BOOL on);
@property (nonatomic, strong) UILabel *mainLabel;
@property (nonatomic, strong) UISwitch *anySwitch;

@end
