//
//  RXRACMTViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/7/18.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXRACMTViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>

@interface RXRACMTViewController ()

@end

@implementation RXRACMTViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self test_mt_coldSignal];
    
//    [self test_mt_hotSignal];
    
    [self test_mt_subject_replaySubject];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// 冷信号每订阅一次,就发送一次
- (void)test_mt_coldSignal
{
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        NSLog(@"send signal");
        [subscriber sendNext:@1];
        [subscriber sendNext:@2];
        [subscriber sendNext:@3];
        [subscriber sendCompleted];
        return nil;
    }];
    
    NSLog(@"signal was create");
    
    [[RACScheduler mainThreadScheduler] afterDelay:0.1 schedule:^{
        [signal subscribeNext:^(id  _Nullable x) {
            NSLog(@"subscriber 1 receive: %@", x);
        }];
    }];
    
    
    [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
        [signal subscribeNext:^(id  _Nullable x) {
            NSLog(@"subscriber 2 receive: %@", x);
        }];
    }];
}

- (void)test_mt_hotSignal
{
    RACSignal *sourceSignal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber>  _Nonnull subscriber) {
        
        NSLog(@"send signal");
        [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
            
            NSLog(@"send 1");
            [subscriber sendNext:@1];
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
            NSLog(@"send 2");
            [subscriber sendNext:@2];
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:3 schedule:^{
            NSLog(@"send 3");
            [subscriber sendNext:@3];
        }];
        [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
            [subscriber sendCompleted];
        }];
        return nil;
    }];
//    RACMulticastConnection *connection = [sourceSignal multicast:[RACReplaySubject new]];
    RACMulticastConnection *connection = [sourceSignal publish];
    [connection connect];
    
    RACSignal *signal = connection.signal;
    NSLog(@"signal was create");
    
    [[RACScheduler mainThreadScheduler] afterDelay:1.1 schedule:^{
        [signal subscribeNext:^(id  _Nullable x) {
            NSLog(@"subscriber 1 receive: %@", x);
        }];
    }];
    
    [[RACScheduler mainThreadScheduler] afterDelay:2.1 schedule:^{
        [signal subscribeNext:^(id  _Nullable x) {
            NSLog(@"subscriber 2 receive: %@", x);
        }];
    }];
}



// replay subject 在订阅的时候会先处理一下以前收到的消息
- (void)test_mt_subject_replaySubject
{
    RACSubject *subject = [RACSubject subject];
    RACReplaySubject *replaySubject = [RACReplaySubject subject];
    
    [[RACScheduler mainThreadScheduler] afterDelay:0.1 schedule:^{
        [subject subscribeNext:^(id  _Nullable x) {
            NSLog(@"Subscriber 1 get a next value: %@ from subject", x);
        }];
        [replaySubject subscribeNext:^(id  _Nullable x) {
            NSLog(@"Subscriber 1 get a next value: %@ from replay subject", x);
        }];
        
        [subject subscribeNext:^(id  _Nullable x) {
            NSLog(@"Subscriber 2 get a next value: %@ from subject", x);
        }];
        [replaySubject subscribeNext:^(id  _Nullable x) {
            NSLog(@"Subscriber 2 get a next value: %@ from replay subject", x);
        }];
        
        
    }];
    
    [[RACScheduler mainThreadScheduler] afterDelay:1 schedule:^{
        [subject sendNext:@"send package 1"];
        [replaySubject sendNext:@"send package 1"];
    }];
    
    [[RACScheduler mainThreadScheduler] afterDelay:1.1 schedule:^{
        [subject subscribeNext:^(id  _Nullable x) {
            NSLog(@"Subscriber 3 get a next value: %@ from subject", x);
        }];
        
        [replaySubject subscribeNext:^(id  _Nullable x) {
            NSLog(@"Subscriber 3 get a next value: %@ from replay subject", x);
        }];
        
        
        [subject subscribeNext:^(id  _Nullable x) {
            NSLog(@"Subscriber 4 get a next value: %@ from subject", x);
        }];
        
        [replaySubject subscribeNext:^(id  _Nullable x) {
            NSLog(@"Subscriber 4 get a next value: %@ from replay subject", x);
        }];
    }];
    
    [[RACScheduler mainThreadScheduler] afterDelay:2 schedule:^{
        [subject sendNext:@"send package 2"];
        [replaySubject sendNext:@"send package 2"];
    }];
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
