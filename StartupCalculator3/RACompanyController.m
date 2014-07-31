//
//  RACompanyController.m
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/22/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "RACompanyController.h"

@interface RACompanyController ()

@end

@implementation RACompanyController

+ (RACompanyController *)sharedInstance {
    static RACompanyController *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [RACompanyController new];
    });
    return sharedInstance;
}

@end
