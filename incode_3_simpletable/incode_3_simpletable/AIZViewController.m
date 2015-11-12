//
//  ViewController.m
//  incode_3_simpletable
//
//  Created by X on 13/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZViewController.h"

static NSString *TableViewCellIdentifier = @"SimpleTableItem";

@interface AIZViewController () <UITableViewDataSource>
{
    NSArray *tableData;
}

@property (nonatomic, strong) UITableView *myTableView;

@end

@implementation AIZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addMyTableView];

    tableData = [self fillTableData];
}

- (void) addMyTableView
{
    CGRect frame = CGRectMake(0.0f, 20.0f, self.view.bounds.size.width, self.view.bounds.size.height);
    self.myTableView = [[UITableView alloc] initWithFrame:frame
                                                    style:UITableViewStylePlain];
    [self.myTableView registerClass:[UITableViewCell class]
             forCellReuseIdentifier:TableViewCellIdentifier];

    self.myTableView.dataSource = self;

    [self.view addSubview:self.myTableView];
}

- (NSArray *)fillTableData
{
    return [NSArray arrayWithObjects:@"Egg Benedict", @"Mushroom Risotto", @"Full Breakfast", @"Hamburger", @"Ham and Egg Sandwich", @"Creme Brelee", @"White Chocolate Donut", @"Starbucks Coffee", @"Vegetable Curry", @"Instant Noodle with Egg", @"Noodle with BBQ Pork", @"Japanese Noodle with Pork", @"Green Tea", @"Thai Shrimp Cake", @"Angry Birds Cake", @"Ham and Cheese Panini", nil];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = nil;

    cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier forIndexPath:indexPath];

    cell.textLabel.text  = tableData[indexPath.row];
    cell.imageView.image = [UIImage imageNamed:@"creme_brelee"];

    return cell;
}

@end

