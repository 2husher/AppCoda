//
//  AIZAppDelegate.m
//  incode_1_helloworld
//
//  Created by X on 12/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZAppDelegate.h"
#import "AIZViewController.h"

@implementation AIZAppDelegate

- (BOOL)          application:(UIApplication *)application
didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];

    self.AIZViewController = [[AIZViewController alloc]
                           initWithNibName: nil
                           bundle:nil];
    self.window.rootViewController = self.AIZViewController;

    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
