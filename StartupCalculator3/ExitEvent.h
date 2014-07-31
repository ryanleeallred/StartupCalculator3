//
//  ExitEvent.h
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/16/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Company;

@interface ExitEvent : NSManagedObject

@property (nonatomic, retain) NSDate * exitDate;
@property (nonatomic, retain) NSNumber * exitValuation;
@property (nonatomic, retain) Company *company;

@end
