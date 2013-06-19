//
//  UIButton+ABMButton.m
//  ABMToolbox
//
//  Created by Alex Berger on 6/9/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#import "UIButton+ABMButton.h"


#define kButtonRect											CGRectMake(0.0, 0.0, 12.0, 30.0)
#define kBarButtonImageCapInset								UIEdgeInsetsMake(0.0, 6.0, 0.0, 6.0)
#define kBarButtonContentInset								UIEdgeInsetsMake(0.0, 12.0, 0.0, 12.0)
#define kBackBarButtonImageCapInset							UIEdgeInsetsMake(0.0, 13.0, 0.0, 6.0)
#define kForwardBarButtonImageCapInset						UIEdgeInsetsMake(0.0, 6.0, 0.0, 13.0)
#define kLabelFont											[UIFont boldSystemFontOfSize:12.0]
#define kLabelColorForWhiteButton							[UIColor abmBlackColor]
#define kLabelColorForBlueButton							[UIColor whiteColor]
#define kShadowOffset										CGSizeMake(0.0, -1.0)
#define kLabelShadowColorForWhiteButton						[UIColor colorWithRed:1.0 green:1.0 blue:1.0 alpha:0.5]
#define kLabelShadowColorForBlueButton						[UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.5]


@implementation UIButton (ABMButton)

+ (UIButton *)barButtonWithColor:(UIColor *)color
						   title:(NSString *)title
					   addTarget:(id)target
						  action:(SEL)selector
{
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor clearColor]];
    
    UIImage *buttonImage = nil;
    UIImage *buttonImageHighlighted = nil;
    UIColor *buttonTitleColor = nil;
    UIColor *buttonTitleShadowColor = nil;
	
    if (color == [UIColor abmBlueColor]) {
		buttonImage = [[UIImage imageNamed:@"button_bbi-blue.png"]
					   resizableImageWithCapInsets:kBarButtonImageCapInset];
        buttonImageHighlighted = [[UIImage imageNamed:@"button_bbi-blue_highlighted.png"]
                                  resizableImageWithCapInsets:kBarButtonImageCapInset];
        buttonTitleColor = kLabelColorForBlueButton;
        buttonTitleShadowColor = kLabelShadowColorForBlueButton;
    }
    else {
		buttonImage = [[UIImage imageNamed:@"button_bbi-white.png"]
					   resizableImageWithCapInsets:kBarButtonImageCapInset];
        buttonImageHighlighted = [[UIImage imageNamed:@"button_bbi-white_highlighted.png"]
                                  resizableImageWithCapInsets:kBarButtonImageCapInset];
        buttonTitleColor = kLabelColorForWhiteButton;
        buttonTitleShadowColor = kLabelShadowColorForWhiteButton;
    }
    
    [button setBackgroundImage:buttonImage
                      forState:UIControlStateNormal];
    [button setBackgroundImage:buttonImageHighlighted
                      forState:UIControlStateHighlighted];
    
    [button setTitleColor:buttonTitleColor
                 forState:UIControlStateNormal];
	[button setTitleShadowColor:buttonTitleShadowColor
					   forState:UIControlStateNormal];
    [button.titleLabel setShadowOffset:kShadowOffset];
    [button.titleLabel setFont:kLabelFont];
    
    [button setFrame:kButtonRect];
    
    [button setTitle:title
            forState:UIControlStateNormal];
    
    [button addTarget:target
               action:selector
     forControlEvents:UIControlEventTouchUpInside];
    
    [button setContentEdgeInsets:kBarButtonContentInset];
    [button sizeToFit];
    
	return button;
}

+ (UIButton *)backBarButtonWithColor:(UIColor *)color
							   title:(NSString *)title
						   addTarget:(id)target
							  action:(SEL)selector
{
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor clearColor]];
    
    UIImage *buttonImage = nil;
    UIImage *buttonImageHighlighted = nil;
    UIColor *buttonTitleColor = nil;
    UIColor *buttonTitleShadowColor = nil;
    
    if (color == [UIColor abmBlueColor]) {
        buttonImage = [[UIImage imageNamed:@"button_bbi_back-blue.png"]
                       resizableImageWithCapInsets:kBackBarButtonImageCapInset];
        buttonImageHighlighted = [[UIImage imageNamed:@"button_bbi_back-blue_highlighted.png"]
                                  resizableImageWithCapInsets:kBackBarButtonImageCapInset];
        buttonTitleColor = kLabelColorForBlueButton;
        buttonTitleShadowColor = kLabelShadowColorForBlueButton;
    }
    else {
        buttonImage = [[UIImage imageNamed:@"button_bbi_back-white.png"]
                       resizableImageWithCapInsets:kBackBarButtonImageCapInset];
        buttonImageHighlighted = [[UIImage imageNamed:@"button_bbi_back-white_highlighted.png"]
                                  resizableImageWithCapInsets:kBackBarButtonImageCapInset];
        buttonTitleColor = kLabelColorForWhiteButton;
        buttonTitleShadowColor = kLabelShadowColorForWhiteButton;
    }
    
    [button setBackgroundImage:buttonImage
                      forState:UIControlStateNormal];
    [button setBackgroundImage:buttonImageHighlighted
                      forState:UIControlStateHighlighted];
    
    [button setTitleColor:buttonTitleColor
                 forState:UIControlStateNormal];
	[button setTitleShadowColor:buttonTitleShadowColor
					   forState:UIControlStateNormal];
    [button.titleLabel setShadowOffset:kShadowOffset];
    [button.titleLabel setFont:kLabelFont];
    
    [button setFrame:kButtonRect];
    
    [button setTitle:title
            forState:UIControlStateNormal];
    
    [button addTarget:target
               action:selector
     forControlEvents:UIControlEventTouchUpInside];
    
    [button setContentEdgeInsets:kBarButtonContentInset];
    [button sizeToFit];
	
	return button;
}

+ (UIButton *)forwardBarButtonWithColor:(UIColor *)color
								  title:(NSString *)title
							  addTarget:(id)target
								 action:(SEL)selector
{
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setBackgroundColor:[UIColor clearColor]];
    
    UIImage *buttonImage = nil;
    UIImage *buttonImageHighlighted = nil;
    UIColor *buttonTitleColor = nil;
    UIColor *buttonTitleShadowColor = nil;
    
    if (color == [UIColor abmBlueColor]) {
        buttonImage = [[UIImage imageNamed:@"button_bbi_forward-blue.png"]
                       resizableImageWithCapInsets:kForwardBarButtonImageCapInset];
        buttonImageHighlighted = [[UIImage imageNamed:@"button_bbi_forward-blue_highlighted.png"]
                                  resizableImageWithCapInsets:kForwardBarButtonImageCapInset];
        buttonTitleColor = kLabelColorForBlueButton;
        buttonTitleShadowColor = kLabelShadowColorForBlueButton;
    }
    else {
        buttonImage = [[UIImage imageNamed:@"button_bbi_forward-white.png"]
                       resizableImageWithCapInsets:kForwardBarButtonImageCapInset];
        buttonImageHighlighted = [[UIImage imageNamed:@"button_bbi_forward-white_highlighted.png"]
                                  resizableImageWithCapInsets:kForwardBarButtonImageCapInset];
        buttonTitleColor = kLabelColorForWhiteButton;
        buttonTitleShadowColor = kLabelShadowColorForWhiteButton;
    }
    
    [button setBackgroundImage:buttonImage
                      forState:UIControlStateNormal];
    [button setBackgroundImage:buttonImageHighlighted
                      forState:UIControlStateHighlighted];
    
    [button setTitleColor:buttonTitleColor
                 forState:UIControlStateNormal];
    [button setTitleShadowColor:buttonTitleShadowColor
					   forState:UIControlStateNormal];
    [button.titleLabel setShadowOffset:kShadowOffset];
    [button.titleLabel setFont:kLabelFont];
    
    [button setFrame:kButtonRect];
    
    [button setTitle:title
            forState:UIControlStateNormal];
    
    [button addTarget:target
               action:selector
     forControlEvents:UIControlEventTouchUpInside];
    
    [button setContentEdgeInsets:kBarButtonContentInset];
    [button sizeToFit];
	
	return button;
}

+ (UIButton *)plainBarButtonWithImage:(UIImage *)image
							addTarget:(id)target
							   action:(SEL)selector
{
	UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
	[button setBackgroundColor:[UIColor clearColor]];
	
	[button setBackgroundImage:image
					  forState:UIControlStateNormal];
	[button setFrame:CGRectMake(0.0,
								0.0,
								image.size.width,
								image.size.height)];
	
	[button addTarget:target
			   action:selector
	 forControlEvents:UIControlEventTouchUpInside];
	
	[button setShowsTouchWhenHighlighted:YES];
	
	return button;
}

@end
