//
//  ABMPlainTableViewCell.h
//  ABMToolbox
//
//  Created by Alex Berger on 4/22/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    PlainTableViewCellPositionTop = 0,
    PlainTableViewCellPositionMiddle,
    PlainTableViewCellPositionBottom,
} PlainTableViewCellPosition;

@interface ABMPlainTableViewCell : UITableViewCell

- (void)prepareForTableView:(UITableView *)tableView withColor:(UIColor *)color atIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic, assign) PlainTableViewCellPosition position;

@end
