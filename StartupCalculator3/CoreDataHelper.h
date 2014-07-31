//
//  CoreDataHelper.h
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/22/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CoreDataHelper : NSObject

+ (CoreDataHelper *)sharedInstance;
- (NSManagedObjectContext *)managedObjectContext;
- (void) save;
- (void)setUpSampleData: (NSInteger)withIdentifier;
- (void)logCurrentData;

@end
