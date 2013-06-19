//
//  ABMGlobalAppearance.m
//  ABMToolbox
//
//  Created by Alex Berger on 6/9/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#import "ABMGlobalAppearance.h"
#import "ABMBlueNavigationBarController.h"


#define kImageCapInsetZero									UIEdgeInsetsMake(0.0, 0.0, 0.0, 0.0)
#define kBarButtonImageCapInset								UIEdgeInsetsMake(0.0, 6.0, 0.0, 6.0)
#define kBackBarButtonImageCapInset							UIEdgeInsetsMake(0.0, 13.0, 0.0, 6.0)
#define kBarSegmentedImageCapInset							UIEdgeInsetsMake(0.0, 9.0, 0.0, 9.0)


@implementation ABMGlobalAppearance

+ (void)customizeAppearance
{
		// UINavigationBar
	UIImage *navigationBarPortrait = [UIImage imageNamed:@"navigationbar_bg_portrait.png"];
    [[UINavigationBar appearance] setBackgroundImage:navigationBarPortrait
                                       forBarMetrics:UIBarMetricsDefault];
	[[UINavigationBar appearance] setTitleTextAttributes:@{
								UITextAttributeTextColor:[UIColor abmWhiteColor],
						  UITextAttributeTextShadowColor:[UIColor colorWithRed:0.0
																		 green:0.0
																		  blue:0.0
																		 alpha:0.5]
	 }];
	
	UIImage *blueNavigationBarPortrait = [UIImage imageNamed:@"blue-navigationbar_bg_portrait.png"];
	[[UINavigationBar appearanceWhenContainedIn:[ABMBlueNavigationBarController class], nil] setBackgroundImage:blueNavigationBarPortrait
																								  forBarMetrics:UIBarMetricsDefault];
	[[UINavigationBar appearanceWhenContainedIn:[ABMBlueNavigationBarController class], nil] setTitleTextAttributes:@{
																						   UITextAttributeTextColor:[UIColor whiteColor],
																					 UITextAttributeTextShadowColor:[UIColor colorWithRed:0.0
																																	green:0.0
																																	 blue:0.0
																																	alpha:0.5]
	 }];
	
	[[UINavigationBar appearance] setShadowImage:[[UIImage alloc] init]];
	
		// UIToolbar
	UIImage *toolbarPortrait = [UIImage imageNamed:@"toolbar_bg_portrait.png"];
    [[UIToolbar appearance] setBackgroundImage:toolbarPortrait
                            forToolbarPosition:UIToolbarPositionAny
                                    barMetrics:UIBarMetricsDefault];
	
	UIImage *blueprintToolbarPortrait = [UIImage imageNamed:@"blueprint-toolbar_bg_portrait.png"];
	[[UIToolbar appearanceWhenContainedIn:[ABMBlueNavigationBarController class], nil] setBackgroundImage:blueprintToolbarPortrait
																					   forToolbarPosition:UIToolbarPositionAny
																							   barMetrics:UIBarMetricsDefault];
	
	[[UIToolbar appearance] setShadowImage:[[UIImage alloc] init] forToolbarPosition:UIToolbarPositionBottom];
	
		// UISWitch
	[[UISwitch appearance] setOnTintColor:[UIColor abmBlueColor]];
	
		// UIBarButtonItems
	[UIBarButtonItem customizeAppearance];
	
		// UISegmentedControl
	[[UISegmentedControl appearance] setTitleTextAttributes:@{
								   UITextAttributeTextColor:[UIColor abmBlackColor],
							 UITextAttributeTextShadowColor:[UIColor colorWithRed:1.0
																			green:1.0
																			 blue:1.0
																			alpha:0.5]
	 }
												   forState:UIControlStateNormal];
	[[UISegmentedControl appearance] setTitleTextAttributes:@{
								   UITextAttributeTextColor:[UIColor whiteColor],
							 UITextAttributeTextShadowColor:[UIColor colorWithRed:0.0
																			green:0.0
																			 blue:0.0
																			alpha:0.5]
	 }
												   forState:UIControlStateSelected];
	
    UIImage *segmentSelected = [[UIImage imageNamed:@"segcontrol_sel.png"]
                                resizableImageWithCapInsets:kBarSegmentedImageCapInset];
    UIImage *segmentUnselected = [[UIImage imageNamed:@"segcontrol_uns.png"]
                                  resizableImageWithCapInsets:kBarSegmentedImageCapInset];
    UIImage *segmentSelectedUnselected = [UIImage imageNamed:@"segcontrol_sel-uns.png"];
    UIImage *segmentUnselectedSelected = [UIImage imageNamed:@"segcontrol_uns-sel.png"];
    UIImage *segmentUnselectedUnselected =  [UIImage imageNamed:@"segcontrol_uns-uns.png"];
    
    [[UISegmentedControl appearance] setBackgroundImage:segmentUnselected
                                               forState:UIControlStateNormal
                                             barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setBackgroundImage:segmentSelected
                                               forState:UIControlStateSelected
                                             barMetrics:UIBarMetricsDefault];
    
    [[UISegmentedControl appearance] setDividerImage:segmentUnselectedUnselected
                                 forLeftSegmentState:UIControlStateNormal
                                   rightSegmentState:UIControlStateNormal
                                          barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setDividerImage:segmentSelectedUnselected
                                 forLeftSegmentState:UIControlStateSelected
                                   rightSegmentState:UIControlStateNormal
                                          barMetrics:UIBarMetricsDefault];
    [[UISegmentedControl appearance] setDividerImage:segmentUnselectedSelected
                                 forLeftSegmentState:UIControlStateNormal
                                   rightSegmentState:UIControlStateSelected
                                          barMetrics:UIBarMetricsDefault];
}


@end