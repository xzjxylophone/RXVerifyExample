//
//  RXBlockChangeOverTimeObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/16.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBlockChangeOverTimeObject.h"
#import "RXPrintUtil.h"

NSInteger globalVariable = 1;

@interface RXBlockChangeOverTimeObject()
@property (nonatomic, copy) NSInteger(^block)(NSInteger);
@property (nonatomic, assign) NSInteger instanceVariable;
@end



@implementation RXBlockChangeOverTimeObject

- (void)test
{
    NSLog(@"--------RXBlockChangeOverTimeObject--------");
    // 定义几种类型的变量
    self.instanceVariable = 10;
    NSInteger localVariable = 100;
    static NSInteger staticLocalVariable = 99;
    __block NSInteger blockVariable = 1000;
    
    // 定义分别使用类型变量的block
    NSInteger (^block_noVariable)(NSInteger) = ^(NSInteger m) {
        return m;
    };
    NSInteger (^block_globalVariable)(NSInteger) = ^(NSInteger m) {
        return m + globalVariable;
    };
    __weak typeof(self) weakSelf = self;
    NSInteger (^block_instanceVariable)(NSInteger) = ^(NSInteger m) {
        return m + weakSelf.instanceVariable;
    };
    NSInteger (^block_localVariable)(NSInteger) = ^(NSInteger m) {
        return m + localVariable;
    };
    NSInteger (^block_staticLocalVariable)(NSInteger) = ^(NSInteger m) {
        return m + staticLocalVariable;
    };
    NSInteger (^block_blockVariable)(NSInteger) = ^(NSInteger m) {
        blockVariable++;
        return m + blockVariable;
    };
    NSInteger (^block_composedVarialbe)(NSInteger) = ^(NSInteger m) {
        return m + localVariable + staticLocalVariable;
    };
    
    // 输出定义好的block变量
    [RXPrintUtil printBlockWithPrefix:@"block_noVariable" block:block_noVariable];
    [RXPrintUtil printBlockWithPrefix:@"block_globalVariable" block:block_globalVariable];
    [RXPrintUtil printBlockWithPrefix:@"block_instanceVariable" block:block_instanceVariable];
    [RXPrintUtil printBlockWithPrefix:@"block_localVariable" block:block_localVariable];
    [RXPrintUtil printBlockWithPrefix:@"block_staticLocalVariable" block:block_staticLocalVariable];
    [RXPrintUtil printBlockWithPrefix:@"block_blockVariable" block:block_blockVariable];
    [RXPrintUtil printBlockWithPrefix:@"block_composedVarialbe" block:block_composedVarialbe];
    
    // 分别设置block
    self.block = block_noVariable;
    [RXPrintUtil printBlockWithPrefix:@"self block_noVariable" block:self.block];
    
    self.block = block_globalVariable;
    [RXPrintUtil printBlockWithPrefix:@"self block_globalVariable" block:self.block];
    
    self.block = block_instanceVariable;
    [RXPrintUtil printBlockWithPrefix:@"self block_instanceVariable" block:self.block];
    
    self.block = block_localVariable;
    [RXPrintUtil printBlockWithPrefix:@"self block_localVariable" block:self.block];
    
    self.block = block_staticLocalVariable;
    [RXPrintUtil printBlockWithPrefix:@"self block_staticLocalVariable" block:self.block];
    
    self.block = block_blockVariable;
    [RXPrintUtil printBlockWithPrefix:@"self block_blockVariable" block:self.block];
    
    self.block = block_composedVarialbe;
    [RXPrintUtil printBlockWithPrefix:@"self block_composedVarialbe" block:self.block];
}
- (void)dealloc
{
    NSLog(@"RXBlockChangeOverTimeMRCObject dealloc");
}
@end
