//
//  LiquidationPreference.h
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/29/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LiquidationPreference : UITableViewCell <UITextFieldDelegate>

@property (nonatomic, strong) void (^onTextChange)();
@property (nonatomic, strong) UILabel *mainLabel;
@property (nonatomic, strong) UITextField *textField;

@end
