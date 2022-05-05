//
//  VKVideoLevel.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/9.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKVideoLevel.h"
#import <Masonry/Masonry.h>
@interface VKVideoLevel()
@property (nonatomic, strong) UILabel *teacherLabel;
@property (nonatomic, strong) UILabel *studentLabel;
@end
@implementation VKVideoLevel
- (id)initWithSuperview:(UIView *)superview {
    if (self = [super initWithSuperview:superview]) {
        self.teacherLabel = [UILabel new];
        self.teacherLabel.text = @"我是老师";
        self.teacherLabel.textAlignment = NSTextAlignmentCenter;
        self.teacherLabel.backgroundColor = [UIColor redColor];
        
        [self addSubview:self.teacherLabel];
        
        
        self.studentLabel = [UILabel new];
        self.studentLabel.text = @"我是学生";
        self.studentLabel.textAlignment = NSTextAlignmentCenter;
        self.studentLabel.backgroundColor = [UIColor redColor];
        [self addSubview:self.studentLabel];
        
        
        [self.teacherLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview).offset(200);
            make.left.equalTo(superview).offset(20);
            make.width.equalTo(@(200));
            make.height.equalTo(@(200));

        }];
        
        [self.studentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(superview).offset(-200);
            make.left.equalTo(superview).offset(20);
            make.width.equalTo(@(200));
            make.height.equalTo(@(200));

        }];
    }
    return self;
}

- (NSArray *)possibleSubviews {
    NSMutableArray *ary = [NSMutableArray new];
    if (self.teacherLabel) {
        [ary addObject:self.teacherLabel];
    }
    if (self.studentLabel) {
        [ary addObject:self.studentLabel];
    }
    return [ary copy];
}
@end
