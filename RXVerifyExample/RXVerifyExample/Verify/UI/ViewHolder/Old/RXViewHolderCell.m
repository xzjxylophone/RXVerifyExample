//
//  RXViewHolderCell.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/11.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXViewHolderCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@interface RXViewHolderCell ()
@end

@implementation RXViewHolderCell
- (void)refreshViewWithIndex:(NSInteger)index {
    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:@"https://static.yximgs.com/udata/pkg/c0f04f06a2020297ad56fb7fea4fb5f4"]];
}
- (void)layoutSubviews {
    [super layoutSubviews];
    [self updateGradientLayer];
}
- (void)updateGradientLayer {
    if (self.gradientView.frame.size.width > 0 && self.gradientLayer == nil) {
        NSLog(@"updateGradientLayer");
        // 初始化CAGradientlayer对象，使它的大小为UIView的大小
        self.gradientLayer = [CAGradientLayer layer];
        self.gradientLayer.frame = self.gradientView.bounds;

        // 将CAGradientlayer对象添加在我们要设置背景色的视图的layer层
        [self.gradientView.layer addSublayer:self.gradientLayer];

        // 设置渐变区域的起始和终止位置（范围为0-1）
        self.gradientLayer.startPoint = CGPointMake(0, 0);
        self.gradientLayer.endPoint = CGPointMake(0, 1);

        // 设置颜色数组
        self.gradientLayer.colors = @[
            (__bridge id)[[UIColor blackColor] colorWithAlphaComponent:0.0].CGColor,
            (__bridge id)[[UIColor blackColor] colorWithAlphaComponent:0.4].CGColor
        ];

//        self.imageView.hidden = YES;
        // 设置颜色分割点（范围：0-1）
        self.gradientLayer.locations = @[@(0.0f), @(1.0f)];
    }
}

#pragma mark - UI Getter
- (UIView *)gradientView {
    if (!_gradientView) {
        _gradientView = [UIView new];
    }
    return _gradientView;
}
@end
