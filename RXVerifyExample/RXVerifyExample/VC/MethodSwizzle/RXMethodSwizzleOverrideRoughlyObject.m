//
//  RXMethodSwizzleOverrideRoughlyObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/29.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXMethodSwizzleOverrideRoughlyObject.h"
#import "RXRuntimeUtil.h"
@implementation RXMethodSwizzleOverrideRoughlyObject
+ (void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [RXRuntimeUtil exchangeMethodRoughly:[obj class] originSel:@selector(print) newSel:@selector(customPrint)];
    });
}
- (void)print
{
    NSLog(@"object 3");
}
- (void)customPrint {
    [self customPrint];
    NSLog(@"customPrint 3");
}
@end
