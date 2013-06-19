//
//  ModalViewController.m
//  ABMToolbox
//
//  Created by Alex Berger on 6/19/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#define kTableViewCellBackgroundColor					[UIColor abmWhiteColor]
#define kTableViewCellHeight							55.0


#import "ModalViewController.h"


@interface ModalViewController ()

@end


@implementation ModalViewController

#pragma mark - view lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	
	[self.navigationItem setTitle:@"Plain TableView"];
	
	UIBarButtonItem *dismissBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Grouped TV"
																		 style:UIBarButtonItemStyleDone
																		target:self
																		action:@selector(dismissModalView:)];
	[self.navigationItem setRightBarButtonItem:dismissBarButton];
	
	_dataSource = @[@"First row", @"Middle row", @"Last row"];
}

- (void)dismissModalView:(id)sender
{
	[self.presentingViewController dismissViewControllerAnimated:YES
													  completion:nil];
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

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [_dataSource count];
}

- (ABMPlainTableViewCell *)tableView:(UITableView *)tableView
			   cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
	static NSString *cellIdentifier = @"CellIdentifier";
	
	ABMPlainTableViewCell *cell = (ABMPlainTableViewCell *)[tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[ABMPlainTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
											reuseIdentifier:cellIdentifier];
    }
	
	[cell prepareForTableView:tableView
					withColor:nil
				  atIndexPath:indexPath];
	[cell.contentView setBackgroundColor:kTableViewCellBackgroundColor];
	
	[cell.textLabel setText:[self.dataSource objectAtIndex:[indexPath row]]];
	[cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
	
	return cell;
}

- (CGFloat)tableView:(UITableView *)tableView
heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return kTableViewCellHeight;
}

- (void)tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath
							 animated:YES];
	
	[self performSegueWithIdentifier:@"showDetailVC"
							  sender:self];
}


@end
