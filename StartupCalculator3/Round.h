//
//  Round.h
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/16/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Company;

@interface Round : NSManagedObject

@property (nonatomic, retain) NSNumber * amountRaised;
@property (nonatomic, retain) NSNumber * valuationCap;
@property (nonatomic, retain) NSDate * fundingDate;
@property (nonatomic, retain) NSNumber * liquidationPreference;
@property (nonatomic, retain) NSNumber * participating;
@property (nonatomic, retain) NSNumber * interestRate;
@property (nonatomic, retain) NSNumber * discountToRound;
@property (nonatomic, retain) NSNumber * convertibleNote;
@property (nonatomic, retain) Company *company;

@end
