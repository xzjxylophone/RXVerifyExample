//
//  RXQueueSpecialViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/7.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXQueueSpecialViewController.h"


static const void * const abc = &abc;

@interface RXQueueSpecialViewController ()

@end

@implementation RXQueueSpecialViewController

// https://www.jianshu.com/p/f9e01c69a46f 搜索dispatch_queue_set_specific 关键词
// https://blog.csdn.net/yiyaaixuexi/article/details/17752925
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self inSameQueue];
    [self notInSameQueue];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (BOOL)isCurQueueEqualQueue:(dispatch_queue_t)queue {
    NSString *specificKey = @"com.specific.specificKey";
    NSString *specificValue = [NSString stringWithFormat:@"com.specific.sepcificValue.%@", [NSDate new]];
    dispatch_queue_set_specific(queue, &specificKey, (__bridge void *)specificValue, NULL);
    NSString *retrievedValue = (__bridge NSString *)dispatch_get_specific(&specificKey);
    return [retrievedValue isEqualToString:specificValue];
}
- (void)inSameQueue
{
    __weak __typeof(self) weakSelf = self;
    printf("\n=======inSameQueue=========\n");
    dispatch_queue_t queueA = dispatch_queue_create("com.yiyaaixuexi.queueA", NULL);
    dispatch_queue_t queueB = dispatch_queue_create("com.yiyaaixuexi.queueB", NULL);
    
    printf("queue1:%s\n", dispatch_queue_get_label(dispatch_get_current_queue()));
    
    dispatch_sync(queueA, ^{
        printf("queue2:%s\n", dispatch_queue_get_label(dispatch_get_current_queue()));
        BOOL same = [weakSelf isCurQueueEqualQueue:queueA];
        NSLog(@"same value: %@", same ? @"Same" : @"Not Same");
    });
}

- (void)notInSameQueue
{
    __weak __typeof(self) weakSelf = self;
    printf("\n=======notInSameQueue=========\n");
    dispatch_queue_t queueA = dispatch_queue_create("com.yiyaaixuexi.queueA", NULL);
    dispatch_queue_t queueB = dispatch_queue_create("com.yiyaaixuexi.queueB", NULL);
    
    printf("queue1:%s\n", dispatch_queue_get_label(dispatch_get_current_queue()));
    
    dispatch_sync(queueB, ^{
        printf("queue2:%s\n", dispatch_queue_get_label(dispatch_get_current_queue()));
        BOOL same = [weakSelf isCurQueueEqualQueue:queueA];
        NSLog(@"same value: %@", same ? @"Same" : @"Not Same");
        
    });
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
