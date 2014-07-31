//
//  RAAppearance.m
//  StartupCalculator3
//
//  Created by Ryan Allred on 7/30/14.
//  Copyright (c) 2014 Ryan Allred. All rights reserved.
//

#import "RAAppearance.h"

@implementation RAAppearance


+ (void)load {
    
    [[UILabel appearance] setFont:[UIFont fontWithName:@"Avenir Next" size:20]];
    
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont
                                                                           fontWithName:@"Avenir Next" size:25], NSFontAttributeName,
                                [UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1], NSForegroundColorAttributeName, nil];
    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    
    [[UINavigationBar appearance] setBarTintColor:[UIColor colorWithRed:45.0/255.0 green:50.0/255.0 blue:62.0/255.0 alpha:1]];
    
    [[UILabel appearance] setTextColor:[UIColor colorWithRed:238.0/255.0 green:237.0/255.0 blue:234.0/255.0 alpha:1]];
    
    NSDictionary *moreAttributes = [NSDictionary dictionaryWithObjectsAndKeys:
                                    [UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1], NSForegroundColorAttributeName,
                                nil];
    
    [[UIBarButtonItem appearanceWhenContainedIn:[UINavigationBar class], nil]
     setTitleTextAttributes:moreAttributes
     forState:UIControlStateNormal];
    
    [[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
    
   

    
    //[UIColor colorWithRed:119.0/255.0 green:123.0/255.0 blue:133.0/255.0 alpha:1]
    
    
//    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont
//                                                                           fontWithName:@"Avenir Next" size:20], NSFontAttributeName,
//                                [UIColor whiteColor], NSForegroundColorAttributeName, nil];
//    
//    [[UINavigationBar appearance] setTitleTextAttributes:attributes];
    
    
    //cell.textLabel.textColor = [UIColor colorWithRed:17/255 green:112/255 blue:1/255 alpha:1];
    [UITableViewCell appearanceWhenContainedIn:UITableViewStylePlain, [UIColor colorWithRed:0.0f green:0.0f blue:90.0f/255.0f alpha:1], nil];
    
    
    
    [UILabel appearanceWhenContainedIn:UITableViewStylePlain, [UIColor colorWithRed:0.0f green:0.0f blue:90.0f/255.0f alpha:1], nil];
    
    [[UILabel appearance] setTintColor:[UIColor colorWithRed:0.0f green:0.0f blue:90.0f/255.0f alpha:1]];
    
    [[UITableViewCell appearance] setBackgroundColor:[UIColor colorWithRed:74.0f/255.0f green:80.0f/255.0f blue:96.0f/255.0f alpha:1]];
    
    //[[UItableViewCell appearance] ]
    
    
}



    
    
    
    
    




@end


