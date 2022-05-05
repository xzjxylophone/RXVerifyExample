//
//  RXStrangeXRBottomView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/13.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXStrangeXRBottomView.h"
#import <Masonry/Masonry.h>
@interface RXStrangeXRBottomView ()
@property (nonatomic, strong) UIButton *button;
@end
@implementation RXStrangeXRBottomView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.button = [UIButton buttonWithType:UIButtonTypeCustom];
        self.button.backgroundColor = [UIColor redColor];
        [self addSubview:self.button];
        [self.button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.equalTo(@-12);
            make.height.equalTo(@44);
            make.width.equalTo(@100);
            make.centerY.equalTo(self.button.superview.mas_centerY);
        }];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
