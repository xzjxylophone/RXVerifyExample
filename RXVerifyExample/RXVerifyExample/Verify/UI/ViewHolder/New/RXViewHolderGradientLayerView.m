//
//  RXViewHolderGradientLayerView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/16.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXViewHolderGradientLayerView.h"

@interface RXViewHolderGradientLayerView ()

@property (nonatomic, strong) CAGradientLayer *gradientLayer;
@end

@implementation RXViewHolderGradientLayerView

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.frame.size.width > 0 && self.gradientLayer == nil) {
        NSLog(@"RXViewHolderGradientLayerView updateGradientLayer");
        // 初始化CAGradientlayer对象，使它的大小为UIView的大小
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.frame = self.bounds;
        // 将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
        [self.layer addSublayer:self.gradientLayer];
        // 设置渐变区域的起始和终止位置（范围为0-1）
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint = CGPointMake(0, 1);
        // 设置颜色数组
        self.gradientLayer.colors = @[
            (__bridge id)[[UIColor blackColor] colorWithAlphaComponent:0.0].CGColor,
            (__bridge id)[[UIColor blackColor] colorWithAlphaComponent:0.4].CGColor
        ];
        // 设置颜色分割点（范围：0-1）
        self.gradientLayer.locations = @[@(0.0f), @(1.0f)];
    }
}
@end
