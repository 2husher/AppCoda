//
//  SimpleTableCell.h
//  incode_3_simpletable
//
//  Created by X on 13/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AIZSimpleTableCell : UITableViewCell

@property (nonatomic, weak) UILabel *nameLabel;
@property (nonatomic, weak) UILabel *prepTimeLabel;
@property (nonatomic, weak) UILabel *timeLabel;
@property (nonatomic, weak) UIImageView *thumbnailImageView;

@end
