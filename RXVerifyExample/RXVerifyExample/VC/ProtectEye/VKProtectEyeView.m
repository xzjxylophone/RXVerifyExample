//
//  VKProtectEyeView.m
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/5/22.
//

#import "VKProtectEyeView.h"

@implementation VKProtectEyeView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        self.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.5];
    }
    return self;
}

- (nullable UIView *)hitTest:(CGPoint)point withEvent:(nullable UIEvent *)event {
    return nil;
}
- (void)drawRect:(CGRect)rect {
    NSLog(@"1111");
}


@end
