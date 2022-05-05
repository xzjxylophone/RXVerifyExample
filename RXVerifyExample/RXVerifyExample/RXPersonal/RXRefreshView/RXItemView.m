//
//  RXItemView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/9.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXItemView.h"

@interface RXItemView ()
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;
@property (nonatomic, assign) CGFloat lineWidth;
@property (nonatomic, strong) UIColor *color;

@end

@implementation RXItemView



- (id)initWithFrame:(CGRect)frame startPoint:(CGPoint)startPoint endPoint:(CGPoint)endPoint color:(UIColor *)color lineWidth:(CGFloat)lineWidth
{
    if (self = [super initWithFrame:frame]) {
        self.startPoint = startPoint;
        self.endPoint = endPoint;
        self.lineWidth = lineWidth;
        self.color = color;
    }
    return self;
}

- (void)setupWithRect:(CGRect)rect
{
    CGFloat midX = (self.startPoint.x + self.endPoint.x) / 2.0f;
    CGFloat midY = (self.startPoint.y + self.endPoint.y) / 2.0f;
    CGFloat width = self.frame.size.width;
    CGFloat height = self.frame.size.height;
    CGFloat x = self.frame.origin.x;
    CGFloat y = self.frame.origin.y;
    CGFloat anchorX = midX / width;
    CGFloat anchorY = midY / height;
    
    CGFloat newX = x + midX - width / 2.0f;
    CGFloat newY = y + midY - height / 2.0f;
    CGFloat newWidth = width;
    CGFloat newHeight = height;
    
    self.layer.anchorPoint = CGPointMake(anchorX, anchorY);
    self.frame = CGRectMake(newX, newY, newWidth, newHeight);
}



- (void)setHorizontalRandomness:(NSInteger)horizontalRandomness dropHeight:(CGFloat)dropHeight
{
    NSInteger randomNumber = - horizontalRandomness + arc4random() % horizontalRandomness * 2;
    self.translationX = randomNumber;
//    self.transform = CGAffineTransformMakeTranslation(self.translationX, -dropHeight);
}




- (void)drawRect:(CGRect)rect
{
    UIBezierPath *bezierPath = [UIBezierPath bezierPath];
    [bezierPath moveToPoint:self.startPoint];
    [bezierPath addLineToPoint:self.endPoint];
    [self.color setStroke];
    bezierPath.lineWidth = self.lineWidth;
    [bezierPath stroke];
}




@end
