//
//  VKAnimationLevel.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/6.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKAnimationLevel.h"
#import <Masonry/Masonry.h>
@interface VKAnimationLevel()
@property (nonatomic, strong) UILabel *animationLabel;
@end
@implementation VKAnimationLevel
- (id)initWithSuperview:(UIView *)superview {
    if (self = [super initWithSuperview:superview]) {
        self.animationLabel = [UILabel new];
        self.animationLabel.text = @"我是动画level,5秒后我自动消失";
        self.animationLabel.textColor = [UIColor whiteColor];
        self.animationLabel.textAlignment = NSTextAlignmentCenter;
        self.animationLabel.backgroundColor = [UIColor blueColor];
        [self addSubview:self.animationLabel];
        
        [self.animationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview).offset(0);
            make.left.equalTo(superview).offset(0);
            make.right.equalTo(superview).offset(0);
            make.bottom.equalTo(superview).offset(0);
        }];
        
        __weak typeof(self) weakSelf = self;
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 5 * NSEC_PER_SEC),  dispatch_get_main_queue(), ^{
            [weakSelf.animationLabel removeFromSuperview];
        });
    }
    return self;
}


- (NSArray *)possibleSubviews {
    NSMutableArray *ary = [NSMutableArray new];
    if (self.animationLabel) {
        [ary addObject:self.animationLabel];
    }
    return [ary copy];
}

@end
