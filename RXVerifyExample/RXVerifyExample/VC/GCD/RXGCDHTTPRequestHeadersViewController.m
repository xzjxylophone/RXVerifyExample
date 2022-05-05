//
//  RXGCDHTTPRequestHeadersViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2022/1/11.
//  Copyright © 2022 Rush.D.Xzj. All rights reserved.
//

#import "RXGCDHTTPRequestHeadersViewController.h"

@interface RXGCDHTTPRequestHeadersViewController ()
@property (nonatomic, strong) dispatch_queue_t concurrentQueue;
@property (nonatomic, strong) dispatch_queue_t anotherQueue;
@property (nonatomic, strong) NSTimer *timer1;
@property (nonatomic, strong) NSTimer *timer2;
@end

@implementation RXGCDHTTPRequestHeadersViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.concurrentQueue = dispatch_queue_create("com....kkkk", DISPATCH_QUEUE_CONCURRENT);
    self.anotherQueue = dispatch_queue_create("com....kkkk", DISPATCH_QUEUE_CONCURRENT);
    
    [self test];
}

- (void)test {
    self.timer1 = [NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(timer1Action) userInfo:nil repeats:YES];
    self.timer2 = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(timer2Action) userInfo:nil repeats:YES];
}

- (void)timer1Action {
    [self _prx_concurrent];
}
- (void)timer2Action {
    [self _prx_other];
}

- (void)_prx_concurrent {
    NSString __block *value;
    dispatch_sync(self.concurrentQueue, ^{
        value = @"abccccc";
    });
    NSLog(@"value1:%@", value);
}
- (void)_prx_other {
    
    NSString __block *value;
    dispatch_sync(self.anotherQueue, ^{
        value = @"abccccc";
    });
    NSLog(@"value2:%@", value);
    
//    dispatch_async(self.anotherQueue, ^{
//        dispatch_sync(dispatch_get_main_queue(), ^{
//            NSLog(@"value2:::%@", [NSThread currentThread]);
//        });
//    });
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
