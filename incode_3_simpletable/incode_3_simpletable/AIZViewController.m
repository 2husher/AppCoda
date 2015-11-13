//
//  ViewController.m
//  incode_3_simpletable
//
//  Created by X on 13/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZViewController.h"
#import "AIZTableData.h"
#import "AIZSimpleTableCell.h"


static NSString *TableViewCellIdentifier = @"SimpleTableItem";


@interface AIZViewController () <UITableViewDataSource, UITableViewDelegate>
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

    [self.myTableView registerClass:[AIZSimpleTableCell class]
             forCellReuseIdentifier:TableViewCellIdentifier];

    self.myTableView.dataSource = self;
    self.myTableView.delegate = self;

    [self.view addSubview:self.myTableView];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [tableData.data count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AIZSimpleTableCell *cell = nil;

    cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier
                                           forIndexPath:indexPath];

    cell.nameLabel.text = tableData.data[indexPath.row];
    cell.prepTimeLabel.text = @"Prep time:";
    cell.thumbnailImageView.image = [UIImage imageNamed:tableData.thumbnails[indexPath.row]];

//    NSLog(@"tableData: %@", tableData.data[indexPath.row]);
//    NSLog(@"cell.nameLabel: %@", cell.nameLabel.text);

    //cell.textLabel.text  = tableData.data[indexPath.row];
    //cell.imageView.image = [UIImage imageNamed:tableData.thumbnails[indexPath.row]];

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 86.0f;
}


@end

