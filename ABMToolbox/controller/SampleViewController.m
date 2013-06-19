//
//  SampleViewController.m
//  ABMToolbox
//
//  Created by Alex Berger on 6/14/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#define kTableViewCellHeight								44.0


#import "SampleViewController.h"


@interface SampleViewController ()

@end


@implementation SampleViewController

#pragma mark - view lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self.navigationItem setTitle:@"Grouped TableView"];
	
	_dataSource = @[@"First row", @"Middle row", @"Last row"];
	_dataSource1 = @[@"Single row"];
}

#pragma mark - storyboard segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue
				 sender:(id)sender
{
	if ([[segue identifier] isEqualToString:@"showDetailVC"]) {
		NSLog(@"segue with identifier %@", [segue identifier]);
	}
}

#pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(ABMGroupedTableView *)tableView
{
	return 2;
}

- (NSInteger)tableView:(ABMGroupedTableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
	switch (section) {
		case 0:
			return [_dataSource count];
			break;
		case 1:
			return [_dataSource1 count];
			break;
		default:
			return 0;
			break;
	}
}

#pragma mark - table view delegate methods

- (UIView *)tableView:(ABMGroupedTableView *)tableView
viewForHeaderInSection:(NSInteger)section
{
	return [tableView tableView:tableView
		 viewForHeaderInSection:section
					  withTitle:@"Section Title"];
}

- (CGFloat)tableView:(ABMGroupedTableView *)tableView
heightForHeaderInSection:(NSInteger)section
{
	return [tableView tableView:tableView
	   heightForHeaderInSection:section];
}

- (UIView *)tableView:(ABMGroupedTableView *)tableView
viewForFooterInSection:(NSInteger)section
{
    return [tableView tableView:tableView
         viewForFooterInSection:section];
}

- (CGFloat)tableView:(ABMGroupedTableView *)tableView
heightForFooterInSection:(NSInteger)section
{
	return [tableView tableView:tableView
	   heightForFooterInSection:section];
}

- (UITableViewCell *)tableView:(ABMGroupedTableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CellIdentifier";
    
        // init the UITableViewCell
    ABMGroupedTableViewCell *cell = (ABMGroupedTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[ABMGroupedTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
											  reuseIdentifier:cellIdentifier];
    }
	
	[cell prepareForTableView:tableView
					withColor:nil
				  atIndexPath:indexPath];
	
	switch ([indexPath section]) {
		case 0:
			[cell.label setText:[_dataSource objectAtIndex:[indexPath row]]];
			break;
		case 1:
			[cell.label setText:[_dataSource1 objectAtIndex:[indexPath row]]];
			break;
		default:
			break;
	}
	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	
    return cell;
}

- (CGFloat)tableView:(ABMGroupedTableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
	return kTableViewCellHeight;
}

- (void)tableView:(ABMGroupedTableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
	[tableView deselectRowAtIndexPath:indexPath
							 animated:YES];
	
	[self performSegueWithIdentifier:@"showDetailVC"
							  sender:self];
}

@end
