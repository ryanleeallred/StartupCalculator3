//
//  RAShareholderDetailViewController.m
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/17/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "RAShareholderDetailViewController.h"

@interface RAShareholderDetailViewController ()

@end

@implementation RAShareholderDetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.title = @"Shareholders";
    
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    UITextField *companyTitle = [[UITextField alloc] initWithFrame:CGRectMake(20, 20, 280, 40)];
    companyTitle.placeholder = @"Company Name";
    companyTitle.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:companyTitle];
    
    UITextField *numShares = [[UITextField alloc] initWithFrame:CGRectMake(20, 80, 280, 40)];
    numShares.placeholder = @"Number of Shares";
    numShares.borderStyle = UITextBorderStyleRoundedRect;
    [self.view addSubview:numShares];
    
//    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(110, 125, 200, 30)];
//    label.text = @"Founding Date";
//    [self.view addSubview:label];
//    
//    UIDatePicker *foundingDate = [[UIDatePicker alloc] initWithFrame:CGRectMake(20, 140, 280, 40)];
//    foundingDate.datePickerMode = UIDatePickerModeDate;
//    [self.view addSubview:foundingDate];
    
    UIButton *done = [[UIButton alloc] initWithFrame:(CGRectMake(85, 350, 140, 60))];
    [done setTitle: @"DONE" forState: UIControlStateNormal];
    done.backgroundColor = [UIColor grayColor];
    [self.view addSubview:done];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
