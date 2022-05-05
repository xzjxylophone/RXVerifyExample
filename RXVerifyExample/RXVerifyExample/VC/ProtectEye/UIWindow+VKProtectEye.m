//
//  UIWindow+VKProtectEye.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/5/24.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "UIWindow+VKProtectEye.h"
#import "VKProtectEyeManager.h"
#import <objc/runtime.h>
@implementation UIWindow (VKProtectEye)

+ (void)vkProtectEye_exchangeAddSubview {
    static dispatch_once_t onceToken;
    dispatch_once (& onceToken, ^ {
        Class cls = [self class];
        SEL originSel = NSSelectorFromString(@"addSubview:");
        SEL newSel = NSSelectorFromString(@"vkProtectEye_addSubview:");
        Method originalMethod = class_getInstanceMethod(cls, originSel);
        Method swizzledMethod = class_getInstanceMethod(cls, newSel);
        BOOL didAddMethod = class_addMethod(cls, originSel, method_getImplementation(swizzledMethod), method_getTypeEncoding(swizzledMethod));
        if (didAddMethod) {
            class_replaceMethod(cls, newSel, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod));
        } else {
            method_exchangeImplementations(originalMethod, swizzledMethod);
        }
    });
    
}

- (void)vkProtectEye_addSubview:(UIView *)view {
    [self vkProtectEye_addSubview:view];
    [[VKProtectEyeManager sharedInstance] showFirst:self];
}
@end
