//
//  VKAnimationQueueViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/21.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKAnimationQueueViewController.h"
#import "VKAnimationQueue.h"
@interface VKAnimationQueueViewController ()
@property (nonatomic, strong) VKAnimationQueue *animationQueue;
@property (nonatomic, strong) dispatch_queue_t queue;
@end

@implementation VKAnimationQueueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.animationQueue = [VKAnimationQueue new];
    
    
    [self test1];
    
}

- (void)test1 {
    __weak typeof(self) weakSelf = self;
    void(^block1)(void) = ^(void) {
        NSLog(@"block1");
    };
    void(^block2)(void) = ^(void) {
        NSLog(@"block2");
    };
    void(^block3)(void) = ^(void) {
        NSLog(@"block3");
    };
    void(^block4)(void) = ^(void) {
        NSLog(@"block4");
    };
    
//    [weakSelf.animationQueue addAnimation:block1];
//    [weakSelf.animationQueue addAnimation:block2];
//    [weakSelf.animationQueue addAnimation:block3];
//    [weakSelf.animationQueue addAnimation:block4];
    
    [weakSelf.animationQueue addAnimations:@[block1, block2, block3, block4]];
}

- (void)test2 {
    __weak typeof(self) weakSelf = self;
    self.queue = dispatch_queue_create("klsakglsjg", DISPATCH_QUEUE_CONCURRENT);
    for (NSInteger i = 0; i < 20; i++) {
        dispatch_async(self.queue, ^{
            void(^block)(void) = ^(void) {
                NSLog(@"block%ld", i);
            };
            if (random() % 2 == 0) {
                [weakSelf.animationQueue addAnimation:block];
            } else {
                VKAnimationItem *item = [VKAnimationItem new];
                item.executeBlock = block;
                item.eliminateBlock = ^{
                    NSLog(@"elimiante block%ld", i);
                };
                [weakSelf.animationQueue addAnimationItem:item];
            }
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
