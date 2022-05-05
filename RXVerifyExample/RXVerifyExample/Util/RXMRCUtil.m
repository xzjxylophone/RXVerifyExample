//
//  RXMRCUtil.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/19.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMRCUtil.h"

@implementation RXMRCUtil
// 得到引用计数
+ (NSUInteger)objectRetainCount:(id)object
{
    return [object retainCount];
}
// 释放一个对象
+ (void)objectRelease:(id)object
{
//    NSAutoreleasePool
    [object release];
}
@end
