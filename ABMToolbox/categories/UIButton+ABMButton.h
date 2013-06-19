//
//  UIButton+ABMButton.h
//  ABMToolbox
//
//  Created by Alex Berger on 6/9/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (ABMButton)

+ (UIButton *)barButtonWithColor:(UIColor *)color title:(NSString *)title addTarget:(id)target action:(SEL)selector;
+ (UIButton *)backBarButtonWithColor:(UIColor *)color title:(NSString *)title addTarget:(id)target action:(SEL)selector;
+ (UIButton *)forwardBarButtonWithColor:(UIColor *)color title:(NSString *)title addTarget:(id)target action:(SEL)selector;
+ (UIButton *)plainBarButtonWithImage:(UIImage *)image addTarget:(id)target action:(SEL)selector;

@end
