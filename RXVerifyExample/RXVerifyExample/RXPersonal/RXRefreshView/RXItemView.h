//
//  RXItemView.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/9.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RXItemView : UIView
- (id)initWithFrame:(CGRect)frame startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint color:(UIColor *)color lineWidth:(CGFloat)lineWidth;


- (void)setupWithRect:(CGRect)rect;

@property (nonatomic, assign) CGFloat translationX;

- (void)setHorizontalRandomness:(NSInteger)horizontalRandomness dropHeight:(CGFloat)dropHeight;

@end
