//
//  RVGCD2ViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/7.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RVGCD2ViewController.h"

@interface RVGCD2ViewController ()

@end

// 代码示例主要来源以下:

// 原始文章
// https://www.cnblogs.com/allencelee/p/6023213.html
// http://www.knowsky.com/884482.html

// 新文章
// https://www.jianshu.com/p/e27d9f48bfb8

@implementation RVGCD2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self printDeviceInfo];
    
//    [self asyncConcurrent];
    
    [self asyncSerial];
    
//    [self syncConcurrent];
    
//    [self syncSerial];
    
//    [self asyncMain];
    
//    [self syncMain];
    
//    [self syncSerialInSerial];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)printDeviceInfo {
    NSString *systemName = [UIDevice currentDevice].systemName;
    NSString *systemVersion = [UIDevice currentDevice].systemVersion;
    NSString *model = [UIDevice currentDevice].model;
    NSString *localizedModel = [[UIDevice currentDevice] localizedModel];
    
    printf("\n================\n");
    printf("%-20s:%20s\n", "systemName", [systemName UTF8String]);
    printf("%-20s:%20s\n", "systemVersion", [systemVersion UTF8String]);
    printf("%-20s:%20s\n", "model", [model UTF8String]);
    printf("%-20s:%20s\n", "localizedModel", [localizedModel UTF8String]);
}

// 异步执行 + 并行队列
- (void)asyncConcurrent {
    printf("\n================%s================\n", [NSStringFromSelector(_cmd) UTF8String]);
    printf("main: %s\n", [[[NSThread mainThread] description] UTF8String]);
    //创建一个并行队列
    dispatch_queue_t queue = dispatch_queue_create("标识符", DISPATCH_QUEUE_CONCURRENT);
    printf("---start---\n");
    //使用异步函数封装三个任务
    dispatch_async(queue, ^{
        printf("任务1---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    dispatch_async(queue, ^{
        printf("任务2---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    dispatch_async(queue, ^{
        printf("任务3---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    // 这一段代码可以证明end输出的顺序不确定,主要是看哪个先执行完毕
//    sleep(1);
    printf("---end---\n");
}

// 异步执行 + 串行队列
- (void)asyncSerial {
    printf("\n================%s================\n", [NSStringFromSelector(_cmd) UTF8String]);
    printf("main: %s\n", [[[NSThread mainThread] description] UTF8String]);
    //创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("标识符", DISPATCH_QUEUE_SERIAL);
    printf("---start---\n");
    //使用异步函数封装三个任务
    dispatch_async(queue, ^{
        printf("任务1---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    dispatch_async(queue, ^{
        printf("任务2---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    dispatch_async(queue, ^{
        printf("任务3---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    printf("---end---\n");
}

// 同步执行 + 并行队列
- (void)syncConcurrent {
    printf("\n================%s================\n", [NSStringFromSelector(_cmd) UTF8String]);
    printf("main: %s\n", [[[NSThread mainThread] description] UTF8String]);
    //创建一个并行队列
    dispatch_queue_t queue = dispatch_queue_create("标识符", DISPATCH_QUEUE_CONCURRENT);
    
    printf("---start---\n");
    //使用同步函数封装三个任务
    dispatch_sync(queue, ^{
        printf("任务1---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    dispatch_sync(queue, ^{
        printf("任务2---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    dispatch_sync(queue, ^{
        printf("任务3---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    printf("---end---\n");
}

// 同步执行 + 串行队列
- (void)syncSerial {
    printf("\n================%s================\n", [NSStringFromSelector(_cmd) UTF8String]);
    printf("main: %s\n", [[[NSThread mainThread] description] UTF8String]);
    //创建一个串行队列
    dispatch_queue_t queue = dispatch_queue_create("标识符", DISPATCH_QUEUE_SERIAL);
    
    printf("---start---\n");
    //使用异步函数封装三个任务
    dispatch_sync(queue, ^{
        printf("任务1---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    dispatch_sync(queue, ^{
        printf("任务2---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    dispatch_sync(queue, ^{
        printf("任务3---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    printf("---end---\n");
}

// 异步执行 + 主队列
- (void)asyncMain {
    printf("\n================%s================\n", [NSStringFromSelector(_cmd) UTF8String]);
    printf("main: %s\n", [[[NSThread mainThread] description] UTF8String]);
    // 获取主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    printf("---start---\n");
    //使用异步函数封装三个任务
    dispatch_async(queue, ^{
        printf("任务1---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    dispatch_async(queue, ^{
        printf("任务2---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    dispatch_async(queue, ^{
        printf("任务3---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    printf("---end---\n");
    
//    dispatch_main();
    
  
//    UIApplicationMain();
}
// 同步执行 + 主队列
- (void)syncMain {
    printf("\n================%s================\n", [NSStringFromSelector(_cmd) UTF8String]);
    printf("main: %s\n", [[[NSThread mainThread] description] UTF8String]);
    //获取主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    
    printf("---start---\n");
    //使用同步函数封装三个任务
    dispatch_sync(queue, ^{
        printf("任务1---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    dispatch_sync(queue, ^{
        printf("任务2---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    dispatch_sync(queue, ^{
        printf("任务3---%s\n", [[[NSThread currentThread] description] UTF8String]);
    });
    printf("---end---\n");
}

// 同步执行 + 一个串行队列, 类似于同步执行 + 主队列
- (void)syncSerialInSerial {
    printf("\n================%s================\n", [NSStringFromSelector(_cmd) UTF8String]);
    printf("main: %s\n", [[[NSThread mainThread] description] UTF8String]);
    dispatch_queue_t queue = dispatch_queue_create("test", DISPATCH_QUEUE_SERIAL);
    printf("---main start---\n");
    // 这里使用 dispatch_sync 也会导致死锁
    dispatch_async(queue, ^{
        printf("---queue start---\n");
        printf("queue start(用dispatch_sync是主线程,用dispatch_async会开启一个线程)---%s\n", [[[NSThread currentThread] description] UTF8String]);
        //使用同步函数封装三个任务
        dispatch_sync(queue, ^{
            printf("任务1---%s\n", [[[NSThread currentThread] description] UTF8String]);
        });
        dispatch_sync(queue, ^{
            printf("任务2---%s\n", [[[NSThread currentThread] description] UTF8String]);
        });
        dispatch_sync(queue, ^{
            printf("任务3---%s\n", [[[NSThread currentThread] description] UTF8String]);
        });
        printf("---queue end---\n");
    });
    printf("---当最外面是dispatch_async输出,如果是dispatch_sync不输出---\n");
    printf("---main end---\n");
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
