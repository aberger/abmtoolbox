//
//  ABMGroupedTableView.h
//  ABMToolbox
//
//  Created by Alex Berger on 11/1/12.
//  Copyright (c) 2012 aberger.me. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface ABMGroupedTableView : UITableView

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section withTitle:(NSString *)title;
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section;
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;


@end
