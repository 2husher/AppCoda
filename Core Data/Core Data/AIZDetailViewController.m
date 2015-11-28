//
//  AIZDetailViewController.m
//  Core Data
//
//  Created by X on 27/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZDetailViewController.h"
#import <CoreData/CoreData.h>

@interface AIZDetailViewController () <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *versionTextField;
@property (nonatomic, strong) UITextField *companyTextField;

@end

@implementation AIZDetailViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self addNameTextField];
    [self addNameTextFieldConstraints];

    [self addVersionTextField];
    [self addVersionTextFieldConstraints];

    [self addCompanyTextField];
    [self addCompanyTextFieldConstraints];

    [self addNavItems];
}

- (void)addNavItems
{
    self.navigationItem.title = @"Detail";

    UIBarButtonItem *cancelBtn = [[UIBarButtonItem alloc]
                            initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                            target:self
                            action:@selector(cancel)];
    self.navigationItem.leftBarButtonItem = cancelBtn;

    UIBarButtonItem *saveBtn = [[UIBarButtonItem alloc]
                            initWithBarButtonSystemItem:UIBarButtonSystemItemSave
                            target:self
                            action:@selector(save)];
    self.navigationItem.rightBarButtonItem = saveBtn;
}

- (void)addNameTextField
{
    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.nameTextField.placeholder = @"Name";
    self.nameTextField.borderStyle = UITextBorderStyleRoundedRect;

    self.nameTextField.delegate = self;

    [self.view addSubview:self.nameTextField];
}

- (void)addNameTextFieldConstraints
{
    self.nameTextField.translatesAutoresizingMaskIntoConstraints = NO;

    id topGuide      = self.topLayoutGuide;
    id nameTextField = self.nameTextField;

    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(nameTextField,
                                                                   topGuide);

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[topGuide]-20-[nameTextField]"
                                            options:0
                                            metrics:nil
                                              views:viewsDictionary];

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[nameTextField]-|"
                                            options:0
                                            metrics:nil
                                              views:viewsDictionary];

    [self.view addConstraints:verticalConstraints];
    [self.view addConstraints:horizontalConstraints];
}

- (void)addVersionTextField
{
    self.versionTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.versionTextField.placeholder = @"Version";
    self.versionTextField.borderStyle = UITextBorderStyleRoundedRect;

    self.versionTextField.delegate = self;

    [self.view addSubview:self.versionTextField];
}

- (void)addVersionTextFieldConstraints
{
    self.versionTextField.translatesAutoresizingMaskIntoConstraints = NO;

    id nameTextField    = self.nameTextField;
    id versionTextField = self.versionTextField;

    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(nameTextField,
                                                                versionTextField);

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[nameTextField]-[versionTextField]"
                                            options:0
                                            metrics:nil
                                              views:viewsDictionary];

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[versionTextField]-|"
                                            options:0
                                            metrics:nil
                                              views:viewsDictionary];

    [self.view addConstraints:verticalConstraints];
    [self.view addConstraints:horizontalConstraints];
}

- (void)addCompanyTextField
{
    self.companyTextField = [[UITextField alloc] initWithFrame:CGRectZero];
    self.companyTextField.placeholder = @"Company";
    self.companyTextField.borderStyle = UITextBorderStyleRoundedRect;

    self.companyTextField.delegate = self;

    [self.view addSubview:self.companyTextField];
}

- (void)addCompanyTextFieldConstraints
{
    self.companyTextField.translatesAutoresizingMaskIntoConstraints = NO;

    id companyTextField = self.companyTextField;
    id versionTextField = self.versionTextField;

    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(companyTextField, versionTextField);

    NSArray *verticalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"V:[versionTextField]-[companyTextField]"
                                            options:0
                                            metrics:nil
                                              views:viewsDictionary];

    NSArray *horizontalConstraints =
    [NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[companyTextField]-|"
                                            options:0
                                            metrics:nil
                                              views:viewsDictionary];

    [self.view addConstraints:verticalConstraints];
    [self.view addConstraints:horizontalConstraints];
}

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

- (void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)save
{
    NSManagedObjectContext *context = [self managedObjectContext];

    NSManagedObject *newDevice =
        [NSEntityDescription insertNewObjectForEntityForName:@"Device"
                                      inManagedObjectContext:context];
    [newDevice setValue:self.nameTextField.text forKey:@"name"];
    [newDevice setValue:self.versionTextField.text forKey:@"version"];
    [newDevice setValue:self.companyTextField.text forKey:@"company"];

    NSError *error = nil;
    if (![context save:&error])
    {
        NSLog(@"Can't save! %@ %@", error, [error localizedDescription]);
    }

    [self dismissViewControllerAnimated:YES completion:nil];
}

@end















