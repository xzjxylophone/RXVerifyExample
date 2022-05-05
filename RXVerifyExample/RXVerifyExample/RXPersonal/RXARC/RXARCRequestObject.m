//
//  RXARCRequestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCRequestObject.h"

@implementation RXARCRequestObject


- (void)start
{
    
    NSLog(@"begin start");
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"dispatch_after");
//        [self.delegate requestFinished:self];
//        // 模拟一个大任务
//        [NSThread sleepForTimeInterval:1];
//        [self _print_value];
//    });
    
    
    [self.delegate requestFinished:self];
    // 模拟一个大任务
    NSLog(@"begin sleep");
    [NSThread sleepForTimeInterval:1];
    NSLog(@"after sleep");
    [self _print_value];
    
    
//    [self.delegate requestFinished:self];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        NSLog(@"dispatch_after");
//
//        // 模拟一个大任务
//        [NSThread sleepForTimeInterval:1];
//        [self _print_value];
//    });

    
    
    
    NSLog(@"end start");
}


- (void)start2
{
    NSLog(@"begin start2");
    
//    NSLog(@"begin sleep");
//    [NSThread sleepForTimeInterval:2];
//    NSLog(@"end sleep");
//    [self _print_value];
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), queue, ^{
        NSLog(@"dispatch_after");
        NSLog(@"begin sleep");
        [NSThread sleepForTimeInterval:2];
        NSLog(@"end sleep");
        [self _print_value];
    });
    
    
    NSLog(@"end start2");
    
    
    
}

- (void)_print_value
{
    NSLog(@"RXARCRequestObject _print_value");
}
- (void)dealloc
{
    NSLog(@"RXARCRequestObject dealloc");
}
@end
