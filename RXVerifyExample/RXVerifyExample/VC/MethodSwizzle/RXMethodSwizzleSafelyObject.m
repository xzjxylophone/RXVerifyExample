//
//  RXMethodSwizzleSafelyObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/29.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXMethodSwizzleSafelyObject.h"
#import "RXRuntimeUtil.h"
@implementation RXMethodSwizzleSafelyObject
+ (void)initialize
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        id obj = [[self alloc] init];
        [RXRuntimeUtil exchangeMethodSafely:[obj class] originSel:@selector(print) newSel:@selector(customPrint)];
    });
    
}
- (void)customPrint {
    [self customPrint];
    NSLog(@"customPrint 22");
}
@end
