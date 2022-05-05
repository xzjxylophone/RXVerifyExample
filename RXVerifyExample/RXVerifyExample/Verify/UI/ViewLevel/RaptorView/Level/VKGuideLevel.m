//
//  VKGuideLevel.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/6.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKGuideLevel.h"
#import <Masonry/Masonry.h>
#import "UIView+RXUtility.h"
@interface VKGuideLevel()
@property (nonatomic, strong) UILabel *guideLabel;
@end
@implementation VKGuideLevel
- (id)initWithSuperview:(UIView *)superview {
    if (self = [super initWithSuperview:superview]) {
        self.guideLabel = [UILabel new];
        self.guideLabel.text = @"我是指导level,请点击我让我消失";
        self.guideLabel.textAlignment = NSTextAlignmentCenter;
        self.guideLabel.backgroundColor = [UIColor yellowColor];
        [self.guideLabel rx_addGestureRecognizerWithTarget:self action:@selector(guideLabelAction:)];
        [self addSubview:self.guideLabel];
        
        [self.guideLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview).offset(0);
            make.left.equalTo(superview).offset(0);
            make.right.equalTo(superview).offset(0);
            make.bottom.equalTo(superview).offset(0);
        }];
    }
    return self;
}

- (void)showHelp {
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"111" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [av show];
}
- (void)guideLabelAction:(id)sender{
    [self.guideLabel removeFromSuperview];
}

- (NSArray *)possibleSubviews {
    NSMutableArray *ary = [NSMutableArray new];
    if (self.guideLabel) {
        [ary addObject:self.guideLabel];
    }
    return [ary copy];
}

@end
