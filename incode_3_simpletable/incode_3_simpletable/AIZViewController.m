//
//  ViewController.m
//  incode_3_simpletable
//
//  Created by X on 13/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZViewController.h"
#import "AIZTableData.h"

static NSString *TableViewCellIdentifier = @"SimpleTableItem";

@interface AIZViewController () <UITableViewDataSource>
{
    AIZTableData *tableData;
}

@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation AIZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addMyTableView];

     tableData = [[AIZTableData alloc] init];
}

- (void) addMyTableView
{
    CGRect frame = CGRectMake(0.0f,
                              20.0f,
                              self.view.bounds.size.width,
                              self.view.bounds.size.height);

    self.myTableView = [[UITableView alloc] initWithFrame:frame
                                                    style:UITableViewStylePlain];

    [self.myTableView registerClass:[UITableViewCell class]
             forCellReuseIdentifier:TableViewCellIdentifier];

    self.myTableView.dataSource = self;

    [self.view addSubview:self.myTableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData.data count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;

    cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier
                                           forIndexPath:indexPath];

    cell.textLabel.text  = tableData.data[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:tableData.thumbnails[indexPath.row]];

    return cell;
}

@end

