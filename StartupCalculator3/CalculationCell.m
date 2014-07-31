//
//  CalculationCell.m
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/26/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "CalculationCell.h"

@implementation CalculationCell

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
    // Initializat Code
    [self setup];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setup {
    UILabel *name = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 120, 40)];
    name.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
    name
    .font = [UIFont fontWithName:@"Avenir Next" size:20];
    self.nameLabel = name;

    UILabel *equity = [[UILabel alloc] initWithFrame:CGRectMake(150, 0, 100, 30)];
    self.equity = equity;
    self.equity.text = @"Equity:";
    self.equity.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
    UILabel *equityValue = [[UILabel alloc] initWithFrame:CGRectMake(205, 0, 100, 30)];
    self.equityValue = equityValue;
    
    UILabel *value = [[UILabel alloc] initWithFrame:CGRectMake(150, 30, 100, 30)];
    self.value = value;
    self.value.text = @"Value:";
    self.value.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
    UILabel *dollarValue = [[UILabel alloc] initWithFrame:CGRectMake(205, 30, 100, 30)];
    self.dollarValue = dollarValue;
    ;
    
    [self addSubview:equityValue];
    [self addSubview:dollarValue];
    [self addSubview:name];
    [self addSubview:equity];
    [self addSubview:value];
    
}

@end
