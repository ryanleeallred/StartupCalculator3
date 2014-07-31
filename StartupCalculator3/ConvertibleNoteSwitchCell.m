//
//  ConvertibleNoteSwitchCell.m
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/25/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "ConvertibleNoteSwitchCell.h"


@implementation ConvertibleNoteSwitchCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)awakeFromNib
{
    [self setup];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setup {
    
    UILabel *convertibleNote = [[UILabel alloc] initWithFrame:CGRectMake(10, 5, 200, 40)];
    convertibleNote.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
    convertibleNote.font = [UIFont fontWithName:@"Avenir Next" size:20];
    convertibleNote.text = @"Convertible Note";
    [self addSubview:convertibleNote];
    
    UISwitch *convertibleNoteSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(250, 12, 40, 30)];
    [convertibleNoteSwitch addTarget:self action:@selector(onChange) forControlEvents:UIControlEventValueChanged];
    [self addSubview:convertibleNoteSwitch];
    
}

- (void)onChange {
    self.onSwitchChange (self.anySwitch.on);
}

@end
