//
//  RXMethodSwizzleTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/29.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXMethodSwizzleTestObject.h"
#import "RXMethodSwizzleRoughlyObject.h"
#import "RXMethodSwizzleSafelyObject.h"
#import "RXMethodSwizzleOverrideRoughlyObject.h"
#import "RXMethodSwizzleOverrideSafelyObject.h"

@implementation RXMethodSwizzleTestObject
- (void)private_test_parent
{
    RXMethodSwizzleParentObject *obj = [RXMethodSwizzleParentObject new];
    [obj print];
}

- (void)test_roughly
{
    RXMethodSwizzleRoughlyObject *obj = [RXMethodSwizzleRoughlyObject new];
    [obj print];
}
- (void)test_roughly_after_parent
{
    [self private_test_parent];
    RXMethodSwizzleRoughlyObject *obj = [RXMethodSwizzleRoughlyObject new];
    [obj print];
}
- (void)test_roughly_before_parent
{
    RXMethodSwizzleRoughlyObject *obj = [RXMethodSwizzleRoughlyObject new];
    [obj print];
    // 居然会崩溃!!!!好样的,是这一行崩溃!
    [self private_test_parent];
}
- (void)test_safely
{
    
}
- (void)test_override_roughly
{
    
}
- (void)test_oveerrid_safely
{
    
}
@end
