//
//  CalculationCell.h
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/26/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculationCell : UITableViewCell

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *equity;
@property (nonatomic, strong) UILabel *equityValue;
@property (nonatomic, strong) UILabel *value;
@property (nonatomic, strong) UILabel *dollarValue;

@end
