//
//  RAMenuDetailViewController.m
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/17/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "RAInvestmentViewController.h"
#import "RASummaryViewController.h"

#import "CVCell.h"
#import "LabelAndTextCell.h"
#import "CalculationCell.h"

#import "CoreDataHelper.h"
#import "Shareholder.h"

#import <XYPieChart/XYPieChart.h>
#import <QuartzCore/QuartzCore.h>

#import "TPKeyboardAvoidingTableView.h"

@interface RASummaryViewController () <UITableViewDelegate, UITableViewDataSource, UICollectionViewDataSource, UICollectionViewDelegate, NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) UIView *circleView;
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) NSArray *foundersArray;

@end

@implementation RASummaryViewController

@synthesize pieChartRight = _pieChart;
@synthesize pieChartLeft = _pieChartCopy;
@synthesize percentageLabel = _percentageLabel;
@synthesize selectedSliceLabel = _selectedSlice;
@synthesize numOfSlices = _numOfSlices;
@synthesize indexOfSlices = _indexOfSlices;
@synthesize downArrow = _downArrow;
@synthesize slices = _slices;
@synthesize sliceColors = _sliceColors;

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
    
    self.title = @"Summary";
    
    UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    [super viewDidLoad];
    
    TPKeyboardAvoidingTableView *tableView = [[TPKeyboardAvoidingTableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"identifier"];
    tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    tableView.backgroundColor = [UIColor colorWithRed:45.0/255.0 green:50.0/255.0 blue:62.0/255.0 alpha:1];
    //[tableView setSeparatorInset:UIEdgeInsetsZero];
    tableView.delegate = self;
    tableView.dataSource = self;
    self.tableView = tableView;
    [self.view addSubview:tableView];
    
    [tableView registerClass:[CalculationCell class] forCellReuseIdentifier:@"calculate"];
    
    
    self.foundersArray = [NSArray arrayWithArray: [self.company.founders allObjects]];
    

    
}

- (void)viewDidUnload
{
    [self setPieChartLeft:nil];
    [self setPieChartRight:nil];
    [self setPercentageLabel:nil];
    [self setSelectedSliceLabel:nil];
    [self setIndexOfSlices:nil];
    [self setNumOfSlices:nil];
    [self setDownArrow:nil];
    [super viewDidUnload];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.contentView.backgroundColor = [UIColor blackColor];
    
    if (indexPath.row == 0 && indexPath.section == 0)
    {
        RAInvestmentViewController *viewController = [RAInvestmentViewController new];
        [self.navigationController pushViewController:viewController animated:YES];
        UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
        cell.contentView.backgroundColor = [UIColor blackColor];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0){
       return 60;
    }
    else if (indexPath.section == 1 && indexPath.row == 0){
        return 60;
    }
    else if (indexPath.section == 1 && indexPath.row == 1){
        return 315;
    }
    else {
        return 60;
    }
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 1;
    }
    else if (section == 1){
        return 2; // Amount Raised + Pie Chart
    }
    else if (section == 2) {
        return [self.foundersArray count]; // Return number of Founders
    }
    else if (section == 3) {
        return 1; // Always one for Options Pool
    }
    else if (section == 4){
        return 3; // Return number of Rounds
    }
    else
        return 1;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    switch (section)
    {
        case 0:
            return @"Raise Funds";
            break;
        case 1:
            return @"Summary";
            break;
        case 2:
            return @"Founders";
            break;
        case 3:
            return @"Options Pool";
            break;
        case 4:
            return @"Investors";
            break;
        default:
            return @"Section Title";
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0 && indexPath.row == 0) {
        
        UITableViewCell *raiseRoundCell = [UITableViewCell new];
        raiseRoundCell.textLabel.text = @"Raise a New Round";
        raiseRoundCell.textLabel.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
        raiseRoundCell.textLabel.font = [UIFont fontWithName:@"Avenir Next" size:20];

        return raiseRoundCell;
    }
    else if (indexPath.section == 1 && indexPath.row == 0){
        LabelAndTextCell *exitValuationCell = [LabelAndTextCell new];
        exitValuationCell.mainLabel.text = @"Exit Valuation";
        exitValuationCell.textField.placeholder = @"10000000";
        [exitValuationCell.textField setValue:[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
                        forKeyPath:@"_placeholderLabel.textColor"];
        exitValuationCell.onTextChange = ^{
            
            NSLog(@"Did finish Editing");
            
        };
        return exitValuationCell;
    }
    else if (indexPath.section == 1 && indexPath.row == 1){
        UITableViewCell *summaryCell = [UITableViewCell new];
        
//        self.circleView = [[UIView alloc] initWithFrame:CGRectMake(10,20,300,300)];
//        //self.circleView.alpha = 0.5;
//        self.circleView.layer.cornerRadius = 150;
//        self.circleView.backgroundColor = [UIColor blueColor];
        
        UIImage *piechart = [UIImage imageNamed:@"piechart.png"];
        UIImageView *pieChart = [[UIImageView alloc] initWithImage:piechart];
        pieChart.contentMode = UIViewContentModeScaleAspectFit;
        pieChart.clipsToBounds = YES;
        
        [summaryCell addSubview:pieChart];
        
        self.slices = [NSMutableArray arrayWithCapacity:10];
        
        for(int i = 0; i < 5; i ++)
        {
            NSNumber *one = [NSNumber numberWithInt:rand()%60+20];
            [_slices addObject:one];
        }
        
        [self.pieChartLeft setDataSource:self];
        [self.pieChartLeft setStartPieAngle:M_PI_2];
        [self.pieChartLeft setAnimationSpeed:1.0];
        [self.pieChartLeft setLabelFont:[UIFont fontWithName:@"DBLCDTempBlack" size:24]];
        [self.pieChartLeft setLabelRadius:160];
        [self.pieChartLeft setShowPercentage:YES];
        [self.pieChartLeft setPieBackgroundColor:[UIColor colorWithWhite:0.95 alpha:1]];
        [self.pieChartLeft setPieCenter:CGPointMake(240, 240)];
        [self.pieChartLeft setUserInteractionEnabled:NO];
        [self.pieChartLeft setLabelShadowColor:[UIColor blackColor]];
        
        [self.pieChartRight setDelegate:self];
        [self.pieChartRight setDataSource:self];
        [self.pieChartRight setPieCenter:CGPointMake(240, 240)];
        [self.pieChartRight setShowPercentage:NO];
        [self.pieChartRight setLabelColor:[UIColor blackColor]];
        
        [self.percentageLabel.layer setCornerRadius:90];
        
        self.sliceColors =[NSArray arrayWithObjects:
                           [UIColor colorWithRed:246/255.0 green:155/255.0 blue:0/255.0 alpha:1],
                           [UIColor colorWithRed:129/255.0 green:195/255.0 blue:29/255.0 alpha:1],
                           [UIColor colorWithRed:62/255.0 green:173/255.0 blue:219/255.0 alpha:1],
                           [UIColor colorWithRed:229/255.0 green:66/255.0 blue:115/255.0 alpha:1],
                           [UIColor colorWithRed:148/255.0 green:141/255.0 blue:139/255.0 alpha:1],nil];
        
        //rotate up arrow
        self.downArrow.transform = CGAffineTransformMakeRotation(M_PI);
        
        //[summaryCell addSubview:self.circleView];
        return summaryCell;
    }
    else if (indexPath.section == 2){
        
        CalculationCell *founderCell = [tableView dequeueReusableCellWithIdentifier:@"calculate" forIndexPath:indexPath];
        //Shareholder *shareholder = [self.foundersArray objectAtIndex:indexPath.row];
        founderCell.equityValue.text = @"28%";
        founderCell.equityValue.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
        founderCell.dollarValue.text = @"$2,800,000";
        founderCell.dollarValue.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
        founderCell.nameLabel.text = @"Founder 1";
        
        UILabel *colorLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 0, 20, 60)];
        colorLabel.backgroundColor = [UIColor colorWithRed:0.0/255.0 green:163.0/255.0 blue:215.0/255.0 alpha:1];
        [founderCell addSubview:colorLabel];
        return founderCell;
    }
    else if (indexPath.section == 3 && indexPath.row == 0) {
        CalculationCell *founderCell = [tableView dequeueReusableCellWithIdentifier:@"calculate" forIndexPath:indexPath];
        //Shareholder *shareholder = [self.foundersArray objectAtIndex:indexPath.row];
        founderCell.equityValue.text = @"27%";
        founderCell.equityValue.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
        founderCell.dollarValue.text = @"$2,700,000";
        founderCell.dollarValue.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
        founderCell.nameLabel.text = @"Options Pool";
        
        UILabel *colorLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 0, 20, 60)];
        colorLabel.backgroundColor = [UIColor colorWithRed:72.0/255.0 green:187.0/255.0 blue:0.0/255.0 alpha:1];
        [founderCell addSubview:colorLabel];
        return founderCell;
    }
    else if (indexPath.section == 4 && indexPath.row == 0){
        CalculationCell *founderCell = [tableView dequeueReusableCellWithIdentifier:@"calculate" forIndexPath:indexPath];
        //Shareholder *shareholder = [self.foundersArray objectAtIndex:indexPath.row];
        founderCell.equityValue.text = @"23%";
        founderCell.equityValue.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
        founderCell.dollarValue.text = @"$2,300,000";
        founderCell.dollarValue.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
        founderCell.nameLabel.text = @"Investor 1";
        
        UILabel *colorLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 0, 20, 60)];
        colorLabel.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:0.0/255.0 blue:94.0/255.0 alpha:1];
        [founderCell addSubview:colorLabel];
        return founderCell;
    }
    else if (indexPath.section == 4 && indexPath.row == 1){
        CalculationCell *founderCell = [tableView dequeueReusableCellWithIdentifier:@"calculate" forIndexPath:indexPath];
        //Shareholder *shareholder = [self.foundersArray objectAtIndex:indexPath.row];
        founderCell.equityValue.text = @"12%";
        founderCell.equityValue.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
        founderCell.dollarValue.text = @"$1,200,000";
        founderCell.dollarValue.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
        founderCell.nameLabel.text = @"Investor 2";
        
        UILabel *colorLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 0, 20, 60)];
        colorLabel.backgroundColor = [UIColor colorWithRed:132.0/255.0 green:121.0/255.0 blue:119.0/255.0 alpha:1];
        [founderCell addSubview:colorLabel];
        return founderCell;
    }
    else if (indexPath.section == 4 && indexPath.row == 2){
        CalculationCell *founderCell = [tableView dequeueReusableCellWithIdentifier:@"calculate" forIndexPath:indexPath];
        //Shareholder *shareholder = [self.foundersArray objectAtIndex:indexPath.row];
        founderCell.equityValue.text = @"11%";
        founderCell.equityValue.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
        founderCell.dollarValue.text = @"$1,100,000";
        founderCell.dollarValue.textColor = [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1];
        founderCell.nameLabel.text = @"Investor 3";
        
        UILabel *colorLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 0, 20, 60)];
        colorLabel.backgroundColor = [UIColor colorWithRed:255.0/255.0 green:125.0/255.0 blue:0.0/255.0 alpha:1];
        [founderCell addSubview:colorLabel];
        return founderCell;
    }
    else {
        UITableViewCell *blankCell = [UITableViewCell new];
        return blankCell;
    }
    
}

- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return 32;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)cv cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{

    UICollectionViewCell *cell=[self.collectionView dequeueReusableCellWithReuseIdentifier:@"cellIdentifier" forIndexPath:indexPath];

    cell.backgroundColor=[UIColor whiteColor];
    return cell;
    
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(155, 155);
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
    frc.delegate = self;
    self.fetchedResultsController = frc;
    
	NSError *error = nil;
	if (![self.fetchedResultsController performFetch:&error])
    {
	    NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
	}
    
    return _fetchedResultsController;
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller
{
    [self.tableView reloadData];
}





- (void)viewWillAppear:(BOOL)animated
{
    self.title = @"Summary";
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.pieChartLeft reloadData];
    [self.pieChartRight reloadData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    self.title = @"";
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return UIInterfaceOrientationIsLandscape(interfaceOrientation);
}

- (IBAction)SliceNumChanged:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSInteger num = self.numOfSlices.text.intValue;
    if(btn.tag == 100 && num > -10)
        num = num - ((num == 1)?2:1);
    if(btn.tag == 101 && num < 10)
        num = num + ((num == -1)?2:1);
    
    self.numOfSlices.text = [NSString stringWithFormat:@"%d",num];
}

- (IBAction)clearSlices {
    [_slices removeAllObjects];
    [self.pieChartLeft reloadData];
    [self.pieChartRight reloadData];
}

- (IBAction)addSliceBtnClicked:(id)sender
{
    NSInteger num = [self.numOfSlices.text intValue];
    if (num > 0) {
        for (int n=0; n < abs(num); n++)
        {
            NSNumber *one = [NSNumber numberWithInt:rand()%60+20];
            NSInteger index = 0;
            if(self.slices.count > 0)
            {
                switch (self.indexOfSlices.selectedSegmentIndex) {
                    case 1:
                        index = rand()%self.slices.count;
                        break;
                    case 2:
                        index = self.slices.count - 1;
                        break;
                }
            }
            [_slices insertObject:one atIndex:index];
        }
    }
    else if (num < 0)
    {
        if(self.slices.count <= 0) return;
        for (int n=0; n < abs(num); n++)
        {
            NSInteger index = 0;
            if(self.slices.count > 0)
            {
                switch (self.indexOfSlices.selectedSegmentIndex) {
                    case 1:
                        index = rand()%self.slices.count;
                        break;
                    case 2:
                        index = self.slices.count - 1;
                        break;
                }
                [_slices removeObjectAtIndex:index];
            }
        }
    }
    [self.pieChartLeft reloadData];
    [self.pieChartRight reloadData];
}

- (IBAction)updateSlices
{
    for(int i = 0; i < _slices.count; i ++)
    {
        [_slices replaceObjectAtIndex:i withObject:[NSNumber numberWithInt:rand()%60+20]];
    }
    [self.pieChartLeft reloadData];
    [self.pieChartRight reloadData];
}

- (IBAction)showSlicePercentage:(id)sender {
    UISwitch *perSwitch = (UISwitch *)sender;
    [self.pieChartRight setShowPercentage:perSwitch.isOn];
}

#pragma mark - XYPieChart Data Source

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart
{
    return self.slices.count;
}

- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index
{
    return [[self.slices objectAtIndex:index] intValue];
}

- (UIColor *)pieChart:(XYPieChart *)pieChart colorForSliceAtIndex:(NSUInteger)index
{
    if(pieChart == self.pieChartRight) return nil;
    return [self.sliceColors objectAtIndex:(index % self.sliceColors.count)];
}

#pragma mark - XYPieChart Delegate
- (void)pieChart:(XYPieChart *)pieChart willSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will select slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart willDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"will deselect slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart didDeselectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did deselect slice at index %d",index);
}
- (void)pieChart:(XYPieChart *)pieChart didSelectSliceAtIndex:(NSUInteger)index
{
    NSLog(@"did select slice at index %d",index);
    self.selectedSliceLabel.text = [NSString stringWithFormat:@"$%@",[self.slices objectAtIndex:index]];
}



@end
