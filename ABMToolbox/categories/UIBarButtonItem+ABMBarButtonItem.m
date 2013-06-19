//
//  UIBarButtonItem+ABMBarButtonItem.m
//  ABMToolbox
//
//  Created by Alex Berger on 6/9/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#import "UIBarButtonItem+ABMBarButtonItem.h"
#import "ABMBlueNavigationBarController.h"

#define kBarButtonImageCapInset								UIEdgeInsetsMake(0.0, 6.0, 0.0, 6.0)
#define kBackBarButtonImageCapInset							UIEdgeInsetsMake(0.0, 13.0, 0.0, 6.0)
#define kLabelColorForWhiteButton							[UIColor abmWhiteColor]
#define kLabelColorForBlueButton							[UIColor whiteColor]
#define kLabelShadowColorForWhiteButton						[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]
#define kLabelShadowColorForBlueButton						[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]


@implementation UIBarButtonItem (ABMBarButtonItem)

+ (void)customizeAppearance
{
		// set global style
	[[UIBarButtonItem appearance] setTitleTextAttributes:@{
								UITextAttributeTextColor:kLabelColorForWhiteButton,
						  UITextAttributeTextShadowColor:kLabelShadowColorForWhiteButton
	 }
												forState:UIControlStateNormal];
	
	[[UIBarButtonItem appearance] setTitleTextAttributes:@{
								UITextAttributeTextColor:kLabelColorForWhiteButton,
						  UITextAttributeTextShadowColor:kLabelShadowColorForWhiteButton
	 }
												forState:UIControlStateHighlighted];
	
	UIImage *barButtonPortrait = [[UIImage imageNamed:@"button_bbi-white.png"]
								  resizableImageWithCapInsets:kBarButtonImageCapInset];
	[[UIBarButtonItem appearance] setBackgroundImage:barButtonPortrait
											forState:UIControlStateNormal
										  barMetrics:UIBarMetricsDefault];
	
	UIImage *barButtonPortraitHighlighted = [[UIImage imageNamed:@"button_bbi-white_highlighted.png"]
											 resizableImageWithCapInsets:kBarButtonImageCapInset];
	[[UIBarButtonItem appearance] setBackgroundImage:barButtonPortraitHighlighted
											forState:UIControlStateHighlighted
										  barMetrics:UIBarMetricsDefault];
	
    UIImage *barButtonBackPortrait = [[UIImage imageNamed:@"button_bbi_back-white.png"]
									  resizableImageWithCapInsets:kBackBarButtonImageCapInset];
	[[UIBarButtonItem appearance] setBackButtonBackgroundImage:barButtonBackPortrait
                                                      forState:UIControlStateNormal
                                                    barMetrics:UIBarMetricsDefault];
	
    UIImage *barButtonBackPortraitHighlighted = [[UIImage imageNamed:@"button_bbi_back-white_highlighted.png"]
												 resizableImageWithCapInsets:kBackBarButtonImageCapInset];
    [[UIBarButtonItem appearance] setBackButtonBackgroundImage:barButtonBackPortraitHighlighted
                                                      forState:UIControlStateHighlighted
                                                    barMetrics:UIBarMetricsDefault];
//	
//		// set style for ABMBlueNavigationController
//	[[UIBarButtonItem appearanceWhenContainedIn:[ABMBlueNavigationBarController class], nil] setTitleTextAttributes:@{
//																						   UITextAttributeTextColor:kLabelColorForBlueButton,
//																					 UITextAttributeTextShadowColor:kLabelShadowColorForBlueButton
//	 }
//																										   forState:UIControlStateNormal];
//	
//	[[UIBarButtonItem appearanceWhenContainedIn:[ABMBlueNavigationBarController class], nil] setTitleTextAttributes:@{
//																						   UITextAttributeTextColor:kLabelColorForBlueButton,
//																					 UITextAttributeTextShadowColor:kLabelShadowColorForBlueButton
//	 }
//																										   forState:UIControlStateHighlighted];
//	
//	UIImage *blueBarButtonPortrait = [[UIImage imageNamed:@"button_bbi-blue.png"]
//									  resizableImageWithCapInsets:kBarButtonImageCapInset];
//	[[UIBarButtonItem appearanceWhenContainedIn:[ABMBlueNavigationBarController class], nil] setBackgroundImage:blueBarButtonPortrait
//																									   forState:UIControlStateNormal
//																									 barMetrics:UIBarMetricsDefault];
//	
//	UIImage *blueBarButtonPortraitHighlighted = [[UIImage imageNamed:@"button_bbi-blue_highlighted.png"]
//												 resizableImageWithCapInsets:kBarButtonImageCapInset];
//	[[UIBarButtonItem appearanceWhenContainedIn:[ABMBlueNavigationBarController class], nil] setBackgroundImage:blueBarButtonPortraitHighlighted
//																									   forState:UIControlStateHighlighted
//																									 barMetrics:UIBarMetricsDefault];
//	
//    UIImage *blueBarButtonBackPortrait = [[UIImage imageNamed:@"button_bbi_back-blue.png"]
//										  resizableImageWithCapInsets:kBackBarButtonImageCapInset];
//	[[UIBarButtonItem appearanceWhenContainedIn:[ABMBlueNavigationBarController class], nil] setBackButtonBackgroundImage:blueBarButtonBackPortrait
//																												 forState:UIControlStateNormal
//																											   barMetrics:UIBarMetricsDefault];
//	
//    UIImage *blueBarButtonBackPortraitHighlighted = [[UIImage imageNamed:@"button_bbi_back-blue_highlighted.png"]
//													 resizableImageWithCapInsets:kBackBarButtonImageCapInset];
//    [[UIBarButtonItem appearanceWhenContainedIn:[ABMBlueNavigationBarController class], nil] setBackButtonBackgroundImage:blueBarButtonBackPortraitHighlighted
//																												 forState:UIControlStateHighlighted
//																											   barMetrics:UIBarMetricsDefault];
//	
//		// set tint color for plain bar button items contained in a toolbar
//	[[UIBarButtonItem appearanceWhenContainedIn:[UIToolbar class], nil] setTintColor:[UIColor abmBlackColor]];
	
		// set style for special states (done, edit, ...)
	Class klass = objc_getClass("UIBarButtonItem");
	Method targetMethod = class_getInstanceMethod(klass, @selector(setStyle:));
	Method newMethod = class_getInstanceMethod(klass, @selector(__setStyle:));
	method_exchangeImplementations(targetMethod, newMethod);
	
		// for iOS6
		//	[[UIBarButtonItem appearance] setBackgroundImage:doneBackgroundImage
		//                                            forState:UIControlStateNormal
		//                                               style:UIBarButtonItemStyleDone
		//                                          barMetrics:UIBarMetricsDefault];
}

- (void)__setStyle:(UIBarButtonItemStyle)style
{
	[self __setStyle:style];
	
	if (style == UIBarButtonItemStyleDone) {
		
		[self setTitleTextAttributes:@{
			UITextAttributeTextColor:kLabelColorForBlueButton,
	  UITextAttributeTextShadowColor:kLabelShadowColorForBlueButton,
				 UITextAttributeFont:[UIFont boldSystemFontOfSize:12.0]
		 }
							forState:UIControlStateNormal];
		
		[self setTitleTextAttributes:@{
			UITextAttributeTextColor:kLabelColorForBlueButton,
	  UITextAttributeTextShadowColor:kLabelShadowColorForBlueButton,
				 UITextAttributeFont:[UIFont boldSystemFontOfSize:12.0]
		 }
							forState:UIControlStateHighlighted];
		
		UIImage *barButtonPortrait = [[UIImage imageNamed:@"button_bbi-blue.png"]
									  resizableImageWithCapInsets:kBarButtonImageCapInset];
		[self setBackgroundImage:barButtonPortrait
						forState:UIControlStateNormal
					  barMetrics:UIBarMetricsDefault];
		
		UIImage *barButtonPortraitHighlighted = [[UIImage imageNamed:@"button_bbi-blue_highlighted.png"]
												 resizableImageWithCapInsets:kBarButtonImageCapInset];
		[self setBackgroundImage:barButtonPortraitHighlighted
						forState:UIControlStateHighlighted
					  barMetrics:UIBarMetricsDefault];
	}
}

+ (UIBarButtonItem *)barButtonItemWithColor:(UIColor *)color
                                      title:(NSString *)title
                                  addTarget:(id)target
                                     action:(SEL)selector
{
	UIButton *button = [UIButton barButtonWithColor:color
											  title:title
										  addTarget:target
											 action:selector];
	
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barButton;
}

+ (UIBarButtonItem *)backBarButtonItemWithColor:(UIColor *)color
                                          title:(NSString *)title
                                      addTarget:(id)target
                                         action:(SEL)selector
{
    UIButton *button = [UIButton backBarButtonWithColor:color
												  title:title
											  addTarget:target
												 action:selector];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barButton;
}

+ (UIBarButtonItem *)forwardBarButtonItemWithColor:(UIColor *)color
                                             title:(NSString *)title
                                         addTarget:(id)target
                                            action:(SEL)selector
{
    UIButton *button = [UIButton forwardBarButtonWithColor:color
													 title:title
												 addTarget:target
													action:selector];
    
    UIBarButtonItem *barButton = [[UIBarButtonItem alloc] initWithCustomView:button];
    
    return barButton;
}

+ (UIBarButtonItem *)plainBarButtonItemWithImage:(UIImage *)image
									   addTarget:(id)target
										  action:(SEL)selector
{
	UIButton *button = [UIButton plainBarButtonWithImage:image
											   addTarget:target
												  action:selector];
	
	UIBarButtonItem *barButtom = [[UIBarButtonItem alloc] initWithCustomView:button];
	
	return barButtom;
}

@end
