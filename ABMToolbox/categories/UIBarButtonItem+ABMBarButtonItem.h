//
//  UIBarButtonItem+ABMBarButtonItem.h
//  ABMToolbox
//
//  Created by Alex Berger on 6/9/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>

@interface UIBarButtonItem (ABMBarButtonItem)

+ (void)customizeAppearance;

+ (UIBarButtonItem *)barButtonItemWithColor:(UIColor *)color title:(NSString *)title addTarget:(id)target action:(SEL)selector;
+ (UIBarButtonItem *)backBarButtonItemWithColor:(UIColor *)color title:(NSString *)title addTarget:(id)target action:(SEL)selector;
+ (UIBarButtonItem *)forwardBarButtonItemWithColor:(UIColor *)color title:(NSString *)title addTarget:(id)target action:(SEL)selector;
+ (UIBarButtonItem *)plainBarButtonItemWithImage:(UIImage *)image addTarget:(id)target action:(SEL)selector;

@end
