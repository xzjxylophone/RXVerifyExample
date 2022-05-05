//
//  RXNSArrayTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/25.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXNSArrayTestObject.h"
#import "RXRuntimeUtil.h"
@implementation RXNSArrayTestObject

- (void)test
{
    NSArray *ary = @[@"123", @"456", @"789"];
    
    [RXRuntimeUtil printIvarList:ary];
    [RXRuntimeUtil printPropertyList:ary];
    [RXRuntimeUtil printMethodList:ary];
    NSLog(@"%ld", ary.count);
}

@end
