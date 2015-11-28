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
#import <CoreData/CoreData.h>

static NSString *TableViewCellIdentifier = @"SimpleTableIdentifier";

@interface AIZViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *devices;

@end

@implementation AIZViewController

- (NSManagedObjectContext *)managedObjectContext
{
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)])
    {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addMyTableView];

    [self addNavItem];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest =
        [[NSFetchRequest alloc] initWithEntityName:@"Device"];

    self.devices = [[managedObjectContext executeFetchRequest:fetchRequest
                                                        error:nil] mutableCopy];

    [self.tableView reloadData];
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

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.devices count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    AIZCustomTableViewCell *cell = nil;

    cell = [tableView dequeueReusableCellWithIdentifier:TableViewCellIdentifier
                                           forIndexPath:indexPath];

    NSManagedObject *device = self.devices[indexPath.row];
    cell.textLabel.text = [NSString stringWithFormat:@"%@ %@",
                           [device valueForKey:@"name"],
                           [device valueForKey:@"version"]];
    cell.detailTextLabel.text = [device valueForKey:@"company"];

    return cell;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    AIZDetailViewController *detailVC = [[AIZDetailViewController alloc] init];

    UINavigationController *nc = [[UINavigationController alloc]
                                  initWithRootViewController:detailVC];

    NSManagedObject *selectedDevice = self.devices[indexPath.row];
    detailVC.device = selectedDevice;
    
    [self presentViewController:nc animated:YES completion:nil];
}

- (void)addNewDevice
{
    AIZDetailViewController *detailVC = [[AIZDetailViewController alloc] init];

    UINavigationController *nc = [[UINavigationController alloc]
                                  initWithRootViewController:detailVC];

    [self presentViewController:nc animated:YES completion:nil];
}

- (void)tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSManagedObjectContext *context = [self managedObjectContext];

    if (editingStyle == UITableViewCellEditingStyleDelete)
    {
        [context deleteObject:self.devices[indexPath.row]];

        NSError *error = nil;
        if (![context save:&error])
        {
            NSLog(@"Can't Delete! %@ %@", error, [error localizedDescription]);
            return;
        }

        [self.devices removeObjectAtIndex:indexPath.row];
        [self.tableView deleteRowsAtIndexPaths:@[indexPath]
                              withRowAnimation:UITableViewRowAnimationFade];
    }
}

@end


















