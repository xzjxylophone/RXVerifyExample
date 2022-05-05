//
//  RVGCDQueuesViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/6/19.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RVGCDQueuesViewController.h"
// 同步任务,不会创建新的线程,异步任务会创建新的线程
@interface RVGCDQueuesViewController ()

@end

@implementation RVGCDQueuesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self testTenSync_SerialQueue];
//    [self testTenAsync_SerialQueue];
    
//    [self testTenSync_ConcurrentQueue];
    
    [self testTenAsync_ConcurrentQueue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// 同步的串行队列
- (void)testTenSync_SerialQueue {
    
    NSMutableArray *mutArray = [NSMutableArray new];
    NSInteger max = 10;
    for (NSInteger i = 0; i < max; i++) {
        NSString *label = [NSString stringWithFormat:@"queue:%zd", i];
        dispatch_queue_t queue = dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_SERIAL);
        [mutArray addObject:queue];
    }
    
    for (NSInteger i = 0; i < max; i++) {
        dispatch_queue_t queue = mutArray[i];
        dispatch_sync(queue, ^{
            NSInteger time =  arc4random() % 1000;
            double sleepTime = time / 1000.0f;
            [NSThread sleepForTimeInterval:sleepTime];
            const char *label = dispatch_queue_get_label(queue);
            NSLog(@"testTenSync_SerialQueue block :%zd invoke,sleep:%.3f,thread:%@, queue:%s", i, sleepTime, [NSThread currentThread], label);
        });
    }

}

// 异步的串行队列
- (void)testTenAsync_SerialQueue {
    NSMutableArray *mutArray = [NSMutableArray new];
    NSInteger max = 10;
    for (NSInteger i = 0; i < max; i++) {
        NSString *label = [NSString stringWithFormat:@"queue:%zd", i];
        dispatch_queue_t queue = dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_SERIAL);
        [mutArray addObject:queue];
    }
    
    for (NSInteger i = 0; i < max; i++) {
        dispatch_queue_t queue = mutArray[i];
        dispatch_async(queue, ^{
            NSInteger time =  arc4random() % 1000;
            double sleepTime = time / 1000.0f;
            [NSThread sleepForTimeInterval:sleepTime];
            const char *label = dispatch_queue_get_label(queue);
            NSLog(@"testTenAsync_SerialQueue block :%zd invoke,sleep:%.3f,thread:%@, queue:%s", i, sleepTime, [NSThread currentThread], label);
        });
    }
}

// 同步并行队列
- (void)testTenSync_ConcurrentQueue {
    NSMutableArray *mutArray = [NSMutableArray new];
    NSInteger max = 10;
    for (NSInteger i = 0; i < max; i++) {
        NSString *label = [NSString stringWithFormat:@"queue:%zd", i];
        dispatch_queue_t queue = dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_CONCURRENT);
        [mutArray addObject:queue];
    }
    
    for (NSInteger i = 0; i < max; i++) {
        dispatch_queue_t queue = mutArray[i];
        dispatch_sync(queue, ^{
            NSInteger time =  arc4random() % 1000;
            double sleepTime = time / 1000.0f;
            [NSThread sleepForTimeInterval:sleepTime];
            const char *label = dispatch_queue_get_label(queue);
            NSLog(@"testTenAsync_SerialQueue block :%zd invoke,sleep:%.3f,thread:%@, queue:%s", i, sleepTime, [NSThread currentThread], label);
        });
    }
}


// 异步并行队列
- (void)testTenAsync_ConcurrentQueue {
    NSMutableArray *mutArray = [NSMutableArray new];
    NSInteger max = 10;
    for (NSInteger i = 0; i < max; i++) {
        NSString *label = [NSString stringWithFormat:@"queue:%zd", i];
        dispatch_queue_t queue = dispatch_queue_create([label UTF8String], DISPATCH_QUEUE_CONCURRENT);
        [mutArray addObject:queue];
    }
    
    for (NSInteger i = 0; i < max; i++) {
        dispatch_queue_t queue = mutArray[i];
        dispatch_async(queue, ^{
            NSInteger time =  arc4random() % 1000;
            double sleepTime = time / 1000.0f;
            [NSThread sleepForTimeInterval:sleepTime];
            const char *label = dispatch_queue_get_label(queue);
            NSLog(@"testTenAsync_SerialQueue block :%zd invoke,sleep:%.3f,thread:%@, queue:%s", i, sleepTime, [NSThread currentThread], label);
        });
    }
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
