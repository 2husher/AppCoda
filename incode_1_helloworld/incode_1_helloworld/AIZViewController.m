//
//  AIZViewController.m
//  incode_1_helloworld
//
//  Created by X on 12/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZViewController.h"
#import "AIZViewController+AIZInterface.h"

@interface AIZViewController ()

@end

@implementation AIZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addButton];
}



- (void)showMessage
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"My First App"
                                                    message:@"Hello, World!"
                                                   delegate:self
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
}

@end
