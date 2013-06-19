//
//  ABMGroupedTableViewCell.m
//  ABMToolbox
//
//  Created by Alex Berger on 11/1/12.
//  Copyright (c) 2012 aberger.me. All rights reserved.
//

#import "ABMGroupedTableViewCell.h"


#define kGroupedTableViewCellSingleRowImageCapInset				UIEdgeInsetsMake(5.0, 0.0, 8.0, 0.0)
#define kGroupedTableViewCellTopRowImageCapInset				UIEdgeInsetsMake(5.0, 0.0, 1.0, 0.0)
#define kGroupedTableViewCellBottomRowImageCapInset				UIEdgeInsetsMake(1.0, 0.0, 5.0, 0.0)
#define kGroupedTableViewCellMiddleRowImageCapInset				UIEdgeInsetsMake(1.0, 0.0, 1.0, 0.0)
#define kCellLabelWidth											130.0
#define kCellLabelMargin										13.0
#define kDescriptionLabelFont									[UIFont boldSystemFontOfSize:17.0]
#define kDetailLabelFont										[UIFont systemFontOfSize:17.0]


@implementation ABMGroupedTableViewCell

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
    _position = GroupedTableViewCellPositionMiddle;
	
	_label = [[UILabel alloc] initWithFrame:CGRectZero];
    [_label setBackgroundColor:[UIColor clearColor]];
    [_label setTextColor:[UIColor abmBlackColor]];
	[_label setHighlightedTextColor:[UIColor whiteColor]];
    [_label setFont:kDescriptionLabelFont];
    [_label setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:_label];
	
	_descriptionLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [_descriptionLabel setBackgroundColor:[UIColor clearColor]];
    [_descriptionLabel setTextColor:[UIColor abmBlackColor]];
	[_descriptionLabel setHighlightedTextColor:[UIColor whiteColor]];
    [_descriptionLabel setFont:kDescriptionLabelFont];
    [_descriptionLabel setTextAlignment:NSTextAlignmentLeft];
    [self addSubview:_descriptionLabel];
    
    _detailLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    [_detailLabel setBackgroundColor:[UIColor clearColor]];
    [_detailLabel setTextColor:[UIColor abmBlackColor]];
	[_detailLabel setHighlightedTextColor:[UIColor whiteColor]];
    [_detailLabel setFont:kDetailLabelFont];
    [_detailLabel setTextAlignment:NSTextAlignmentRight];
    [self addSubview:_detailLabel];
}

- (void)layoutSubviews
{
	[super layoutSubviews];
	
		// move accessory view inside to justify wider cell margins
	CGRect r = self.accessoryView.frame;
    r.origin.x -= 5.0;
    [self.accessoryView setFrame:r];
	
		// place labels and subviews
	if (_label.text != nil) {
		[_label setFrame:CGRectMake(self.contentView.left + kCellLabelMargin,
									self.contentView.origin.y,
									2 * kCellLabelWidth,
									self.contentView.height)];
	}
	
	if (_descriptionLabel.text != nil) {
		[_descriptionLabel setFrame:CGRectMake(self.contentView.left + kCellLabelMargin,
											   self.contentView.origin.y,
											   kCellLabelWidth,
											   self.contentView.height)];
		[_detailLabel setFrame:CGRectMake(self.contentView.right - kCellLabelWidth - kCellLabelMargin,
										  self.contentView.origin.y,
										  kCellLabelWidth,
										  self.contentView.height) ];
	}
}

#pragma mark - cell delegate methods

+ (GroupedTableViewCellPosition)positionForTableView:(UITableView *)tableView
                                    indexPath:(NSIndexPath *)indexPath
{
    if ([tableView.dataSource tableView:tableView
                  numberOfRowsInSection:[indexPath section]] == 1) {
        return GroupedTableViewCellPositionTopAndBottom;
    }
    if ([indexPath row] == 0) {
        return GroupedTableViewCellPositionTop;
    }
    if ([indexPath row] + 1 == [tableView.dataSource tableView:tableView
                                         numberOfRowsInSection:[indexPath section]]) {
        return GroupedTableViewCellPositionBottom;
    }
    return GroupedTableViewCellPositionMiddle;
}

+ (TableViewCellBackgroundColor)colorForTableView:(UITableView *)tableView
										withColor:(UIColor *)color
{
	if ([color isEqual:[UIColor abmBlackColor]]) {
		return TableViewCellBackgroundColorGray;
	}
	else if ([color isEqual:[UIColor redColor]]) {
		return TableViewCellBackgroundColorRed;
	}
	return TableViewCellBackgroundColorWhite;
}

+ (CGFloat)neededHeightForPosition:(GroupedTableViewCellPosition)position
						tableStyle:(UITableViewStyle)style
{
    if (style == UITableViewStylePlain) {
        return 0;
    }
    
    switch (position) {
        case GroupedTableViewCellPositionBottom:
            return 0;
        case GroupedTableViewCellPositionTop:
            return 0;
        case GroupedTableViewCellPositionTopAndBottom:
            return 0;
        default:
            return 0;
    }
}

+ (CGFloat)tableView:(UITableView *)tableView
neededHeightForIndexPath:(NSIndexPath *)indexPath
{
    GroupedTableViewCellPosition position = [ABMGroupedTableViewCell positionForTableView:tableView
																				indexPath:indexPath];
    return [ABMGroupedTableViewCell neededHeightForPosition:position
												 tableStyle:tableView.style];
}

- (void)prepareForTableView:(UITableView *)tableView
				  withColor:(UIColor *)color
				atIndexPath:(NSIndexPath *)indexPath

{
    _position = [ABMGroupedTableViewCell positionForTableView:tableView
													indexPath:indexPath];
	_color = [ABMGroupedTableViewCell colorForTableView:tableView
											  withColor:color];
	
    self.backgroundView = [[UIImageView alloc] init];
    self.selectedBackgroundView = [[UIImageView alloc] init];
    
	NSString *singleImageName = @"groupedTableViewCell_singleRow";
	NSString *topImageName = @"groupedTableViewCell_topRow";
	NSString *middleImageName = @"groupedTableViewCell_middleRow";
	NSString *bottomImageName = @"groupedTableViewCell_bottomRow";
		
	switch (_color) {
		case TableViewCellBackgroundColorWhite:
			break;
		case TableViewCellBackgroundColorGray:
			singleImageName = [singleImageName stringByAppendingString:@"-gray"];
			topImageName = [topImageName stringByAppendingString:@"-gray"];
			middleImageName = [middleImageName stringByAppendingString:@"-gray"];
			bottomImageName = [bottomImageName stringByAppendingString:@"-gray"];
			break;
		case TableViewCellBackgroundColorRed:
			singleImageName = [singleImageName stringByAppendingString:@"-red"];
			topImageName = [topImageName stringByAppendingString:@"-red"];
			middleImageName = [middleImageName stringByAppendingString:@"-red"];
			bottomImageName = [bottomImageName stringByAppendingString:@"-red"];
			break;
		default:
			break;
	}
	
	UIImage *rowBackground;
	UIImage *selectionBackground;
    
    switch (_position) {
        case GroupedTableViewCellPositionTopAndBottom:
            rowBackground = [[UIImage imageNamed:singleImageName]
                             resizableImageWithCapInsets:kGroupedTableViewCellSingleRowImageCapInset];
            selectionBackground = [[UIImage imageNamed:@"groupedTableViewCell_singleRow_highlighted.png"]
                                   resizableImageWithCapInsets:kGroupedTableViewCellSingleRowImageCapInset];
            break;
        case GroupedTableViewCellPositionTop:
            rowBackground = [[UIImage imageNamed:topImageName]
                             resizableImageWithCapInsets:kGroupedTableViewCellTopRowImageCapInset];
            selectionBackground = [[UIImage imageNamed:@"groupedTableViewCell_topRow_highlighted.png"]
                                   resizableImageWithCapInsets:kGroupedTableViewCellTopRowImageCapInset];
            break;
        case GroupedTableViewCellPositionMiddle:
            rowBackground = [[UIImage imageNamed:middleImageName]
                             resizableImageWithCapInsets:kGroupedTableViewCellMiddleRowImageCapInset];
            selectionBackground = [[UIImage imageNamed:@"groupedTableViewCell_middleRow_highlighted.png"]
                                   resizableImageWithCapInsets:kGroupedTableViewCellMiddleRowImageCapInset];
            break;
        case GroupedTableViewCellPositionBottom:
            rowBackground = [[UIImage imageNamed:bottomImageName]
                             resizableImageWithCapInsets:kGroupedTableViewCellBottomRowImageCapInset];
            selectionBackground = [[UIImage imageNamed:@"groupedTableViewCell_bottomRow_highlighted.png"]
                                   resizableImageWithCapInsets:kGroupedTableViewCellBottomRowImageCapInset];
            break;
        default:
            break;
    }
    
	[((UIImageView *)self.backgroundView) setImage:rowBackground];
	[((UIImageView *)self.selectedBackgroundView) setImage:selectionBackground];
    
	[self.textLabel setBackgroundColor:[UIColor clearColor]];
}


@end
