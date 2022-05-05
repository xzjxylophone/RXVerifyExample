//
//  RXBlockTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/7.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBlockTestObject.h"
#import "RXBlockQSortBRObject.h"
#import "RXBlockArrayObject.h"
#import "RXBlockVariableTypeObject.h"
#import "RXBlockReferenceValueObject.h"
#import "RXBlockBlockObject.h"
#import "RXBlockChangeOverTimeObject.h"
#import "RXBlockChangeOverTimeMRCObject.h"
NSInteger CounterGlobal = 0;




@implementation RXBlockTestObject
- (void)mainTest
{
    
//    [self _test_qsort_b_r];
    
//    [self _test_block_array];
    
    [self _test_variable_type];
    
//    [self _test_reference_value];
    
//    [self _test_block];
    
    
//    [self _test_change_over_time];
//    
//    [self _test_change_over_time_mrc];
}

- (void)dontDoThis {
//    void (^blockArray[3])(void);  // an array of 3 block references
//
//    for (int i = 0; i < 3; ++i) {
//        blockArray[i] = ^{ printf("hello, %d\n", i); };
//        // WRONG: The block literal scope is the "for" loop.
//    }
    
    void (^block)(void);
    
    long i = random();
    if (i > 1000) {
        block = ^{ printf("got i at: %d\n", i); };
        // WRONG: The block literal scope is the "then" clause.
    }
    
    
}

- (void)_test_for_mass
{
    __block int a = 0;
    for (int i = 0; i < 10000; i++) {
        void (^block)(void) = ^{
            a++;
            NSLog(@"%zd", a);
        };
        block();
    }
    
//    // Warning: This block declaration is not a prototype
//    void (^block2)() = ^{
//        a++;
//        NSLog(@"%zd", a);
//    };
//    block2();
    
    
    
//    int n = 10;
//    int aaaaa[n];
    
//    __block NSMutableArray *ary = [NSMutableArray new];
//    void (^block4)(int) = ^(int b) {
//        ary = [NSMutableArray new];
//    };
    
//    void (^block3)(int) = ^(int b){
////        return b + 4;
//        NSLog(@"111");
//    };
//    int d = block3(10 );
    
//    id (^block3)(void) = ^(void) {
////        return nil;
//        return [NSObject new];
//    };
//    block3();

}

- (void)_test_qsort_b_r
{
    RXBlockQSortBRObject *rxBlockQSortBRObject = [RXBlockQSortBRObject new];
    [rxBlockQSortBRObject test_qsort_b];
    
    [rxBlockQSortBRObject test_qsort_r];
}

- (void)_test_block_array
{
    RXBlockArrayObject *rxBlockArrayObject = [RXBlockArrayObject new];
    [rxBlockArrayObject test];
}

- (void)_test_variable_type
{
    RXBlockVariableTypeObject *rxBlockVariableTypeObject = [RXBlockVariableTypeObject new];
    [rxBlockVariableTypeObject test];
}
- (void)_test_reference_value
{
    // tmp 对象没有别的地方被引用,理论上这个函数结束的时候,tmp应该会在第一时间释放
    RXBlockReferenceValueObject *tmp = [RXBlockReferenceValueObject new];
    [tmp test];
    NSLog(@"_test_reference_value end");
}

- (void)_test_block
{
    RXBlockBlockObject *tmp = [RXBlockBlockObject new];
    [tmp test];
    // tmp 会被释放的
}
- (void)_test_change_over_time
{
    RXBlockChangeOverTimeObject *tmp = [RXBlockChangeOverTimeObject new];
    [tmp test];
}
- (void)_test_change_over_time_mrc
{
    RXBlockChangeOverTimeMRCObject *tmp = [RXBlockChangeOverTimeMRCObject new];
    [tmp test];
}



@end
