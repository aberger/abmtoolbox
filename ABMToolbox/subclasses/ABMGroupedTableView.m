//
//  ABMGroupedTableView.m
//  ABMToolbox
//
//  Created by Alex Berger on 11/1/12.
//  Copyright (c) 2012 aberger.me. All rights reserved.
//

#import "ABMGroupedTableView.h"


#define kGroupedTableViewHeaderLabelFont						[UIFont boldSystemFontOfSize:17.0]
#define kGroupedTableViewHeaderLabelColor						[UIColor abmBlackColor]
#define kGroupedTableViewHeaderLabelShadowColor					[UIColor whiteColor]
#define kShadowOffset											CGSizeMake(0.0, 1.0)
#define kGroupedTableViewHeaderHeight							38.0
#define kGroupedTableViewFooterHeight							7.0


@implementation ABMGroupedTableView

#pragma mark - view lifecycle

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self initTableView];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
			  style:(UITableViewStyle)style
{
	if (self = [super initWithFrame:frame
							  style:style]) {
		[self initTableView];
	}
	return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self initTableView];
    }
    return self;
}

- (void)initTableView
{
	[self setBackgroundView:nil];
	[self setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"groupedTableView_bg.png"]]];
	[self setSeparatorStyle:UITableViewCellSeparatorStyleNone];
	
	UIView *tableFooter = [[UIView alloc] initWithFrame:CGRectMake(0.0,
																   0.0,
																   320.0,
																   20.0)];
    [self setTableFooterView:tableFooter];
}

#pragma mark - tableview delegate methods

- (UIView *)tableView:(UITableView *)tableView
viewForHeaderInSection:(NSInteger)section
			withTitle:(NSString *)title
{
	UIView *sectionHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0.0,
																		 0.0,
																		 tableView.width,
																		 kGroupedTableViewHeaderHeight)];
	[sectionHeaderView setBackgroundColor:[UIColor clearColor]];
	
	UILabel *sectionHeaderLabel = [[UILabel alloc] initWithFrame:CGRectMake(19.0,
																			15.0,
																			tableView.width - 40.0,
																			18.0)];
	[sectionHeaderLabel setFont:kGroupedTableViewHeaderLabelFont];
	[sectionHeaderLabel setTextColor:kGroupedTableViewHeaderLabelColor];
	[sectionHeaderLabel setShadowColor:kGroupedTableViewHeaderLabelShadowColor];
	[sectionHeaderLabel setShadowOffset:kShadowOffset];
	[sectionHeaderLabel setBackgroundColor:[UIColor clearColor]];
	[sectionHeaderLabel setText:title];
	
	[sectionHeaderView addSubview:sectionHeaderLabel];
	
	return sectionHeaderView;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
	return kGroupedTableViewHeaderHeight;
}

- (UIView *)tableView:(UITableView *)tableView
viewForFooterInSection:(NSInteger)section
{
    UIView *sectionFooterView = [[UIView alloc] initWithFrame:CGRectMake(0.0,
																		 0.0,
																		 tableView.width,
																		 kGroupedTableViewFooterHeight)];
    [sectionFooterView setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"groupedTableViewCell_footer.png"]]];
	
    return sectionFooterView;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForFooterInSection:(NSInteger)section
{
	return kGroupedTableViewFooterHeight;
}


@end
