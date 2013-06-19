//
//  UIColor+ABMToolboxColor.m
//  ABMToolbox
//
//  Created by Alex Berger on 6/9/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#import "UIColor+ABMToolboxColor.h"

@implementation UIColor (ABMToolboxColor)

+ (UIColor *)colorWithHex:(uint)hex
{
	int blue = hex & 0x000000FF;
	int green = ((hex & 0x0000FF00) >> 8);
	int red = ((hex & 0x00FF0000) >> 16);
	
	return [UIColor colorWithRed:red / 255.0
                           green:green / 255.0
                            blue:blue / 255.0
                           alpha:1.0];
}

+ (UIColor *)abmWhiteColor
{
    static UIColor *color = nil;
    if (color == nil) {
        color = [UIColor colorWithHex:0xffffff];
    }
    return color;
}

+ (UIColor *)abmGrayColor
{
	static UIColor *color = nil;
    if (color == nil) {
        color = [UIColor colorWithHex:0xebebeb];
    }
    return color;
}

+ (UIColor *)abmBlueColor
{
    static UIColor *color = nil;
    if (color == nil) {
        color = [UIColor colorWithHex:0x009aec];
    }
    return color;
}

+ (UIColor *)abmBlackColor
{
    static UIColor *color = nil;
    if (color == nil) {
        color = [UIColor colorWithHex:0x242424];
    }
    return color;
}

@end
