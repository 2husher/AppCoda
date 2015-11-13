//
//  SimpleTableCell.m
//  incode_3_simpletable
//
//  Created by X on 13/11/15.
//  Copyright (c) 2015 Alex Izotov. All rights reserved.
//

#import "AIZSimpleTableCell.h"

@implementation AIZSimpleTableCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style
              reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self)
    {
        NSLog(@"style: %ld, id: %@", (long)style, reuseIdentifier);
        [self addNameLabel];
        [self addPrepTimeLabel];
        [self addThumbnailImageView];
    }
    return self;
}

- (void)drawRect:(CGRect)rect
{
 //   [self addNameLabel];
//    [self addButton];
}


- (void)addNameLabel
{
    CGRect labelFrame = CGRectMake(90.0f, 8.0f, 200.0f, 20.0f);
    UILabel *nameLabel = [[UILabel alloc] initWithFrame:labelFrame];
    nameLabel.font = [UIFont systemFontOfSize:17.0f];

    self.nameLabel = nameLabel;

    [self.contentView addSubview:nameLabel];
}


- (void)addPrepTimeLabel
{
    CGRect labelFrame = CGRectMake(90.0f, 50.0f, 70.0f, 18.0f);
    UILabel *prepTimeLabel = [[UILabel alloc] initWithFrame:labelFrame];
    prepTimeLabel.font = [UIFont systemFontOfSize:14.0f];

    self.prepTimeLabel = prepTimeLabel;

    [self.contentView addSubview:prepTimeLabel];
}


- (void)addTimeLabel
{
    CGRect labelFrame = CGRectMake(90.0f, 50.0f, 130.0f, 18.0f);
    UILabel *timeLabel = [[UILabel alloc] initWithFrame:labelFrame];
    timeLabel.font = [UIFont systemFontOfSize:14.0f];

    self.timeLabel = timeLabel;

    [self.contentView addSubview:timeLabel];
}


- (void)addThumbnailImageView
{
    CGRect imageFrame = CGRectMake(8.0f, 8.0f, 70.0f, 70.0f);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageFrame];

    self.thumbnailImageView = imageView;

    [self.contentView addSubview:imageView];
}


- (void)addButton
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"Hello World!" forState:UIControlStateNormal];
//    CGFloat x = self.frame.size.width / 2.0 - 50.0f;
//    CGFloat y = self.frame.size.height / 2.0 - 25.0f;
    button.frame = CGRectMake(0, 0, 100.0f, 50.0f);

    [button addTarget:self
               action:@selector(showMessage)
     forControlEvents:UIControlEventTouchUpInside];

    [self.contentView addSubview:button];
}


- (void)showMessage
{
    NSLog(@"Show you!");
}

@end
