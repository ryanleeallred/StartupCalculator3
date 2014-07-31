//
//  LabelAndTextCell.h
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/26/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LabelAndTextCell : UITableViewCell <UITextFieldDelegate>

@property (nonatomic, strong) void (^onTextChange)();
@property (nonatomic, strong) UILabel *mainLabel;
@property (nonatomic, strong) UITextField *textField;

@end
