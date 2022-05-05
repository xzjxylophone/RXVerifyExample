//
//  RXTMImpCachingInstance2Object.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/9.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXTMImpCachingInstance2Object.h"
// 代码1
typedef void (*_p_IMP)(id, SEL, ...);
// 代码2
static _p_IMP s_instance_imp;
static SEL s_instance_sel;
@implementation RXTMImpCachingInstance2Object

+ (void)initialize { // 代码3
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        s_instance_sel = @selector(instanceMethod:); // 代码4
    });
}
// 代码5
- (void)instanceMethod:(NSString *)value {
    NSLog(@"instanceMethod:%@", value);
}
- (void)test {
    // 代码6
    s_instance_imp = (_p_IMP)[self methodForSelector:s_instance_sel];
    // 代码7
    (*s_instance_imp)([self class], s_instance_sel, @"abc111");
}
@end
