//
//  ABMPlainTableViewCell.m
//  ABMToolbox
//
//  Created by Alex Berger on 4/22/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#import "ABMPlainTableViewCell.h"


@implementation ABMPlainTableViewCell

#pragma mark - cell lifecycle

- (id)initWithStyle:(UITableViewCellStyle)style
    reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style
                reuseIdentifier:reuseIdentifier];
    if (self) {
		[self initCell];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
	if (self = [super initWithCoder:aDecoder]) {
        [self initCell];
    }
    return self;
}

- (void)initCell
{
    _position = PlainTableViewCellPositionMiddle;
	
	[self.textLabel setTextColor:[UIColor abmBlackColor]];
	[self.textLabel setHighlightedTextColor:[UIColor whiteColor]];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
		// move accessory view inside to justify wider cell margins
	CGRect r = self.accessoryView.frame;
    r.origin.x -= 5.0;
    [self.accessoryView setFrame:r];
}

#pragma mark - cell delegate methods

+ (PlainTableViewCellPosition)positionForTableView:(UITableView *)tableView
										 indexPath:(NSIndexPath *)indexPath
{
    if ([tableView.dataSource tableView:tableView
                  numberOfRowsInSection:[indexPath section]] == 1) {
        return PlainTableViewCellPositionBottom;
    }
    if ([indexPath row] == 0) {
        return PlainTableViewCellPositionTop;
    }
    if ([indexPath row] + 1 == [tableView.dataSource tableView:tableView
                                         numberOfRowsInSection:[indexPath section]]) {
        return PlainTableViewCellPositionBottom;
    }
    return PlainTableViewCellPositionMiddle;
}

- (void)prepareForTableView:(UITableView *)tableView
				  withColor:(UIColor *)color
				atIndexPath:(NSIndexPath *)indexPath

{
    _position = [ABMPlainTableViewCell positionForTableView:tableView
												  indexPath:indexPath];
	
    switch (_position) {
		case PlainTableViewCellPositionBottom:			
				// add shadow to the last cell
			self.layer.shadowOffset = CGSizeMake(1.0,
												 0.0);
			self.layer.shadowColor = [[UIColor blackColor] CGColor];
			self.layer.shadowRadius = 2.0;
			self.layer.shadowOpacity = 0.25;
            break;
        default:
            break;
    }
	
	self.backgroundView = [[UIImageView alloc] init];
    self.selectedBackgroundView = [[UIImageView alloc] init];
    
	[((UIImageView *)self.backgroundView) setBackgroundColor:[UIColor abmGrayColor]];
	[((UIImageView *)self.selectedBackgroundView) setBackgroundColor:[UIColor abmBlueColor]];
    
	[self.textLabel setBackgroundColor:[UIColor clearColor]];
}


@end
