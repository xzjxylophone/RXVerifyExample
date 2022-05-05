//
//  RXCurrentQueueViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/7.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXCurrentQueueViewController.h"
#import "RXPreHeader.h"


void func(dispatch_queue_t queue, dispatch_block_t block)
{
    RXWarningIgnore_Wdeprecated_declarations (
        printf("queue5:%s\n", dispatch_queue_get_label(dispatch_get_current_queue()));
        printf("queue:%s\n", dispatch_queue_get_label(queue));
        if (dispatch_get_current_queue() == queue) {
            block();
        } else {
            dispatch_sync(queue, block);
        }
    );
}



@interface RXCurrentQueueViewController ()

@end

@implementation RXCurrentQueueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    [self deadLockFunc];
    
    
    [self testMain];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)testMain {
    RXWarningIgnore_Wdeprecated_declarations (
        dispatch_queue_t mainQueue = dispatch_get_main_queue();
        printf("mainQueue:%s\n", dispatch_queue_get_label(mainQueue));
        dispatch_queue_t serialQueue = dispatch_queue_create("1111", DISPATCH_QUEUE_SERIAL);
        dispatch_async(serialQueue, ^{
            dispatch_sync(dispatch_get_main_queue(), ^{
                dispatch_queue_t curQueue = dispatch_get_current_queue();
                printf("curQueue:%s\n", dispatch_queue_get_label(curQueue));
            });
        });
    );
    
    
    
    

}
- (void)deadLockFunc
{
    printf("\n================\n");
    dispatch_queue_t queueA = dispatch_queue_create("com.yiyaaixuexi.queueA", NULL);
    dispatch_queue_t queueB = dispatch_queue_create("com.yiyaaixuexi.queueB", NULL);
    
    printf("queue1:%s\n", dispatch_queue_get_label(dispatch_get_current_queue()));
    
    dispatch_sync(queueA, ^{
        
        printf("queue2:%s\n", dispatch_queue_get_label(dispatch_get_current_queue()));
        dispatch_sync(queueB, ^{
            printf("queue3:%s\n", dispatch_queue_get_label(dispatch_get_current_queue()));

            dispatch_block_t block = ^{
                printf("queue4:%s\n", dispatch_queue_get_label(dispatch_get_current_queue()));

                //do something
            };
            func(queueA, block);
            
        });
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
