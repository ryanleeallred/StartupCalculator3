//
//  RACompanyDetailViewController.m
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/17/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "RACompanyDetailViewController.h"
#import "CoreDataHelper.h"
#import "RACompanyController.h"
#import "LabelAndTextCell.h"

#import "Company.h"
#import "Shareholder.h"
#import "PercentageCell.h"

#import "TPKeyboardAvoidingTableView.h"

@interface RACompanyDetailViewController () <UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property int numFounders;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSMutableArray *foundersArray;

@property (nonatomic, strong) Shareholder *founder;
@property (nonatomic, strong) Company *company;

@end

@implementation RACompanyDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do anyitional setup after loading the view.
    
    
    UIView *view = [UIView new];
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    
    //[scrollView contentSizeToFit];
    
    self.title = @"New Company";
    
    TPKeyboardAvoidingTableView *tableView = [[TPKeyboardAvoidingTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableView.backgroundColor = [UIColor colorWithRed:45.0/255.0 green:50.0/255.0 blue:62.0/255.0 alpha:1];
    //[tableView setSeparatorInset:UIEdgeInsetsZero];
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"identifier"];
    tableView.dataSource = self;
    tableView.delegate = self;
    
    [tableView registerClass:[LabelAndTextCell class] forCellReuseIdentifier:@"labelAndText"];
    [tableView registerClass:[PercentageCell class] forCellReuseIdentifier:@"percentage"];
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addFounder)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    Company *company = [NSEntityDescription insertNewObjectForEntityForName:@"Company" inManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
    
    self.company = company;
    
    Shareholder *founder = [NSEntityDescription insertNewObjectForEntityForName:@"Shareholder" inManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
    
    founder.name = @"Founder1";
    
    [self.foundersArray addObject:founder];
    
    NSMutableArray *foundersArray = [NSMutableArray new];
    
    [foundersArray addObject:founder];
    
    self.foundersArray = foundersArray;
}

-(void)viewWillDisappear:(BOOL)animated{
     self.title = @"";
    
    for (Shareholder *founder in self.foundersArray) {
        founder.company = self.company;
    }
    
    [[CoreDataHelper sharedInstance] save];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath
                    :(NSIndexPath *)indexPath{
        return 60;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)addFounder {
    
    NSLog(@"Hitting the plus button");
    
    Shareholder *founder = [NSEntityDescription insertNewObjectForEntityForName:@"Shareholder" inManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
    
    [self.foundersArray addObject:founder];
    
    [self.tableView reloadData];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0)
    {
        return 40;
    }
    else
    {
        return 0;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (section == 0)
    {
        return 1;
    }
    else
    {
        return 2;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *blankCell = [UITableViewCell new];
    
    if (indexPath.section == 0 && indexPath.row == 0)
    {
        LabelAndTextCell *companyNameCell = [tableView dequeueReusableCellWithIdentifier:@"labelAndText" forIndexPath:indexPath];
        //companyNameCell.delegate = self;
        companyNameCell.tag = 0;
        companyNameCell.mainLabel.text = @"Company Name";
        companyNameCell.textField.placeholder = @"Name";
        [companyNameCell.textField setValue:[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
                                   forKeyPath:@"_placeholderLabel.textColor"];
        
        __weak LabelAndTextCell *weakCell = companyNameCell;
        
        companyNameCell.onTextChange = ^{
            
            NSLog(@"Did finish Editing");
            self.company.name = weakCell.textField.text;
        };
        [self.tableView addSubview: companyNameCell];
        return companyNameCell;
    }
    else if (indexPath.section > 0 && indexPath.row == 0)
    {
        //Shareholder *founder = [NSEntityDescription insertNewObjectForEntityForName:@"Shareholder" inManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
        
        
        LabelAndTextCell *founderNameCell = [tableView dequeueReusableCellWithIdentifier:@"labelAndText" forIndexPath:indexPath];
        //companyNameCell.delegate = self;
        founderNameCell.tag = 0;
        founderNameCell.mainLabel.text = @"Founder Name";
        founderNameCell.textField.placeholder = @"Name";
        [founderNameCell.textField setValue:[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
                                   forKeyPath:@"_placeholderLabel.textColor"];
        
        __weak LabelAndTextCell *weakCell = founderNameCell;
        
        founderNameCell.onTextChange = ^{
            NSLog(@"Did finish Editing");
            
            Shareholder *localfounder = [self.foundersArray objectAtIndex:indexPath.section-1];
            localfounder.name = weakCell.textField.text;
            
        };
        [self.tableView addSubview:founderNameCell];
        return founderNameCell;
    }
    else if (indexPath.section > 0 && indexPath.row == 1)
    {
        PercentageCell *founderEquityCell = [tableView dequeueReusableCellWithIdentifier:@"percentage" forIndexPath:indexPath];
        founderEquityCell.mainLabel.text = @"Percent Equity";
        founderEquityCell.textField.placeholder = @"0";
        [founderEquityCell.textField setValue:[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
                                   forKeyPath:@"_placeholderLabel.textColor"];
        founderEquityCell.onTextChange = ^{
            
            NSLog(@"Did finish Editing");
            
        };
        [self.tableView addSubview: founderEquityCell];
        return founderEquityCell;
    }
    else
    {
        return blankCell;
    }
}

#pragma mark - UITextFieldDelegate Methods

-(void)textFieldDidEndEditing:(UITextField *)textField{
    
    //Company *company = [NSEntityDescription insertNewObjectForEntityForName:@"Company" inManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
    
    //Shareholder *founder = [NSEntityDescription insertNewObjectForEntityForName:@"Shareholder" inManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
    
//    if (textField.tag == 0)
//    {
//        company.name = textField.text;
//    }
//    if (textField.tag == 1)
//    {
//        founder.name = textField.text;
//        founder.company = company;
//    }
//    if (textField.tag == 2)
//    {
//        NSNumber *equity = [NSNumber numberWithDouble:[textField.text doubleValue]];
//        founder.equity = equity;
//        founder.company = company;
//    }
    
//    [RACompanyController sharedInstance].company = company;
    
//    company = nil;
//    
//    [textField resignFirstResponder];
}

- (NSFetchedResultsController *)fetchedResultsController
{
    if (_fetchedResultsController != nil)
    {
        return _fetchedResultsController;
    }
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Company" inManagedObjectContext:[CoreDataHelper sharedInstance].managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = [NSArray arrayWithObjects:sortDescriptor, nil];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    NSFetchedResultsController *frc = [[NSFetchedResultsController alloc] initWithFetchRequest:fetchRequest
                                                                          managedObjectContext:[CoreDataHelper sharedInstance].managedObjectContext
                                                                            sectionNameKeyPath:nil
                                                                                     cacheName:@"Company"];
    //frc.delegate = self;
    self.fetchedResultsController = frc;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error])
    {
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	}
    return _fetchedResultsController;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.foundersArray count] + 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section)
    {
        case 0:
            return @"Company Name";
            break;
        case 1:
            return @"Founder 1";
            break;
        case 2:
            return @"Founder 2";
            break;
        case 3:
            return @"Founder 3";
            break;
        case 4:
            return @"Founder 4";
            break;
        case 5:
            return @"Founder 5";
            break;
        case 6:
            return @"Founder 6";
            break;
        case 7:
            return @"Founder 7";
            break;
        case 8:
            return @"Founder 8";
            break;
        case 9:
            return @"Founder 9";
            break;
        case 10:
            return @"Founder 10";
            break;
        case 11:
            return @"Founder 11";
            break;
        case 12:
            return @"Founder 12";
            break;
        case 13:
            return @"Founder 13";
            break;
        case 14:
            return @"Founder 14";
            break;
        case 15:
            return @"Founder 15";
            break;
        default:
            return @"That's too many Founders!!";
            break;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor blackColor];
}

-(void)viewWillAppear:(BOOL)animated{
    self.title = @"New Company";
}

@end
