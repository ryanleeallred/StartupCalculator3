//
//  Shareholder.h
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/22/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Company;

@interface Shareholder : NSManagedObject

@property (nonatomic, retain) NSNumber * equity;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) Company *isCompanyAdvisor;
@property (nonatomic, retain) Company *isCompanyEmployee;
@property (nonatomic, retain) Company *isCompanyFounder;
@property (nonatomic, retain) Company *company;

@end
