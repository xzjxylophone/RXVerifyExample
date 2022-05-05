//
//  VKNormalLevel.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/6.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKNormalLevel.h"
#import <Masonry/Masonry.h>
@interface VKNormalLevel()
@property (nonatomic, strong) UILabel *backLabel;
@property (nonatomic, strong) UILabel *helpLabel;
@property (nonatomic, strong) UILabel *maskLabel;
@end
@implementation VKNormalLevel
- (id)initWithSuperview:(UIView *)superview {
    if (self = [super initWithSuperview:superview]) {
        self.backLabel = [UILabel new];
        self.backLabel.text = @"后退";
        self.backLabel.textAlignment = NSTextAlignmentCenter;
        self.backLabel.backgroundColor = [UIColor redColor];
        [self addSubview:self.backLabel];

        
        self.helpLabel = [UILabel new];
        self.helpLabel.text = @"帮助";
        self.helpLabel.textAlignment = NSTextAlignmentCenter;
        self.helpLabel.backgroundColor = [UIColor redColor];
        [self.helpLabel rx_addGestureRecognizerWithTarget:self action:@selector(helpAction:)];
        [self addSubview:self.helpLabel];

        
        self.maskLabel = [UILabel new];
        self.maskLabel.text = @"我是NormalLevel,专门覆盖videoLevel";
        self.maskLabel.textAlignment = NSTextAlignmentCenter;
        self.maskLabel.backgroundColor = [UIColor greenColor];
        [self addSubview:self.maskLabel];

        
        [self.backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview).offset(64);
            make.left.equalTo(superview).offset(20);
            make.width.equalTo(@(60));
            make.height.equalTo(@(30));
            
        }];
        
        [self.helpLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview).offset(64);
            make.right.equalTo(superview).offset(-20);
            make.width.equalTo(@(60));
            make.height.equalTo(@(30));
            
        }];
        
        
        [self.maskLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview).offset(200);
            make.left.equalTo(superview).offset(150);
            make.width.equalTo(@(300));
            make.height.equalTo(@(150));
            
        }];
    }
    return self;
}
- (void)helpAction:(id)sender {
    [self.delegate helpActionInNormalLevel:self];
}

- (NSArray *)possibleSubviews {
    NSMutableArray *ary = [NSMutableArray new];
    if (self.backLabel) {
        [ary addObject:self.backLabel];
    }
    if (self.helpLabel) {
        [ary addObject:self.helpLabel];
    }
    return [ary copy];
}

@end
