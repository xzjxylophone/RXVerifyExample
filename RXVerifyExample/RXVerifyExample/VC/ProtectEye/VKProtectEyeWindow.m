//
//  VKProtectEyeWindow.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/5/23.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKProtectEyeWindow.h"

@implementation VKProtectEyeWindow
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event {
    return nil;
}

@end
