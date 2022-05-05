//
//  RXTMIntToIdObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/8.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXTMIntToIdObject.h"
typedef NS_ENUM(NSInteger, RXTMIntToIdType) {
    RXTMIntToIdType_Int,
    RXTMIntToIdType_Bool,
    RXTMIntToIdType_Object,
};

@implementation RXTMIntToIdObject
- (void)test {
    uintptr_t r1 = [self valueWithType:RXTMIntToIdType_Int];
    uintptr_t r2 = [self valueWithType:RXTMIntToIdType_Bool];
    uintptr_t r3 = [self valueWithType:RXTMIntToIdType_Object];
    // 代码1: 需要把此文件修改为不支持ARC的,才能进行转换
    NSObject *o3 = (id)r3;
    NSLog(@"%ld, %ld, %ld, %@", r1, r2, r3, o3);
}
- (uintptr_t)valueWithType:(RXTMIntToIdType)type {
    switch (type) {
        case RXTMIntToIdType_Int:
            return 0;
        case RXTMIntToIdType_Bool:
        {
            NSInteger random = arc4random() % 2;
            return random == 0;
        }
        case RXTMIntToIdType_Object:
        default:
        {
            NSString *str = @"Hello I'm a string";
            id value = str;
            // 代码2: 如果这里是int的话,会导致int溢出,会得不到正确的内存地址
            return (uintptr_t)value;
        }
    }
}
@end
