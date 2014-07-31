//
//  RARoundDetailViewController.m
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/17/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//


#import "RAInvestmentViewController.h"

#import "LabelAndTextCell.h"
#import "PercentageCell.h"
#import "SwitchCell.h"
#import "LiquidationPreference.h"

#import "TPKeyboardAvoidingTableView.h"


@interface RAInvestmentViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UIView *view;
@property (nonatomic, strong) UITableView *tableView;

//@property (nonatomic, strong) UITableView *tableView;
@property int numRounds;
@property BOOL convertibleNote;

@end

@implementation RAInvestmentViewController

- (void)viewWillAppear:(BOOL)animated {
    
    self.title = @"Raise Investment";
    self.convertibleNote = 0;
}

- (void)viewDidLoad
{

    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Raise Investment";
    
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    TPKeyboardAvoidingTableView *tableView = [[TPKeyboardAvoidingTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor colorWithRed:45.0/255.0 green:50.0/255.0 blue:62.0/255.0 alpha:1];
    //r[tableView setSeparatorInset:UIEdgeInsetsZero];
    //rgb(67,70,85)
    //tableView.style = [UITableViewStyle UITableViewStyleGrouped];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [tableView registerClass:[LabelAndTextCell class] forCellReuseIdentifier:@"labelAndText"];
    [tableView registerClass:[PercentageCell class] forCellReuseIdentifier:@"percentage"];
    [tableView registerClass:[SwitchCell class] forCellReuseIdentifier:@"switch"];
    [tableView registerClass:[LiquidationPreference class] forCellReuseIdentifier:@"liquidation"];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addRound)];
    self.navigationItem.rightBarButtonItem = addButton;

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.numRounds < 2)
    {
        self.numRounds = 2;
    }
    
    return self.numRounds;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section)
    {
        case 0:
            return @"Seed Round via Convertible Note?";
            break;
        case 1:
            return @"Seed Round";
            break;
        case 2:
            return @"Series A";
            break;
        case 3:
            return @"Series B";
            break;
        case 4:
            return @"Series C";
            break;
        case 5:
            return @"Series D";
            break;
        case 6:
            return @"Series E";
            break;
        case 7:
            return @"Series F";
            break;
        case 8:
            return @"Series G";
            break;
        case 9:
            return @"Series H";
            break;
        case 10:
            return @"Series I";
            break;
        case 11:
            return @"Series J";
            break;
        case 12:
            return @"Series K";
            break;
        case 13:
            return @"Series L";
            break;
        case 14:
            return @"Series M";
            break;
        case 15:
            return @"Series N";
            break;
        case 16:
            return @"Series O";
            break;
        case 17:
            return @"Series P";
            break;
        case 18:
            return @"Series Q";
            break;
        case 19:
            return @"Series R";
            break;
        case 20:
            return @"Series S";
            break;
        case 21:
            return @"Series T";
            break;
        case 22:
            return @"Series U";
            break;
        case 23:
            return @"Series W";
            break;
        case 24:
            return @"Series V";
            break;
        case 25:
            return @"Series W";
            break;
        case 27:
            return @"Series X";
            break;
        case 28:
            return @"Series Y";
            break;
        case 29:
            return @"Series Z";
            break;
        default:
            return @"That's too many Rounds!!";
            break;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    if (section == 0)
    {
        return 1;
    }
    else if (section == 1)
    {
        if (self.convertibleNote == YES)
        {
            return 4;
        }
        else
        {
            return 5;
        }
    }
    else
    {
        return 4;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0){
        SwitchCell *convertibleNoteCell = [tableView dequeueReusableCellWithIdentifier:@"switch" forIndexPath:indexPath];
        convertibleNoteCell.mainLabel.text = @"Convertible Note";
        convertibleNoteCell.onSwitchChange = ^(BOOL on){
            
            [self changeBoolValue];
            
        };
        [self.tableView addSubview: convertibleNoteCell];
        return convertibleNoteCell;
    }
    
    if (self.convertibleNote == YES)
    {
        if (indexPath.section == 1 && indexPath.row == 0) {
            LabelAndTextCell *investmentAmountCell = [tableView dequeueReusableCellWithIdentifier:@"labelAndText" forIndexPath:indexPath];
            investmentAmountCell.mainLabel.text = @"Investment Amount";
            investmentAmountCell.textField.placeholder = @"100000";
            investmentAmountCell.textField.keyboardType = UIKeyboardTypeNumberPad;
            [investmentAmountCell.textField setValue:[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
                                       forKeyPath:@"_placeholderLabel.textColor"];
            investmentAmountCell.onTextChange = ^{
                
                NSLog(@"Did finish Editing");
                
            };
            [self.tableView addSubview: investmentAmountCell];
            return investmentAmountCell;
        }
        else if (indexPath.section == 1 && indexPath.row == 1) {
            LabelAndTextCell *valuationCapCell = [tableView dequeueReusableCellWithIdentifier:@"labelAndText" forIndexPath:indexPath];
            valuationCapCell.mainLabel.text = @"Valuation Cap";
            valuationCapCell.textField.placeholder = @"1000000";
            valuationCapCell.textField.keyboardType = UIKeyboardTypeNumberPad;
            [valuationCapCell.textField setValue:[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
                                       forKeyPath:@"_placeholderLabel.textColor"];
            valuationCapCell.onTextChange = ^{
                
                NSLog(@"Did finish Editing");
                
            };
            [self.tableView addSubview: valuationCapCell];
            return valuationCapCell;
        }
        else if (indexPath.section == 1 && indexPath.row == 2) {
            PercentageCell *discountToNextRoundCell = [tableView dequeueReusableCellWithIdentifier:@"percentage" forIndexPath:indexPath];
            discountToNextRoundCell.mainLabel.text = @"Discount";
            discountToNextRoundCell.textField.placeholder = @"0";
            [discountToNextRoundCell.textField setValue:[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
                                       forKeyPath:@"_placeholderLabel.textColor"];
            discountToNextRoundCell.onTextChange = ^{
                
                NSLog(@"Did finish Editing");
                
            };
            [self.tableView addSubview: discountToNextRoundCell];
            return discountToNextRoundCell;
        }
        else if (indexPath.section == 1 && indexPath.row == 3) {
            PercentageCell *optionsPoolCell = [tableView dequeueReusableCellWithIdentifier:@"percentage" forIndexPath:indexPath];
            optionsPoolCell.mainLabel.text = @"Options Pool";
            optionsPoolCell.textField.placeholder = @"0";
            [optionsPoolCell.textField setValue:[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
                                       forKeyPath:@"_placeholderLabel.textColor"];
            optionsPoolCell.onTextChange = ^{
                
                NSLog(@"Did finish Editing");
                
            };
            [self.tableView addSubview: optionsPoolCell];
            return optionsPoolCell;
        }
    }
    else
    {
        if (indexPath.section == 1 && indexPath.row == 0) {
            LabelAndTextCell *investmentAmountCell = [tableView dequeueReusableCellWithIdentifier:@"labelAndText" forIndexPath:indexPath];
            investmentAmountCell.mainLabel.text = @"Investment Amount";
            investmentAmountCell.textField.placeholder = @"100000";
            investmentAmountCell.textField.keyboardType = UIKeyboardTypeNumberPad;
            [investmentAmountCell.textField setValue:[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
                                       forKeyPath:@"_placeholderLabel.textColor"];
            investmentAmountCell.onTextChange = ^{
                
                NSLog(@"Did finish Editing");
                
            };
            [self.tableView addSubview: investmentAmountCell];
            return investmentAmountCell;
        }
        else if (indexPath.section == 1 && indexPath.row == 1) {
            LabelAndTextCell *premoneyValuationCell = [tableView dequeueReusableCellWithIdentifier:@"labelAndText" forIndexPath:indexPath];
            premoneyValuationCell.mainLabel.text = @"Premoney Valuation";
            premoneyValuationCell.textField.placeholder = @"1000000";
            premoneyValuationCell.textField.keyboardType = UIKeyboardTypeNumberPad;
            [premoneyValuationCell.textField setValue:[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
                                       forKeyPath:@"_placeholderLabel.textColor"];
            premoneyValuationCell.onTextChange = ^{
                
                NSLog(@"Did finish Editing");
                
            };
            [self.tableView addSubview: premoneyValuationCell];
            return premoneyValuationCell;
        }
        else if (indexPath.section == 1 && indexPath.row == 2) {
            LiquidationPreference *liquidationPreference = [tableView dequeueReusableCellWithIdentifier:@"liquidation" forIndexPath:indexPath];
            liquidationPreference.mainLabel.text = @"Liquidation Preference";
            liquidationPreference.textField.placeholder = @"0";
            [liquidationPreference.textField setValue:[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
                                       forKeyPath:@"_placeholderLabel.textColor"];
            liquidationPreference.onTextChange = ^{
                
                NSLog(@"Did finish Editing");
                
            };
            [self.tableView addSubview: liquidationPreference];
            return liquidationPreference;
        }
        else if (indexPath.section == 1 && indexPath.row == 3) {
            SwitchCell *participatingPreferredCell = [tableView dequeueReusableCellWithIdentifier:@"switch" forIndexPath:indexPath];
            participatingPreferredCell.mainLabel.text = @"Participating";
            [self.tableView addSubview: participatingPreferredCell];
            return participatingPreferredCell;
        }
        else if (indexPath.section == 1 && indexPath.row == 4) {
            PercentageCell *optionsPoolCell = [tableView dequeueReusableCellWithIdentifier:@"percentage" forIndexPath:indexPath];
            optionsPoolCell.mainLabel.text = @"Options Pool";
            optionsPoolCell.textField.placeholder = @"0";
            [optionsPoolCell.textField setValue:[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
                                       forKeyPath:@"_placeholderLabel.textColor"];
            [self.tableView addSubview: optionsPoolCell];
            optionsPoolCell.onTextChange = ^{
                
                NSLog(@"Did finish Editing");
                
            };
            return optionsPoolCell;
        }
    }
    if (indexPath.section > 1 && indexPath.row == 0) {
        LabelAndTextCell *investmentAmountCell = [tableView dequeueReusableCellWithIdentifier:@"labelAndText" forIndexPath:indexPath];
        investmentAmountCell.mainLabel.text = @"Investment Amount";
        investmentAmountCell.textField.placeholder = @"100000";
        investmentAmountCell.textField.keyboardType = UIKeyboardTypeNumberPad;
        [investmentAmountCell.textField setValue:[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
                                   forKeyPath:@"_placeholderLabel.textColor"];
        investmentAmountCell.onTextChange = ^{
            
            NSLog(@"Did finish Editing");
            
        };
        [self.tableView addSubview: investmentAmountCell];
        return investmentAmountCell;
    }
    else if (indexPath.section > 1 && indexPath.row == 1) {
        LabelAndTextCell *valuationCapCell = [tableView dequeueReusableCellWithIdentifier:@"labelAndText" forIndexPath:indexPath];
        valuationCapCell.mainLabel.text = @"Valuation Cap";
        valuationCapCell.textField.placeholder = @"1000000";
        valuationCapCell.textField.keyboardType = UIKeyboardTypeNumberPad;
        [valuationCapCell.textField setValue:[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
                                   forKeyPath:@"_placeholderLabel.textColor"];
        valuationCapCell.onTextChange = ^{
            
            NSLog(@"Did finish Editing");
            
        };
        [self.tableView addSubview: valuationCapCell];
        return valuationCapCell;
           }
    else if (indexPath.section > 1 && indexPath.row == 2) {
        PercentageCell *discountToNextRoundCell = [tableView dequeueReusableCellWithIdentifier:@"percentage" forIndexPath:indexPath];
        discountToNextRoundCell.mainLabel.text = @"Discount";
        discountToNextRoundCell.textField.placeholder = @"0";
        [discountToNextRoundCell.textField setValue:[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
                                   forKeyPath:@"_placeholderLabel.textColor"];
        discountToNextRoundCell.onTextChange = ^{
            
            NSLog(@"Did finish Editing");
            
        };
        [self.tableView addSubview: discountToNextRoundCell];
        return discountToNextRoundCell;

    }
    else if (indexPath.section > 1 && indexPath.row == 3) {
        PercentageCell *optionsPoolCell = [tableView dequeueReusableCellWithIdentifier:@"percentage" forIndexPath:indexPath];
        optionsPoolCell.mainLabel.text = @"Options Pool";
        optionsPoolCell.textField.placeholder = @"0";
        [optionsPoolCell.textField setValue:[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
                                   forKeyPath:@"_placeholderLabel.textColor"];
        optionsPoolCell.onTextChange = ^{
            
            NSLog(@"Did finish Editing");
            
        };
        [self.tableView addSubview: optionsPoolCell];
        return optionsPoolCell;
    }
    else
    {
        UITableViewCell *cell = [UITableViewCell new];
        return cell;
    }
}

- (void)changeBoolValue {
    
    if (self.convertibleNote == 1)
    {
        self.convertibleNote = 0;
        NSLog(@"Changed to NO");
    }
    else
    {
        self.convertibleNote = 1;
        NSLog(@"Changed to YES");
    }

    [self.tableView reloadData];
    
}

- (void)addRound {
    self.numRounds++;
    [self.tableView reloadData];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 55;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0)
    {
        return 70;
    }
    else
    {
        return 0;
    }
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor blackColor];
}

-(void)viewWillDisappear:(BOOL)animated{
    self.title = @"";
}

@end


