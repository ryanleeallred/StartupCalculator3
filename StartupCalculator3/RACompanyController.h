//
//  RACompanyController.h
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/22/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"

@interface RACompanyController : NSObject

@property (nonatomic, strong) Company *company;

+ (RACompanyController *)sharedInstance;

@end
