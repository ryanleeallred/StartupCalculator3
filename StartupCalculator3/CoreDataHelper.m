//
//  CoreDataHelper.m
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/22/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "CoreDataHelper.h"
#import "RAAppDelegate.h"
#import "Round.h"
#import "ExitEvent.h"
#import "Company.h"
#import "Shareholder.h"

@implementation CoreDataHelper

+ (CoreDataHelper *)sharedInstance {
    static CoreDataHelper *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [CoreDataHelper new];
    });
    return sharedInstance;
}

- (NSManagedObjectContext *)managedObjectContext{
    
    RAAppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
    
    NSManagedObjectContext *managedObjectContext = appDelegate.managedObjectContext;
    
    return managedObjectContext;
}

- (void) save{
    [self.managedObjectContext save:nil];
}

-(void)setUpSampleData: (NSInteger)withIdentifier{
    
    Company *company = [NSEntityDescription insertNewObjectForEntityForName:@"Company" inManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
    
    company.name = @"Super Awesome Company";
    
    Round *round1 = [NSEntityDescription insertNewObjectForEntityForName:@"Round" inManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
    round1.amountRaised = @20000;
    round1.participating = @1;
    round1.interestRate = @3;
    round1.convertibleNote = @1;
    round1.valuationCap = @100000;
    round1.discountToRound = @4;
    round1.company = company;
    
    Round *round2 = [NSEntityDescription insertNewObjectForEntityForName:@"Round" inManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
    round2.amountRaised = @20000;
    round2.participating = @1;
    round2.interestRate = @3;
    round2.convertibleNote = @1;
    round2.valuationCap = @100000;
    round2.discountToRound = @4;
    round2.company = company;

    Round *round3 = [NSEntityDescription insertNewObjectForEntityForName:@"Round" inManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
    round3.amountRaised = @20000;
    round3.participating = @1;
    round3.interestRate = @3;
    round3.convertibleNote = @1;
    round3.valuationCap = @100000;
    round3.discountToRound = @4;
    round3.company = company;
    
    Shareholder *shareholder1 = [NSEntityDescription insertNewObjectForEntityForName:@"Shareholder" inManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
    shareholder1.name = @"Ryan Allred";
    shareholder1.equity = @40;
    shareholder1.company = company;
    
    Shareholder *shareholder2 = [NSEntityDescription insertNewObjectForEntityForName:@"Shareholder" inManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
    shareholder2.name = @"Caleb Hicks";
    shareholder2.equity = @40;
    shareholder2.company = company;
    
//    @dynamic name;
//    @dynamic equity;
//    @dynamic isCompanyFounder;
//    @dynamic isCompanyAdvisor;
//    @dynamic isCompanyEmployee;
    
    ExitEvent *exitEvent = [NSEntityDescription insertNewObjectForEntityForName:@"ExitEvent" inManagedObjectContext:[[CoreDataHelper sharedInstance] managedObjectContext]];
    
    exitEvent.exitValuation = @1000000;
    exitEvent.company = company;
    
    
//    @dynamic exitDate;
//    @dynamic exitValuation;
//    @dynamic company;
    
//    @dynamic amountRaised;
//    @dynamic valuationCap;
//    @dynamic fundingDate;
//    @dynamic liquidationPreference;
//    @dynamic participating;
//    @dynamic interestRate;
//    @dynamic discountToRound;
//    @dynamic convertibleNote;
//    @dynamic company;
    
//    @dynamic foundingDate;
//    @dynamic name;
//    @dynamic numberOfShares;
//    @dynamic founders;
//    @dynamic advisors;
//    @dynamic employees;
//    @dynamic rounds;
//    @dynamic exitEvent;

    
}

- (void)logCurrentData{
    
    NSFetchRequest* companyRequest = [NSFetchRequest fetchRequestWithEntityName:@"Company"];
    NSArray *companies = [[[CoreDataHelper sharedInstance]managedObjectContext] executeFetchRequest:companyRequest error:NULL];
    
    for (Company *company in companies) {
        NSLog(@"Company Name: %@", company.name);
        
        for (Shareholder *shareholder in company.founders) {
            NSLog(@"Founder Name: %@", shareholder.name );
        }
        
        for (Round *round in company.rounds) {
            NSLog(@"Round: %@", round);
        }
        
        NSLog(@"ExitEvent: %@", company.exitEvent );
        
    }
}

@end


