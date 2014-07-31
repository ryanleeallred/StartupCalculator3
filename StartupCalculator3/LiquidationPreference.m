//
//  LiquidationPreference.m
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/29/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "LiquidationPreference.h"

@implementation LiquidationPreference

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
    [self setup];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
    [self setup];
}

- (void)setup {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 220, 40)];
    label.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
    label.font = [UIFont fontWithName:@"Avenir Next" size:20];
    self.mainLabel = label;
    [self addSubview:label];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(255, 7, 50, 40)];
    textField.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
    textField.textAlignment = NSTextAlignmentRight;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    textField.delegate = self;
    self.textField = textField;
    [self addSubview:textField];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField endEditing:YES];
    
    self.onTextChange ();
    
    return YES;
}

@end
