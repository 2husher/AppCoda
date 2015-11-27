//
//  AIZViewController.m
//  Core Data
//
//  Created by X on 27/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZViewController.h"
#import "AIZCustomTableViewCell.h"
#import "AIZDetailViewController.h"

static NSString *TableViewCellIdentifier = @"SimpleTableIdentifier";

@interface AIZViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation AIZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addMyTableView];

    [self addNavItem];
}

- (void) addMyTableView
{
    self.tableView = [[UITableView alloc] initWithFrame:self.view.frame
                                                  style:UITableViewStylePlain];

    [self.tableView registerClass:[AIZCustomTableViewCell class]
           forCellReuseIdentifier:TableViewCellIdentifier];

    self.tableView.dataSource = self;
    self.tableView.delegate = self;

    [self.view addSubview:self.tableView];
}

- (void)addNavItem
{
    self.navigationItem.title = @"Devices";
    UIBarButtonItem *bbi = [[UIBarButtonItem alloc]
                            initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                            target:self
                            action:@selector(addNewDevice)];
    self.navigationItem.rightBarButtonItem = bbi;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AIZCustomTableViewCell *cell = nil;

    cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier
                                           forIndexPath:indexPath];

    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

- (void)addNewDevice
{
    AIZDetailViewController *detailVC = [[AIZDetailViewController alloc] init];

    UINavigationController *nc = [[UINavigationController alloc]
                                  initWithRootViewController:detailVC];

    [self presentViewController:nc animated:YES completion:nil];
}

@end


















