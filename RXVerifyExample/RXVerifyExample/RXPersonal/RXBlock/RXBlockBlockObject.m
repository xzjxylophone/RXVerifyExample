//
//  RXBlockBlockObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/14.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBlockBlockObject.h"
@interface RXBlockBlockObject()
@property (nonatomic, copy) int(^block)(int);
@property (nonatomic, assign) int tmpValue;
@end
@implementation RXBlockBlockObject
- (void)test
{
//    [self _test_block_normal];
//    [self _test_block_nested_retain_cycle];
    [self _test_block_nested];
}

- (void)_test_block_normal
{
    self.tmpValue = 10;
    self.block = ^(int m) {
        return m + 4;
    };
    void (^block1)(void) = ^{
        NSLog(@"%zd", self.block(5));
    };
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), block1);
}

- (void)_test_block_nested_retain_cycle
{
    self.tmpValue = 10;
    
    // A(self)强引用了B(block),B强引用了C(block1),C强引用了A(self)了,导致循环引用
    self.block = ^(int m) {
        // inline block
        
        void (^block1)(void) = ^{
            // 不会提示warning,但是实际上已经出现了循环引用
            NSLog(@"%zd", self.tmpValue + m);
            // 会提示warning: Capturing 'self' strongly in this block is likely to load to a retain cycle
            // 但是感觉这是无限递归调用了~~~~
            //            NSLog(@"%zd", self.block(10));
        };
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), block1);
        return m + 4;
    };
    void (^block2)(void) = ^{
        NSLog(@"%zd", self.block(5));
    };
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), block2);
}

- (void)_test_block_nested
{
    self.tmpValue = 10;
    __weak __typeof(self) weakSelf = self;
    self.block = ^(int m) {
        // inline block
        __strong __typeof(self) strongSelf = weakSelf;
        void (^block1)(void) = ^{
            NSLog(@"%zd", strongSelf.tmpValue + m);
        };
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), block1);
        return m + 4;
    };
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"%zd", self.block(5));
    });
}

- (void)dealloc
{
    NSLog(@"RXBlockBlockObject dellloc");
}

@end
