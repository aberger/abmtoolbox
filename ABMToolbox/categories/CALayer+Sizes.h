//
//  CALayer+Sizes.h
//  ABMToolbox
//
//  Created by Alex Berger on 6/9/13.
//  Copyright (c) 2013 aberger.me. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>

@interface CALayer (Sizes)

@property (nonatomic) CGFloat left;
@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;

@property (nonatomic) CGPoint origin;
@property (nonatomic) CGSize size;

@end
