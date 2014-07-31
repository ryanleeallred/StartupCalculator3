//
//  ConvertibleNoteSwitchCell.h
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/25/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConvertibleNoteSwitchCell : UITableViewCell

@property (nonatomic, strong) void (^onSwitchChange) (BOOL on);
@property (nonatomic, strong) UISwitch *anySwitch;

@end
