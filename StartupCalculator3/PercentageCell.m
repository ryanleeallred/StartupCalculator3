//
//  PercentageCell.m
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/26/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "PercentageCell.h"

@implementation PercentageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        [self setup];
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
}

- (void)setup {
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 160, 40)];
    label.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
    label.font = [UIFont fontWithName:@"Avenir Next" size:20];
    self.mainLabel = label;
    [self addSubview:label];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(235, 7, 50, 40)];
    textField.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
    textField.textAlignment = NSTextAlignmentRight;
    textField.keyboardType = UIKeyboardTypeNumberPad;
    textField.delegate = self;
    self.textField = textField;
    [self addSubview:textField];
    
    UILabel *percentageLabel = [[UILabel alloc]initWithFrame:CGRectMake(290, 15, 20, 20)];
    percentageLabel.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
    label.font = [UIFont fontWithName:@"Avenir Next" size:20];
    percentageLabel.text = @"%";
    [self addSubview:percentageLabel];

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField endEditing:YES];
    
    self.onTextChange ();
    
    return YES;
}

@end
