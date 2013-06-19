//
//  ABMPlainTableView.m
//  ABMToolbox
//
//  Created by Alex Berger on 4/23/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#define kTableViewBackgroundColor						[UIColor abmGrayColor]


#import "ABMPlainTableView.h"


@implementation ABMPlainTableView

#pragma mark - view lifecycle

- (id)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
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
		// set table view background view
	UIView *backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0.0,
																	  0.0,
																	  self.size.width,
																	  self.size.width)];
    [backgroundView setBackgroundColor:kTableViewBackgroundColor];
    [self setBackgroundView:backgroundView];
	
		// set table view separator
	UIColor *color = [UIColor colorWithPatternImage:[UIImage imageNamed:@"plainTableView_separatorColor.png"]];
	[self setSeparatorColor:color];
}


@end
