//
//  RAMasterViewController.h
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/15/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RADetailViewController;

#import <CoreData/CoreData.h>

@interface RAMasterViewController : UITableViewController <NSFetchedResultsControllerDelegate>

@property (strong, nonatomic) RADetailViewController *detailViewController;

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
