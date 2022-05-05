//
//  RXAnimationTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/2/20.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXAnimationTestObject.h"
#import "RXBasicAnimationTestObject.h"
@implementation RXAnimationTestObject
- (void)testWithView:(UIView *)view
{
    [self _test_basic_animationWithView:view];
}

- (void)_test_basic_animationWithView:(UIView *)view;
{
    RXBasicAnimationTestObject *tmp = [RXBasicAnimationTestObject new];
    [tmp testInView:view];
}
@end
