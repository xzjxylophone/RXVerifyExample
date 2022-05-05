//
//  RXExpressAdView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2021/9/14.
//  Copyright © 2021 Rush.D.Xzj. All rights reserved.
//

#import "RXExpressAdView.h"

@implementation RXExpressAdView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [UIColor redColor];
        
        NSLog(@"RXCSJ:%@ init", NSStringFromClass([self class]));
    }
    return self;
}

- (void)dealloc {
    NSLog(@"RXCSJ:%@ init", NSStringFromClass([self class]));
}

- (void)changeFrameAfter3Second {
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"RXCSJ:%@ change frame", NSStringFromClass([self class]));
        CGRect frame = self.frame;
        frame.size = CGSizeMake(100, 100);
        self.frame = frame;
    });
}
@end
