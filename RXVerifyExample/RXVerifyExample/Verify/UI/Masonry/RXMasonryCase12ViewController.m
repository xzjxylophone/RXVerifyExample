//
//  RXMasonryCase12ViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/26.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase12ViewController.h"
#import <Masonry/Masonry.h>

@interface RXMasonryCase12ViewController ()

@property (nonatomic, strong) UILabel *animationLabel;
@property (nonatomic, strong) MASConstraint *centerXConstraint;
@end

@implementation RXMasonryCase12ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.animationLabel.text = @"tutuge.me";
    [self.view addSubview:self.animationLabel];
    
    [_animationLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@(200));
        make.height.equalTo(@(40));
        _centerXConstraint = make.centerX.equalTo(self.view.mas_centerX);
        
        make.centerY.equalTo(self.view.mas_centerY);
    }];
}

#pragma mark - Actions

- (IBAction)runTouchUpInside:(id)sender {
    CGFloat centX = (self.view.frame.size.width - 200) / 2.0f;
    // 设置初始状态
    _centerXConstraint.equalTo(@(-centX));
    // 立即让约束生效
    [self.view layoutIfNeeded];
    // 动画生效
    [UIView animateWithDuration:1 animations:^{
        // 设置动画约束
        _centerXConstraint.equalTo(@0);
        [self.view layoutIfNeeded];
    }];
}

#pragma mark - Getter

- (UILabel *)animationLabel {
    if (!_animationLabel) {
        _animationLabel = [UILabel new];
        _animationLabel.textColor = [UIColor whiteColor];
        _animationLabel.font = [UIFont systemFontOfSize:20];
        _animationLabel.numberOfLines = 2;
        _animationLabel.textAlignment = NSTextAlignmentCenter;
        _animationLabel.backgroundColor = [UIColor colorWithRed:0.39 green:0.39 blue:0.39 alpha:1];
        _animationLabel.layer.masksToBounds = YES;
        _animationLabel.layer.cornerRadius = 2.0f;
    }
    return _animationLabel;
}

@end
