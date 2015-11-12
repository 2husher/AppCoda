//
//  AIZViewController+AIZInterface.m
//  incode_1_helloworld
//
//  Created by X on 13/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZViewController+AIZInterface.h"

@implementation AIZViewController (AIZInterface)

- (void)addButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Hello World!" forState:UIControlStateNormal];
    CGFloat x = self.view.frame.size.width / 2.0 - 50.0f;
    CGFloat y = self.view.frame.size.height / 2.0 - 25.0f;
    button.frame = CGRectMake(x, y, 100.0f, 50.0f);

    [button addTarget:self
               action:@selector(showMessage)
     forControlEvents:UIControlEventTouchUpInside];

    [self.view addSubview:button];
}

@end
