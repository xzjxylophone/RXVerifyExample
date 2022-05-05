//
//  UIImageView+RXCornerRadius.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/6/7.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>
// https://github.com/liuzhiyi1992/ZYCornerRadius
// https://blog.csdn.net/qxuewei/article/details/51602518
@interface UIImageView (RXCornerRadius)
- (instancetype)initWithCornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (void)zy_cornerRadiusAdvance:(CGFloat)cornerRadius rectCornerType:(UIRectCorner)rectCornerType;

- (instancetype)initWithRoundingRectImageView;

- (void)zy_cornerRadiusRoundingRect;

- (void)zy_attachBorderWidth:(CGFloat)width color:(UIColor *)color;
@end
