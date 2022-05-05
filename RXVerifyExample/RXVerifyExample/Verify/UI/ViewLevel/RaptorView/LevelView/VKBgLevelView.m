//
//  VKBgLevelView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/10.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKBgLevelView.h"
#import <Masonry/Masonry.h>
@interface VKBgLevelView()

@property (nonatomic, strong) UILabel *pptLabel;
@end
@implementation VKBgLevelView
- (id)initWithSuperview:(UIView *)superview {
    if (self = [super initWithSuperview:superview]) {
        self.pptLabel = [UILabel new];
        self.pptLabel.text = @"我是背景图";
        self.pptLabel.textAlignment = NSTextAlignmentCenter;
        [self.pptLabel rx_addGestureRecognizerWithTarget:self action:@selector(pptLabelAction:)];
        [self addSubview:self.pptLabel];
        
        
        [self.pptLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview).offset(0);
            make.left.equalTo(superview).offset(0);
            make.right.equalTo(superview).offset(0);
            make.bottom.equalTo(superview).offset(0);
        }];
        
        
    }
    return self;
}
- (void)pptLabelAction:(id)sender {
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"pptLabel" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
    [av show];
}
@end
