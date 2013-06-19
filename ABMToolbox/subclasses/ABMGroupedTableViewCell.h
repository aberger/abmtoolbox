//
//  ABMGroupedTableViewCell.h
//  ABMToolbox
//
//  Created by Alex Berger on 11/1/12.
//  Copyright (c) 2012 aberger.me. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef enum {
    GroupedTableViewCellPositionTop = 0,
    GroupedTableViewCellPositionMiddle,
    GroupedTableViewCellPositionBottom,
    GroupedTableViewCellPositionTopAndBottom
} GroupedTableViewCellPosition;

typedef enum {
	TableViewCellBackgroundColorWhite = 0,
	TableViewCellBackgroundColorGray,
	TableViewCellBackgroundColorRed
} TableViewCellBackgroundColor;

@interface ABMGroupedTableViewCell : UITableViewCell


- (void)prepareForTableView:(UITableView *)tableView withColor:(UIColor *)color atIndexPath:(NSIndexPath *)indexPath;
+ (CGFloat)tableView:(UITableView *)tableView neededHeightForIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, assign) GroupedTableViewCellPosition position;
@property (nonatomic, assign) TableViewCellBackgroundColor color;

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UILabel *descriptionLabel;
@property (nonatomic, strong) UILabel *detailLabel;


@end
