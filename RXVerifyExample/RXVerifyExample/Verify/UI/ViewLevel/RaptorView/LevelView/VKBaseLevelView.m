//
//  VKBaseLevelView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/10.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKBaseLevelView.h"
#import <Masonry/Masonry.h>
@implementation VKBaseLevelView

- (id)initWithSuperview:(UIView *)superview {
    if (self = [super init]) {
        [superview addSubview:self];
        
        [self mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview).offset(0);
            make.left.equalTo(superview).offset(0);
            make.right.equalTo(superview).offset(0);
            make.bottom.equalTo(superview).offset(0);
        }];
        
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    NSArray *subviews = [self.subviews.reverseObjectEnumerator allObjects];
    for (UIView *view in subviews) {
        if (view.hidden || view.alpha < 0.1) {
            continue;
        }
        BOOL inSubView = CGRectContainsPoint(view.frame, point);
        if (inSubView) {
            NSLog(@"YES: %@", [self class]);
            // 千万不能是  return self;  return self 是让这个类来处理所有的事件
            return [super hitTest:point withEvent:event];
        } else {
            NSLog(@"NO: %@", [self class]);
        }
    }
    return nil;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
