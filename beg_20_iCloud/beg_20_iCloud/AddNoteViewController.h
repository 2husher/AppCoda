//
//  AddNoteViewController.h
//  beg_20_iCloud
//
//  Created by X on 04/09/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddNoteViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *noteTextField;

- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
