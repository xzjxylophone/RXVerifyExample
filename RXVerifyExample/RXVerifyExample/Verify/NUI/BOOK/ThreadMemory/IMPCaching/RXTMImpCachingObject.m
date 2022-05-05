//
//  RXTMImpCachingObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/8.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXTMImpCachingObject.h"
// 代码1
typedef void (*_p_IMP)(id, SEL, ...);
// 代码2
static _p_IMP s_imp;
static SEL s_sel;
static _p_IMP s_instance_imp;
static SEL s_instance_sel;

@implementation RXTMImpCachingObject

+ (void)initialize { // 代码3
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        id cls = [RXTMImpCachingObject class];
        s_sel = @selector(fake_autorelease_method:);
        s_imp = (_p_IMP)[cls methodForSelector:s_sel];
    });
}

+ (void)fake_autorelease_method:(NSString *)value {
    NSLog(@"fake_autorelease_method:%@", value);
}

- (void)test {
    // 代码4
    (*s_imp)([self class], s_sel, @"abc111");
}
@end
