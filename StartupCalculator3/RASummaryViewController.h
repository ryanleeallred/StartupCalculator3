//
//  RAMenuDetailViewController.h
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/17/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Company.h"
#import <XYPieChart/XYPieChart.h>

@interface RASummaryViewController : UIViewController <XYPieChartDataSource, XYPieChartDelegate>

@property (nonatomic, strong) Company *company;


@property (strong, nonatomic) IBOutlet XYPieChart *pieChartRight;
@property (strong, nonatomic) IBOutlet XYPieChart *pieChartLeft;
@property (strong, nonatomic) IBOutlet UILabel *percentageLabel;
@property (strong, nonatomic) IBOutlet UILabel *selectedSliceLabel;
@property (strong, nonatomic) IBOutlet UITextField *numOfSlices;
@property (strong, nonatomic) IBOutlet UISegmentedControl *indexOfSlices;
@property (strong, nonatomic) IBOutlet UIButton *downArrow;
@property (nonatomic, strong) NSMutableArray *slices;
@property (nonatomic, strong) NSArray        *sliceColors;

- (NSUInteger)numberOfSlicesInPieChart:(XYPieChart *)pieChart;
- (CGFloat)pieChart:(XYPieChart *)pieChart valueForSliceAtIndex:(NSUInteger)index;

@end
