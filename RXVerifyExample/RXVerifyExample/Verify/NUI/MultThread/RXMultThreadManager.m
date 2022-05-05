//
//  RXMultThreadManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2020/8/27.
//  Copyright © 2020 Rush.D.Xzj. All rights reserved.
//

#import "RXMultThreadManager.h"
#import "RXMultThreadOperationQueueManager.h"
#import "RXMultThreadOperation.h"

@interface RXMultThreadManager ()

@property (nonatomic, strong) dispatch_queue_t serialQueue;
@property (nonatomic, strong) dispatch_queue_t concurrentQueue;

@property (nonatomic, assign) NSInteger renderIndex;

@property (nonatomic, strong) NSMutableArray *threadViewArray;

@end

@implementation RXMultThreadManager



- (void)test {
    [self test2];
}
- (void)test2 {
    [NSTimer scheduledTimerWithTimeInterval:1.01 repeats:YES block:^(NSTimer * _Nonnull timer) {
        [self test_test2];
    }];
    
}
- (void)test_test2 {
    self.threadViewArray = [NSMutableArray new];
    for (NSInteger i = 0; i < 10; i++) {
        RXMultThreadView *threadView = [RXMultThreadView new];
        RXMultThreadOperation *operation = [[RXMultThreadOperation alloc] initWithMultThreadView:threadView];
        [[RXMultThreadOperationQueueManager sharedInstance].operationQueue addOperation:operation];
        [self.threadViewArray addObject:threadView];
    }
}

- (void)test1 {
    for (NSInteger i = 0; i < 100; i++) {
        dispatch_async(self.concurrentQueue, ^{
            [self _test_subTaskWithIndex:i];
        });
    }
}

- (void)_test_subTaskWithIndex:(NSInteger)index {
    dispatch_async(self.serialQueue, ^{
//        self.renderIndex++;
        NSLog(@"mult_thread_gcd_serial:%ld", (long)index);
        NSArray *array = @[@"abb"];
        NSDictionary *dict = @{@"a": @(11)};
        NSLog(@"array:%@, dict:%@", array, dict);

        dispatch_async(self.serialQueue, ^{
//            self.renderIndex++;
            NSLog(@"mult_thread_gcd_serial nest:%ld", (long)index);
            NSArray *array2 = @[@"abb"];
            NSDictionary *dict2 = @{@"a": @(11)};
            NSLog(@"array:%@, array2:%@, dict:%@, dict2:%@", array, array2, dict, dict2);
        });
    });
}

#pragma mark - Signal
- (id)init {
    if (self = [super init]) {
        self.serialQueue = dispatch_queue_create("aaa", DISPATCH_QUEUE_SERIAL);
        self.concurrentQueue = dispatch_queue_create("bbb", DISPATCH_QUEUE_CONCURRENT);
    }
    return self;
}
+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
@end
