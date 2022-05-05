//
//  RXRACClassViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/7/13.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//



#import "RXRACClassViewController.h"
#import <ReactiveObjC/ReactiveObjC.h>


// 介绍multicastconnection
// https://blog.csdn.net/wsh604/article/details/78513222


@interface RXRACClassViewController ()

@end

@implementation RXRACClassViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self test_signal];
    
//    [self test_signal_cancel];
    
    [self test_subject_firstSubscribe_thenSend];
//    [self test_subject_firstSend_thenSubscribe];
    
//    [self test_replaySubject_firstSend_thenSubscribe];
//    [self test_replaySubject_firstSubscribe_thenSend];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// http://www.cnblogs.com/fengmin/p/5662270.html
#pragma mark - test


// RACSignal使用步骤：
// 1.创建信号 + (RACSignal *)createSignal:(RACDisposable * (^)(id subscriber))didSubscribe
// 2.订阅信号,才会激活信号. - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
// 3.发送信号 - (void)sendNext:(id)value
- (void)test_signal
{
    // 1.创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber> _Nonnull subscriber) {
        // 3.发送信号
        NSLog(@"%@:发送信号", NSStringFromSelector(_cmd));
        [subscriber sendNext:@(1)];
        return nil;
    }];
    
    // 2.订阅信号
    [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@:x:%@", NSStringFromSelector(_cmd), x);
    }];
}

- (void)test_signal_detail
{
    // 当订阅信号的时候,需要处理的事情,这里面会发送信号
    RACDisposable *(^doSomethingWhenSubscribeSignal)(id<RACSubscriber>) = ^RACDisposable *(id<RACSubscriber> subscriber) {
        // 3.发送信号
        NSLog(@"%@:发送信号", NSStringFromSelector(_cmd));
        [subscriber sendNext:@(1)];
        return nil;
    };
    
    // 1.创建信号
    RACSignal *signal = [RACSignal createSignal:doSomethingWhenSubscribeSignal];
    // 当收到信号的时候,需要处理的事情
    void (^doSomethingWhenReceiveSignal)(id) = ^void (id x) {
        NSLog(@"%@:x:%@", NSStringFromSelector(_cmd), x);
    };
    // 2.订阅信号
    [signal subscribeNext:doSomethingWhenReceiveSignal];
}

- (void)test_signal_cancel
{
    // 1.创建信号
    RACSignal *signal = [RACSignal createSignal:^RACDisposable * _Nullable(id<RACSubscriber> _Nonnull subscriber) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            // 3.发送信号
            NSLog(@"%@:发送信号", NSStringFromSelector(_cmd));
            [subscriber sendNext:@(1)];
        });
        
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"%@:信号发送完毕", NSStringFromSelector(_cmd));
        }];
    }];
    
    // 如果要取消就拿到RACDisposable
    // 2.订阅信号
    RACDisposable *disposable = [signal subscribeNext:^(id  _Nullable x) {
        NSLog(@"%@:x:%@", NSStringFromSelector(_cmd), x);
    } error:^(NSError * _Nullable error) {
        NSLog(@"%@:error:%@", NSStringFromSelector(_cmd), error);
    } completed:^{
        NSLog(@"%@:complete", NSStringFromSelector(_cmd));
    }];
    // 取消订阅
    [disposable dispose];
}


// RACSubject使用步骤
// 1.创建信号 [RACSubject subject]，跟RACSiganl不一样，创建信号时没有block。
// 2.订阅信号 - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
// 3.发送信号 sendNext:(id)value

// 先订阅后发送
- (void)test_subject_firstSubscribe_thenSend
{
    RACSubject *subject = [RACSubject subject];
    // 订阅信号
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"订阅者一%@", x);
    }];
    
    
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"订阅者二%@", x);
    }];
    
    // 发送信号
    [subject sendNext:@"123"];
}

// 先发送后订阅
// 无法成功
- (void)test_subject_firstSend_thenSubscribe
{
    RACSubject *subject = [RACSubject subject];

    
    // 发送信号
    [subject sendNext:@"123"];
    
    
    // 订阅信号
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"订阅者一%@", x);
    }];
    
    
    [subject subscribeNext:^(id  _Nullable x) {
        NSLog(@"订阅者二%@", x);
    }];
}



// RACReplaySubject使用步骤:
// 1.创建信号 [RACSubject subject]，跟RACSiganl不一样，创建信号时没有block。
// 2.可以先订阅信号，也可以先发送信号。
// 2.1 订阅信号 - (RACDisposable *)subscribeNext:(void (^)(id x))nextBlock
// 2.2 发送信号 sendNext:(id)value

// 先发送后订阅,正常用法
- (void)test_replaySubject_firstSend_thenSubscribe
{
    RACReplaySubject *replaySubject = [RACReplaySubject subject];
    // 发送信号
    [replaySubject sendNext:@"222"];
    [replaySubject sendNext:@"333"];
    
    // 订阅信号
    [replaySubject subscribeNext:^(id  _Nullable x) {
        NSLog(@"第一个订阅者:%@", x);
    }];
    [replaySubject subscribeNext:^(id  _Nullable x) {
        NSLog(@"第二个订阅者:%@", x);
    }];
}

// 先订阅后发送,也可以成功,因为RACReplaySubject是RACSubject的子类?
- (void)test_replaySubject_firstSubscribe_thenSend
{
    RACReplaySubject *replaySubject = [RACReplaySubject subject];

    // 订阅信号
    [replaySubject subscribeNext:^(id  _Nullable x) {
        NSLog(@"第一个订阅者:%@", x);
    }];
    [replaySubject subscribeNext:^(id  _Nullable x) {
        NSLog(@"第二个订阅者:%@", x);
    }];
    
    // 发送信号
    [replaySubject sendNext:@"222"];
    [replaySubject sendNext:@"333"];
    
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
