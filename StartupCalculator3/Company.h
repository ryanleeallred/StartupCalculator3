//
//  Company.h
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/22/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class ExitEvent, Round, Shareholder;

@interface Company : NSManagedObject

@property (nonatomic, retain) NSDate * foundingDate;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSNumber * numberOfShares;
@property (nonatomic, retain) NSSet *advisors;
@property (nonatomic, retain) NSSet *employees;
@property (nonatomic, retain) ExitEvent *exitEvent;
@property (nonatomic, retain) NSSet *founders;
@property (nonatomic, retain) NSSet *rounds;
@end

@interface Company (CoreDataGeneratedAccessors)

- (void)addAdvisorsObject:(Shareholder *)value;
- (void)removeAdvisorsObject:(Shareholder *)value;
- (void)addAdvisors:(NSSet *)values;
- (void)removeAdvisors:(NSSet *)values;

- (void)addEmployeesObject:(Shareholder *)value;
- (void)removeEmployeesObject:(Shareholder *)value;
- (void)addEmployees:(NSSet *)values;
- (void)removeEmployees:(NSSet *)values;

- (void)addFoundersObject:(Shareholder *)value;
- (void)removeFoundersObject:(Shareholder *)value;
- (void)addFounders:(NSSet *)values;
- (void)removeFounders:(NSSet *)values;

- (void)addRoundsObject:(Round *)value;
- (void)removeRoundsObject:(Round *)value;
- (void)addRounds:(NSSet *)values;
- (void)removeRounds:(NSSet *)values;

@end
