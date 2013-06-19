//
//  UIColor+ABMToolboxColor.h
//  ABMToolbox
//
//  Created by Alex Berger on 6/9/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (ABMToolboxColor)

+ (UIColor *)colorWithHex:(uint)hex;

+ (UIColor *)abmWhiteColor;
+ (UIColor *)abmGrayColor;
+ (UIColor *)abmBlueColor;
+ (UIColor *)abmBlackColor;

@end
