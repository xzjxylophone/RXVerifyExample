//
//  RXCSJView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2021/9/14.
//  Copyright © 2021 Rush.D.Xzj. All rights reserved.
//

#import "RXCSJView.h"
@interface RXCSJView ()
@end

@implementation RXCSJView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor greenColor];
        NSLog(@"RXCSJ:%@ init", NSStringFromClass([self class]));
    }
    return self;
}
- (void)dealloc {
    NSLog(@"RXCSJ:%@ dealloc", NSStringFromClass([self class]));
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    NSLog(@"RXCSJ:%@ KVO", NSStringFromClass([self class]));
}
@end
