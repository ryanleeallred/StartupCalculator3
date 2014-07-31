//
//  SwitchCell.m
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/26/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "SwitchCell.h"

@implementation SwitchCell

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
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 40)];
    label.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
    label.font = [UIFont fontWithName:@"Avenir Next" size:20];
    self.mainLabel = label;
    [self addSubview:label];
    
    UISwitch *convertibleNoteSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(250, 12, 40, 30)];
    [convertibleNoteSwitch addTarget:self action:@selector(onChange) forControlEvents:UIControlEventValueChanged];
    [self addSubview:convertibleNoteSwitch];
    
}

- (void)onChange {
    self.onSwitchChange (self.anySwitch.on);
    
}

@end
