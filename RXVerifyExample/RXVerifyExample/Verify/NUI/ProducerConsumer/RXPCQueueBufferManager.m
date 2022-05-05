//
//  RXPCQueueBufferManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/7/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXPCQueueBufferManager.h"
#import "RXPCQueueBuffer.h"
#import "RXPCDefectQueueBuffer.h"
@interface RXPCQueueBufferManager ()

@property (nonatomic, strong) RXPCQueueBuffer *perfectQueueBuffer;
@property (nonatomic, strong) RXPCDefectQueueBuffer *defectQueueBuffer;

@property (nonatomic, strong) id<RXPCQueueBufferProtocol> currentQueueBuffer;


@property (nonatomic, strong) dispatch_queue_t concurrentQueue;


@end

@implementation RXPCQueueBufferManager

- (void)test {
    
    NSLog(@"22222222");
//    [self test_defect_producer_full];
    
//    [self test_defect_consume_empty];
    
    [self test_perfect_producer_full];
    
//    [self test_perfect_consume_empty];
}


#pragma mark - Perfect Queue Buffer
// 三分之一消耗,三分之二生产,会产生大量的full
- (void)test_perfect_producer_full {
    self.currentQueueBuffer = self.perfectQueueBuffer;
    // 先填满
    for (NSInteger i = 0; i < self.currentQueueBuffer.maxLength; i++) {
//        [self.currentQueueBuffer push:@(i)];
        [self producerOne:i];
    }
    // 生产10个
//    NSInteger start = self.currentQueueBuffer.maxLength;
//    for (NSInteger i = 0; i < 10; i++) {
//        [self producerOne:start];
//        start += 1;
//    }
//    // 消耗十个
//    for (NSInteger i = 0; i < 10; i++) {
//        [self consumerOne];
//    }
    
//    // 5秒后,打印状态
//    __weak typeof(self) weakSelf = self;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [weakSelf.currentQueueBuffer print];
//    });
//    // 6秒后,消耗十个
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        for (NSInteger i = 0; i < weakSelf.currentQueueBuffer.maxLength; i++) {
//            [weakSelf consumerOne];
//        }
//    });
//    // 10秒后再打印状态
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [weakSelf.currentQueueBuffer print];
//    });
}

// 三分之一生成,三分之二消耗,会产生大量的empty
- (void)test_perfect_consume_empty {
    self.currentQueueBuffer = self.perfectQueueBuffer;
    
    for (NSInteger i = 0; i < 10; i++) {
        [self consumerOne];
    }
    
    for (NSInteger i = 0; i < 10; i++) {
        [self producerOne:i];
    }
}

#pragma mark - Defect Queue Buffer
- (void)test_defect_producer_full {
    self.currentQueueBuffer = self.defectQueueBuffer;
    // 先填满
    for (NSInteger i = 0; i < self.currentQueueBuffer.maxLength; i++) {
        [self.currentQueueBuffer push:@(i)];
    }
    
    // 用多线程生产10个,不保证一定生产10个
    NSInteger start = self.currentQueueBuffer.maxLength;
    for (NSInteger i = 0; i < 10; i++) {
        [self producerOne:start];
        start += 1;
    }
    // 使用多线程消耗10个
    for (NSInteger i = 0; i < 10; i++) {
        [self consumerOne];
    }
    
    // 5秒后,打印状态
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.currentQueueBuffer print];
    });
    // 6秒后,消耗所有的
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(6 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        for (NSInteger i = 0; i < weakSelf.currentQueueBuffer.maxLength; i++) {
            [weakSelf consumerOne];
        }
    });
    // 10秒后再打印状态
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [weakSelf.currentQueueBuffer print];
    });
}

- (void)test_defect_consume_empty {
    self.currentQueueBuffer = self.defectQueueBuffer;
    
    // 先消耗10个,不保证一定消耗10个
    for (NSInteger i = 0; i < 10; i++) {
        [self consumerOne];
    }
    // 再生产10个
    for (NSInteger i = 0; i < 10; i++) {
        [self producerOne:i];
    }
}


#pragma mark - Private
- (void)producerOne:(NSInteger)index {
    __weak typeof(self) weakSelf = self;
    dispatch_async(self.concurrentQueue, ^{
        [weakSelf.currentQueueBuffer push:@(index)];
    });
}
- (void)consumerOne {
    __weak typeof(self) weakSelf = self;
    dispatch_async(self.concurrentQueue, ^{
        [weakSelf.currentQueueBuffer pop];
    });
}

#pragma mark - Prefect Queue Buffer

#pragma mark - Signal
- (id)init {
    if (self = [super init]) {
        self.perfectQueueBuffer = [RXPCQueueBuffer defaultQueueBuffer];
        self.defectQueueBuffer = [RXPCDefectQueueBuffer defaultQueueBuffer];
        self.concurrentQueue = dispatch_queue_create("www.pc.com.abc", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}
+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
@end
