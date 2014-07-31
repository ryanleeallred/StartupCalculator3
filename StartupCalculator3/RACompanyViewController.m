//
//  RACompanyViewController.m
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/17/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "RACompanyViewController.h"
#import "RACompanyDetailViewController.h"
#import "RASummaryViewController.h"

#import "CoreDataHelper.h"
#import "Company.h"
#import "Shareholder.h"

@interface RACompanyViewController () <UITableViewDelegate>

@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation RACompanyViewController

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
    
    self.title = @"Your Companies";
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"identifier"];
    tableView.delegate = self;
    self.tableView = tableView;
    //[tableView setSeparatorInset:UIEdgeInsetsZero];
    tableView.backgroundColor = [UIColor colorWithRed:45.0/255.0 green:50.0/255.0 blue:62.0/255.0 alpha:1];
    //tableView.backgroundColor = [UIColor colorWithRed:67.0f/255.0f green:70.0f/255.0f blue:85.0f/255.0f alpha:1];
    //tableView.backgroundColor = [UIColor colorWithRed:74.0f/255.0f green:80.0f/255.0f blue:96.0f/255.0f alpha:1];
    //rgb(74,80,96)
    //rgb(46,50,62) - even darker
    [self.view addSubview:tableView];
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"identifier"];
    tableView.dataSource = self;
    //tableView.dataSource = companyDataSource;
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(addCompany)];
    self.navigationItem.rightBarButtonItem = addButton;
    
}

- (void)addCompany {
    
    RACompanyDetailViewController *viewController = [RACompanyDetailViewController new];
    [self.navigationController pushViewController:viewController animated:YES];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    RASummaryViewController *viewController = [RASummaryViewController new];
    viewController.company = [self.fetchedResultsController objectAtIndexPath:indexPath];
    [self.navigationController pushViewController:viewController animated:YES];
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryNone;
    cell.contentView.backgroundColor = [UIColor blackColor];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[self.fetchedResultsController fetchedObjects] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [UITableViewCell new];
    Company *company = [self.fetchedResultsController objectAtIndexPath:indexPath]; 
    cell.textLabel.text = company.name;
    cell.textLabel.textColor = [UIColor colorWithRed:238.0f green:237.0f blue:234.0f/255.0f alpha:1];
    cell.textLabel.font = [UIFont fontWithName:@"Avenir Next" size:20];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
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

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath
                    :(NSIndexPath *)indexPath{
    return 60;
}


- (void)viewWillDisappear:(BOOL)animated{
     self.title = @"";
}
- (void)viewWillAppear:(BOOL)animated{
    self.title = @"Your Companies";
}




@end
