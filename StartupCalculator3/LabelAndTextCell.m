//
//  LabelAndTextCell.m
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/26/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "LabelAndTextCell.h"

@implementation LabelAndTextCell 

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
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 200, 40)];
    self.mainLabel = label;
    label.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
    label.font = [UIFont fontWithName:@"Avenir Next" size:20];
    
    
    //rgb(238,237,234)
    [self addSubview:label];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(175, 10, 130, 40)];
    textField.textAlignment = NSTextAlignmentRight;
    textField.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
    textField.delegate = self;
    self.textField = textField;
    [self addSubview:textField];
    
    //(119,123,133);
    
//    [self.textField.placeholder drawPlaceholderInRect:(CGRect) withFont:self.font lineBreakMode:UILineBreakModeTailTruncation alignment:self.textAlignment];
    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self.textField endEditing:YES];
    
    self.onTextChange ();
    
    return YES;
}




@end
