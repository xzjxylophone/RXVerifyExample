//
//  RXVRCView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/9/12.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXVRCView.h"

@implementation RXVRCView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        
        self.frame = CGRectMake(100, 100, 300, 300);
    }
    return self;
}


- (void)didAddSubview:(UIView *)subview {
    NSLog(@"%@ %@", NSStringFromSelector(_cmd), subview);
}

- (void)willRemoveSubview:(UIView *)subview {
    NSLog(@"%@ %@", NSStringFromSelector(_cmd), subview);
}
- (void)willMoveToSuperview:(UIView *)newSuperview {
    NSLog(@"%@ %@", NSStringFromSelector(_cmd), newSuperview);
}
- (void)didMoveToSuperview {
    NSLog(@"%@", NSStringFromSelector(_cmd));
}

- (void)willMoveToWindow:(UIWindow *)newWindow {
    
    NSLog(@"%@ %@ self.window:%@", NSStringFromSelector(_cmd), newWindow, self.window);
}
- (void)didMoveToWindow {
    NSLog(@"%@ self.window:%@", NSStringFromSelector(_cmd), self.window);
}
- (void)dealloc {
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}
@end
