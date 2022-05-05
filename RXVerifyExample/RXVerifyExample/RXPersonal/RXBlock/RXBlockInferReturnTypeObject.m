//
//  RXBlockInferReturnTypeObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/14.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBlockInferReturnTypeObject.h"

@implementation RXBlockInferReturnTypeObject


- (void)mainTest
{
    
}

- (void)_incorrect_test
{
    // 以下的例子都是错误的,因为在定义变量的时候,必须要明确的指定返回类型
    // 是block表达式中省略了返回值类型
//    (^block1)(void) = ^(void) {
//        return nil;
//    };
//
//    (^block2)(void) = id ^(void) {
//        return nil;
//    };
//
//    (^block3)(void) = (id)^(void) {
//        return nil;
//    };
}

- (void)_correct_test
{
    // 这个例子是错误的,因为nil在这里被理解为了 void*
//    id (^block1)(void) = ^(void) {
//        return nil;
//    };
    // 这样就可以了,定义变量的时候,让其返回void*
    void* (^block2)(void) = ^(void) {
        return nil;
    };
    // 在block表达式中,省略了返回值类型
    id (^block3)(void) = ^(void) {
        return [NSObject new];
    };
    // 在block表达式中,明确的指出了返回值类型
    // 不是明确的指出了,是强制转为id类型
    id (^block4)(void) = (id)^(void) {
        return [NSObject new];
    };
    // 当参数列表是void的时候,在block表达式中可以省略
    // 返回值类型是推断的 为void
    void (^block5)(void) = ^{
        NSLog(@"1");
    };
    // 当参数列表是void的时候,在block表达式中可以省略
    // 返回值类型是推断的 为id
    id (^block6)(void) = ^{
        return [NSObject new];
    };
    // 当参数列表是void的时候,在block表达式中可以省略
    // 返回值类型是指明的 为id
    id (^block7)(void) = (id)^{
        return [NSObject new];
    };
    id block8 = ^(int m) {
        switch (m) {
            case 1:
            {
                // 这里推断出block应该返回int
                return 1;
            }
                break;
//            case 2:
//            {
//                // Error: Return type 'NSObject *' must match previous return type 'int' when block literal has unspecified explicit return type
//                return [NSObject new];
//            }
//                break;
            case 3:
            {
                // 强行把double转换为整形,也许通常我们的做法是把case 1: 中返回int转换为返回double
                return (int)(m + 4.0);
            }
                break;
//            case 4:
//            {
//                // Error: Return type 'void *' must match previous return type 'int' when block literal has unspecified explicit return type
//                return nil;
//            }
//                break;
            default:
            {
                return 0;
            }
                break;
        }
    };

    // block是一个对象,所以可以直接定义id block9
    id block9 = ^(int m) {
        return 5 + m;
    };
    
    // 正确的方法:显示的指明返回值类型
    void (^block10)(void) = ^void(void) {
        NSLog(@"11");
    };
    int (^block11)(int m) = ^int(int m) {
        return m + 4;
    };
    
    int (^block12)(void) = ^int {
        return 4;
    };
    
    
    block2();
    block3();
    block4();
    block5();
    block6();
    block7();
    int (^block_transf8)(int) = (int(^)(int))block8;
//    int (^block_transf8)(int) = block8;
    block_transf8(1);
    int (^block_transf9)(int) = block9;
    block_transf9(1);
    block10();
    block11(2);
    block12();
    
    id block20 = ^void (void) { printf("hello world\n"); };
    id block21 = ^(void) { printf("hello world\n"); };
    id block22 = ^{ printf("hello world\n"); };
    id block23 = ^void { printf("hello world\n"); };
    
    NSLog(@"%@, %@, %@, %@", block20, block21, block22, block23);
}

@end
