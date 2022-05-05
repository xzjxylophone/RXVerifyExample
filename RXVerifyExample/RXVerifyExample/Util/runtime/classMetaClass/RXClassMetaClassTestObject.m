//
//  RXClassMetaClassTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/7.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXClassMetaClassTestObject.h"
#import "RXClassMetaClassObject.h"
#import "RXClassMetaClassOverrideObject.h"
#import "RXRuntimeUtil.h"
#import <objc/runtime.h>
#import "RXClassMetaClassResponseObject.h"
@implementation RXClassMetaClassTestObject
- (void)mainTest
{
    [self _test_class_same];
//    [self _test];
//    [self _test2];
//    [self _test_override];
    
//    [self _test_response];
}

- (void)_test_class_same
{
    Class cls1 = [RXClassMetaClassObject class];
    Class cls2 = [[RXClassMetaClassObject new] class];
    BOOL value = cls1 == cls2;
    NSLog(@"value:%zd", value);
}


- (void)_test
{
//    [RXRuntimeUtil printMethodListWithClass:[NSObject class]];
    
    [RXRuntimeUtil printMethodListWithClass:[RXClassMetaClassObject class]];
    [RXRuntimeUtil printMethodListWithClass:[[RXClassMetaClassObject new] class]];
}
- (void)_test2
{
    // 这两个概念怎么有冲突??
//    [RXRuntimeUtil respondsToSelector:nil];
    
    
    [RXClassMetaClassObject print_same_name];
    [[RXClassMetaClassObject new] print_same_name];
}

- (void)_test_response
{
    BOOL value1 = [RXClassMetaClassResponseObject respondsToSelector:@selector(print_test_response)];
    
    RXClassMetaClassResponseObject *object = [RXClassMetaClassResponseObject new];
    BOOL value2 = [object respondsToSelector:@selector(print_test_response)];
    
    NSLog(@"value1:%zd, value2:%zd", value1, value2);
}
- (void)_test_override
{
    [RXClassMetaClassOverrideObject class];
    [[RXClassMetaClassOverrideObject new] class];
}
@end
