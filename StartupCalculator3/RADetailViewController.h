//
//  RADetailViewController.h
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/15/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RADetailViewController : UIViewController <UISplitViewControllerDelegate>

@property (strong, nonatomic) id detailItem;

@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;
@end
