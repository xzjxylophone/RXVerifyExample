//
//  RVGCDViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/3/23.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVGCDViewController.h"
#import <objc/message.h>

#define k_CS_RV_RowCount        5
#define k_CS_RV_ColumnCount     3
#define k_CS_RV_Row_Height      100
#define k_CS_RV_Row_Width       k_CS_RV_Row_Height
#define k_CS_RV_Cell_Spacing    10



//DISPATCH_DECL(dispatch_kkkk);
//OS_OBJECT_DECL_SUBCLASS(dispatch_jjj, dispatch_object);
//OS_OBJECT_DECL_IMPL(dispatch_lll, <OS_OBJECT_CLASS(dispatch_object)>);



@interface RVGCDViewController ()

@property (nonatomic, strong) NSMutableArray *imageViews;
@property (nonatomic, strong) NSMutableArray *imageNames;



@property (nonatomic, copy) NSInteger (^block1)(NSInteger, NSInteger);
@property (nonatomic, copy) void (^block2)(void);
@property (nonatomic, copy) NSInteger (^block3)(void);
@property (nonatomic, copy) void (^block4)(NSInteger, NSInteger, NSInteger);


@property (nonatomic, strong) dispatch_queue_t serialQueue;



@end




@implementation RVGCDViewController

- (void)loadBlockCopy
{
    NSInteger (^block1)(NSInteger, NSInteger) = ^(NSInteger i, NSInteger j) {
        return i+j;
    };
    
    self.block1 = block1;
    
    
    void (^block2)(void) = ^(void) {
        
    };
    self.block2 = block2;
    
    NSInteger (^block3)(void) = ^(void) {
        return (NSInteger)5;
    };
    
    self.block3 = block3;
    
    void (^block4)(NSInteger, NSInteger, NSInteger) = ^(NSInteger i, NSInteger j, NSInteger k) {
        NSInteger l = i + j + k;
        NSLog(@"l:%zd", l);
    };
    self.block4 = block4;
}

- (void)setBlockkkkkkk1:(NSInteger (^)(NSInteger, NSInteger))test
{
    self.block1 = test;
}

- (void)setBlockkkkkkk2:(void (^)(void))test
{
    self.block2 = test;
}

- (void)setBlockkkkkkk3:(NSInteger (^)(void))test
{
    self.block3 = test;
}
- (void)setBlockkkkkkk4:(void(^)(NSInteger, NSInteger, NSInteger))test
{
    self.block4 = test;
}

#pragma mark - Private
-(NSData *)requestData:(NSInteger)index
{
    NSURL *url = [NSURL URLWithString:self.imageNames[index]];
    NSData *data = [NSData dataWithContentsOfURL:url];
    
    return data;
}
- (void)loadImage:(NSNumber *)index
{
    NSInteger i = [index integerValue];
    NSLog(@"i:%zd, thread is :%@ begin", i, [NSThread currentThread]);
    NSData *data = [self requestData:i];
    NSLog(@"i:%zd, thread is :%@ end", i, [NSThread currentThread]);
    __weak __typeof(self) weakSelf = self;
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_sync(mainQueue, ^{
        UIImage *image = [UIImage imageWithData:data];
        UIImageView *imageView = weakSelf.imageViews[i];
        imageView.image = image;
    });
}
#pragma mark - Action

- (IBAction)loadButtonTouchUpInside:(id)sender
{
    NSInteger count = k_CS_RV_ColumnCount * k_CS_RV_RowCount;
    dispatch_queue_t customQueue;
    
    // 串行队列
    customQueue = dispatch_queue_create("myThread", DISPATCH_QUEUE_SERIAL);
    // 并行队列
    customQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    __weak __typeof(self) weakSelf = self;
    for (NSInteger i = 0; i < count; i++) {
        dispatch_async(customQueue, ^{
            [weakSelf loadImage:@(i)];
        });
        
    }
}




#pragma mark - queue & sync/async
// http://www.cnblogs.com/mddblog/p/4767559.html

/*
 
 　　1）串行队列，同步执行-----串行队列意味着顺序执行，同步执行意味着不开启线程（在当前线程执行）
 
 　　2）串行队列,异步执行-----串行队列意味着任务顺序执行，异步执行说明要开线程, （如果开多个线程的话，不能保证串行队列顺序执行，所以只开一个线程）
 
 　　3）并行队列,异步执行-----并行队列意味着执行顺序不确定，异步执行意味着会开启线程，而并行队列又允许不按顺序执行，所以系统为了提高性能会开启多个线程，来队列取任务（队列中任务取出仍然是顺序取出的，只是线程执行无序）。
 
 　　4）并行队列,同步执行-----同步执行意味着不开线程,则肯定是顺序执行
 
 */



// 串行同步
- (void)test_queue_serial_sync
{
    NSLog(@"串行同步");
    dispatch_queue_t queue = dispatch_queue_create("com.demo.001", DISPATCH_QUEUE_SERIAL);
    NSLog(@"main thread:%p", [NSThread mainThread]);
    dispatch_sync(queue, ^{
        NSLog(@"1 thread: %p", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"2 thread: %p", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"3 thread: %p", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"4 thread: %p", [NSThread currentThread]);
    });
    /* 结果
     2017-02-10 18:00:21.991383 RXVerifyExample[4927:2465789] 串行同步
     2017-02-10 18:00:21.991636 RXVerifyExample[4927:2465789] main thread:0x17406cb00
     2017-02-10 18:00:21.992020 RXVerifyExample[4927:2465789] 1 thread: 0x17406cb00
     2017-02-10 18:00:21.992097 RXVerifyExample[4927:2465789] 2 thread: 0x17406cb00
     2017-02-10 18:00:21.992165 RXVerifyExample[4927:2465789] 3 thread: 0x17406cb00
     2017-02-10 18:00:21.992230 RXVerifyExample[4927:2465789] 4 thread: 0x17406cb00
     */
}

// 并行同步
- (void)test_queue_concurrent_sync
{
    NSLog(@"并行同步");
    dispatch_queue_t queue = dispatch_queue_create("com.demo.002", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"main thread:%p", [NSThread mainThread]);
    dispatch_sync(queue, ^{
        NSLog(@"1 thread: %p", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"2 thread: %p", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"3 thread: %p", [NSThread currentThread]);
    });
    dispatch_sync(queue, ^{
        NSLog(@"4 thread: %p", [NSThread currentThread]);
    });
    /* 结果
     2017-02-10 18:04:33.107907 RXVerifyExample[4930:2467403] 并行同步
     2017-02-10 18:04:33.108053 RXVerifyExample[4930:2467403] main thread:0x174066600
     2017-02-10 18:04:33.108121 RXVerifyExample[4930:2467403] 1 thread: 0x174066600
     2017-02-10 18:04:33.108177 RXVerifyExample[4930:2467403] 2 thread: 0x174066600
     2017-02-10 18:04:33.108219 RXVerifyExample[4930:2467403] 3 thread: 0x174066600
     2017-02-10 18:04:33.108259 RXVerifyExample[4930:2467403] 4 thread: 0x174066600
     */
}


// 串行异步1
- (void)test_queue_serial_async1
{
    NSLog(@"串行异步方法1");
    dispatch_queue_t queue = dispatch_queue_create("com.demo.0031", DISPATCH_QUEUE_SERIAL);
    NSLog(@"main thread:%p", [NSThread mainThread]);
    dispatch_async(queue, ^{
        NSLog(@"1 thread: %p", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"2 thread: %p", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"3 thread: %p", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"4 thread: %p", [NSThread currentThread]);
    });
    /* 结果
     2017-02-10 18:06:15.124048 RXVerifyExample[4932:2468052] 串行异步方法1
     2017-02-10 18:06:15.124244 RXVerifyExample[4932:2468052] main thread:0x174076a40
     2017-02-10 18:06:15.125490 RXVerifyExample[4932:2468084] 1 thread: 0x174271800
     2017-02-10 18:06:15.125574 RXVerifyExample[4932:2468084] 2 thread: 0x174271800
     2017-02-10 18:06:15.125643 RXVerifyExample[4932:2468084] 3 thread: 0x174271800
     2017-02-10 18:06:15.125710 RXVerifyExample[4932:2468084] 4 thread: 0x174271800
     */
}
// 串行异步2
- (void)test_queue_serial_async2
{
    NSLog(@"串行异步方法2");
    dispatch_queue_t queue = dispatch_queue_create("com.demo.0032", DISPATCH_QUEUE_SERIAL);
    NSLog(@"main thread:%p", [NSThread mainThread]);
    dispatch_async(queue, ^{
        NSLog(@"1 thread: %p", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"2 thread: %p", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:4.1];
        NSLog(@"3 thread: %p", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:3.1];
        NSLog(@"4 thread: %p", [NSThread currentThread]);
    });
    /* 结果
     2017-02-10 18:08:16.478508 RXVerifyExample[4935:2468827] 串行异步方法2
     2017-02-10 18:08:16.478611 RXVerifyExample[4935:2468827] main thread:0x170072380
     2017-02-10 18:08:16.479034 RXVerifyExample[4935:2468869] 1 thread: 0x174264240
     2017-02-10 18:08:16.479069 RXVerifyExample[4935:2468869] 2 thread: 0x174264240
     2017-02-10 18:08:20.584321 RXVerifyExample[4935:2468869] 3 thread: 0x174264240
     2017-02-10 18:08:23.689611 RXVerifyExample[4935:2468869] 4 thread: 0x174264240
     */
}

// 并行异步1
- (void)test_queue_concurrent_async1
{
    NSLog(@"并行异步方法1");
    dispatch_queue_t queue = dispatch_queue_create("com.demo.0041", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"main thread:%p", [NSThread mainThread]);
    dispatch_async(queue, ^{
        NSLog(@"1 thread: %p", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"2 thread: %p", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"3 thread: %p", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"4 thread: %p", [NSThread currentThread]);
    });
    /* 结果
     2017-02-10 18:09:25.692681 RXVerifyExample[4937:2469287] 并行异步方法1
     2017-02-10 18:09:25.692880 RXVerifyExample[4937:2469287] main thread:0x174073000
     2017-02-10 18:09:25.693828 RXVerifyExample[4937:2469323] 1 thread: 0x174267d00
     2017-02-10 18:09:25.693916 RXVerifyExample[4937:2469323] 2 thread: 0x174267d00
     2017-02-10 18:09:25.693988 RXVerifyExample[4937:2469323] 3 thread: 0x174267d00
     2017-02-10 18:09:25.694056 RXVerifyExample[4937:2469323] 4 thread: 0x174267d00
     */
}
// 并行异步2
- (void)test_queue_concurrent_async2
{
    NSLog(@"并行异步方法2");
    dispatch_queue_t queue = dispatch_queue_create("com.demo.0042", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"main thread:%p", [NSThread mainThread]);
    dispatch_async(queue, ^{
        NSLog(@"1 thread: %p", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        NSLog(@"2 thread: %p", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:4.1];
        NSLog(@"3 thread: %p", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:3.1];
        NSLog(@"4 thread: %p", [NSThread currentThread]);
    });
    /* 结果
     2017-02-10 18:10:27.262009 RXVerifyExample[4940:2469782] 并行异步方法2
     2017-02-10 18:10:27.262213 RXVerifyExample[4940:2469782] main thread:0x17406e080
     2017-02-10 18:10:27.263710 RXVerifyExample[4940:2469821] 1 thread: 0x174262e80
     2017-02-10 18:10:27.263811 RXVerifyExample[4940:2469821] 2 thread: 0x174262e80
     2017-02-10 18:10:30.369209 RXVerifyExample[4940:2469813] 4 thread: 0x1742648c0
     2017-02-10 18:10:31.369205 RXVerifyExample[4940:2469821] 3 thread: 0x174262e80
     */
}

// 并行异步3
- (void)test_queue_concurrent_async3
{
    NSLog(@"并行异步方法3");
    dispatch_queue_t queue = dispatch_queue_create("com.demo.0043", DISPATCH_QUEUE_CONCURRENT);
    NSLog(@"main thread:%p", [NSThread mainThread]);
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:2.1];
        NSLog(@"1 thread: %p", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:1.1];
        NSLog(@"2 thread: %p", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:4.1];
        NSLog(@"3 thread: %p", [NSThread currentThread]);
    });
    dispatch_async(queue, ^{
        [NSThread sleepForTimeInterval:3.1];
        NSLog(@"4 thread: %p", [NSThread currentThread]);
    });
    /* 结果
     2017-02-10 18:10:59.926988 RXVerifyExample[4942:2470140] 并行异步方法3
     2017-02-10 18:10:59.927184 RXVerifyExample[4942:2470140] main thread:0x17007f8c0
     2017-02-10 18:11:01.033209 RXVerifyExample[4942:2470183] 2 thread: 0x170462ac0
     2017-02-10 18:11:02.033478 RXVerifyExample[4942:2470185] 1 thread: 0x170462f40
     2017-02-10 18:11:03.037799 RXVerifyExample[4942:2470176] 4 thread: 0x170462a40
     2017-02-10 18:11:04.033691 RXVerifyExample[4942:2470177] 3 thread: 0x170462480
     */
}


- (void)test_queue_serial_concurrent_sync_async
{
//    [self test_queue_serial_sync];
    
    
//    [self test_queue_concurrent_sync];
    
    
//    [self test_queue_serial_async1];
    
    
//    [self test_queue_serial_async2];
    
    
//    [self test_queue_concurrent_async1];
    
    
//    [self test_queue_concurrent_async2];
    
    
    [self test_queue_concurrent_async3];
    
}



#pragma mark - gcd Test Action


// http://www.knowsky.com/884482.html

/*
 dispatch_sync表示是一个同步线程；
 dispatch_get_main_queue表示运行在主线程中的主队列；
 任务2是同步线程的任务。
 首先执行任务1，这是肯定没问题的，只是接下来，程序遇到了同步线程，那么它会进入等待，等待任务2执行完，然后执行任务3。但这是队列，有任务来，当然会将任务加到队尾，然后遵循FIFO原则执行任务。那么，现在任务2就会被加到最后，任务3排在了任务2前面，问题来了：
 
 任务3要等任务2执行完才能执行，任务2由排在任务3后面，意味着任务2要在任务3执行完才能执行，所以他们进入了互相等待的局面。【既然这样，那干脆就卡在这里吧】这就是死锁。
 */
- (void)test1
{
    NSLog(@"1"); // 任务1
    dispatch_sync(dispatch_get_main_queue(), ^{
        NSLog(@"2"); // 任务2
    });
    NSLog(@"3"); // 任务3
}

/*
 首先执行任务1，接下来会遇到一个同步线程，程序会进入等待。等待任务2执行完成以后，才能继续执行任务3。从dispatch_get_global_queue可以看出，任务2被加入到了全局的并行队列中，当并行队列执行完任务2以后，返回到主队列，继续执行任务3。
 

 */
- (void)test2
{
    NSLog(@"1"); // 任务1
    long priority = DISPATCH_QUEUE_PRIORITY_HIGH;
    priority = DISPATCH_QUEUE_PRIORITY_DEFAULT;
    priority = DISPATCH_QUEUE_PRIORITY_LOW;
    // 这个优先级是在global_queue的优先级
    dispatch_sync(dispatch_get_global_queue(priority, 0), ^{
        NSLog(@"2"); // 任务2
    });
    NSLog(@"3"); // 任务3
}

/*
 
 //5和2的顺序不一定
 
 分析：
 
 这个案例没有使用系统提供的串行或并行队列，而是自己通过dispatch_queue_create函数创建了一个DISPATCH_QUEUE_SERIAL的串行队列。
 
 执行任务1；
 遇到异步线程，将【任务2、同步线程、任务4】加入串行队列中。因为是异步线程，所以在主线程中的任务5不必等待异步线程中的所有任务完成；
 因为任务5不必等待，所以2和5的输出顺序不能确定；
 任务2执行完以后，遇到同步线程，这时，将任务3加入串行队列；
 又因为任务4比任务3早加入串行队列，所以，任务3要等待任务4完成以后，才能执行。但是任务3所在的同步线程会阻塞，所以任务4必须等任务3执行完以后再执行。这就又陷入了无限的等待中，造成死锁。
 
 */
- (void)test3
{
    dispatch_queue_t queue = dispatch_queue_create("com.demo.serialQueue", DISPATCH_QUEUE_SERIAL);
    NSLog(@"1");// 任务1
    dispatch_async(queue, ^{
        NSLog(@"2"); // 任务2
        dispatch_sync(queue, ^{
            NSLog(@"3"); // 任务3
        });
        NSLog(@"4"); // 任务4
    });
    NSLog(@"5"); // 任务5
    
}

/*
 
 //5和2的顺序不一定
 
 分析：
 
 首先，将【任务1、异步线程、任务5】加入Main Queue中，异步线程中的任务是：【任务2、同步线程、任务4】。
 
 所以，先执行任务1，然后将异步线程中的任务加入到Global Queue中，因为异步线程，所以任务5不用等待，结果就是2和5的输出顺序不一定。
 
 然后再看异步线程中的任务执行顺序。任务2执行完以后，遇到同步线程。将同步线程中的任务加入到Main Queue中，这时加入的任务3在任务5的后面。
 
 当任务3执行完以后，没有了阻塞，程序继续执行任务4。
 
 从以上的分析来看，得到的几个结果：1最先执行；2和5顺序不一定；4一定在3后面。
 */

- (void)test4
{
    NSLog(@"1");// 任务1
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        NSLog(@"2"); // 任务2
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"3"); // 任务3
        });
        NSLog(@"4"); // 任务4
    });
    NSLog(@"5"); // 任务5
    
    
}


/*
 //1和4的顺序不一定
 
 分析：
 
 和上面几个案例的分析类似，先来看看都有哪些任务加入了Main Queue：【异步线程、任务4、死循环、任务5】。
 
 在加入到Global Queue异步线程中的任务有：【任务1、同步线程、任务3】。
 
 第一个就是异步线程，任务4不用等待，所以结果任务1和任务4顺序不一定。
 
 任务4完成后，程序进入死循环，Main Queue阻塞。但是加入到Global Queue的异步线程不受影响，继续执行任务1后面的同步线程。
 
 同步线程中，将任务2加入到了主线程，并且，任务3等待任务2完成以后才能执行。这时的主线程，已经被死循环阻塞了。所以任务2无法执行，当然任务3也无法执行，在死循环后的任务5也不会执行。
 
 最终，只能得到1和4顺序不定的结果。
 */
- (void)test5
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"1"); // 任务1
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"2"); // 任务2
        });
        NSLog(@"3"); // 任务3
    });
    NSLog(@"4"); // 任务4
//    while (1) {
//    }
    NSLog(@"5"); // 任务5
}

- (void)test5_1
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSLog(@"1"); // 任务1
        dispatch_sync(dispatch_get_main_queue(), ^{
            NSLog(@"2"); // 任务2
        });
        NSLog(@"3"); // 任务3
    });
    NSLog(@"4"); // 任务4

    NSLog(@"5"); // 任务5
}

#pragma mark - gcd test_second
- (void)test_2_1
{
    NSLog(@"1");
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        sleep(1);
        // 耗时的操作
        NSLog(@"2");
        dispatch_async(dispatch_get_main_queue(), ^{
            // 更新界面
            sleep(1);
            NSLog(@"3");
        });
        NSLog(@"4");
    });
    NSLog(@"5");
}

- (void)testImagesssss
{
    // imageNames
    self.imageNames = [NSMutableArray array];
    for (NSInteger i = 0; i < k_CS_RV_RowCount * k_CS_RV_ColumnCount; i++) {
        [self.imageNames addObject:[NSString stringWithFormat:@"http://images.cnblogs.com/cnblogs_com/kenshincui/613474/o_%zd.jpg",i]];
    }
    
    self.imageViews = [NSMutableArray array];
    for (NSInteger r = 0; r < k_CS_RV_RowCount; r++) {
        for (NSInteger c = 0; c < k_CS_RV_ColumnCount; c++) {
            CGFloat x = c * (k_CS_RV_Row_Width + k_CS_RV_Cell_Spacing);
            CGFloat y = r * (k_CS_RV_Row_Height + k_CS_RV_Cell_Spacing);
            UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(x, y, k_CS_RV_Row_Width, k_CS_RV_Row_Height)];
            imageView.contentMode = UIViewContentModeScaleAspectFit;
            [self.view addSubview:imageView];
            [self.imageViews addObject:imageView];
        }
    }
}

#pragma mark - async/sync
- (void)test_async_sync_001
{
    NSLog(@"1");
    dispatch_async(dispatch_get_main_queue(), ^(void) {
        NSLog(@"2");
    });
    
    sleep(1); // 无论是多长时间, 因为任务2是放在main_queue中,所以,2 肯定是在3后面
    NSLog(@"3");
    
}

- (void)test_async_sync_002
{
    NSLog(@"1");
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        NSLog(@"2");
    });
    
    sleep(1);
    NSLog(@"3");

}
- (void)test_async_sync_003
{
    NSLog(@"1");
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
        sleep(1);
        NSLog(@"2");
    });
    NSLog(@"3");
}

- (void)test_async_sync_004
{
    
    dispatch_queue_t serialQueue = dispatch_queue_create("com.rx.001", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t concurentQueue = dispatch_queue_create("com.rx.002", DISPATCH_QUEUE_CONCURRENT);
    
    NSLog(@"1");
    
    dispatch_sync(serialQueue, ^(void) {
        NSLog(@"2");
        dispatch_async(dispatch_get_main_queue(), ^(void) {
            NSLog(@"3");
        });
//        dispatch_sync(dispatch_get_main_queue(), ^(void) {
//            NSLog(@"3");
//        });

        NSLog(@"4");
    });
    NSLog(@"5");
    dispatch_async(concurentQueue, ^(void) {
        NSLog(@"6");
        dispatch_sync(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^(void) {
            [NSThread sleepForTimeInterval:0.1];
            NSLog(@"7");
        });
        [NSThread sleepForTimeInterval:0.1];
        NSLog(@"8");
    });
    [NSThread sleepForTimeInterval:0.1];
    NSLog(@"9");
    
    
    
    // 1, 2, 4, 5, 9, 6,7,8,3
    
    
    
}

- (void)test_get_label
{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_queue_t globalConcurrentQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_queue_t serialQueue = dispatch_queue_create("com.rx.001", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t concurrentQueue = dispatch_queue_create("com.rx.001", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t concurrent2Queue = dispatch_queue_create("com.rx.001", DISPATCH_QUEUE_CONCURRENT);
    
    const char *c1 = dispatch_queue_get_label(mainQueue);
    const char *c2 = dispatch_queue_get_label(globalConcurrentQueue);
    const char *c3 = dispatch_queue_get_label(serialQueue);
    const char *c4 = dispatch_queue_get_label(concurrentQueue);
    const char *c5 = dispatch_queue_get_label(concurrent2Queue);
    
    NSLog(@"mainQueue:%@", mainQueue);
    NSLog(@"globalConcurrentQueue:%@", globalConcurrentQueue);
    NSLog(@"serialQueue:%@", serialQueue);
    NSLog(@"concurrentQueue:%@", concurrentQueue);
    NSLog(@"concurrent2Queue:%@", concurrent2Queue);
    NSLog(@"c1:%s, c2:%s, c3:%s, c4:%s, c5:%s", c1, c2, c3, c4, c5);
    
    
    int it1 = 10;
    dispatch_qos_class_t class_t1 = dispatch_queue_get_qos_class(mainQueue, &it1);
    int it2 = 10;
    dispatch_qos_class_t class_t2 = dispatch_queue_get_qos_class(globalConcurrentQueue, &it2);
    int it3 = 10;
    dispatch_qos_class_t class_t3 = dispatch_queue_get_qos_class(serialQueue, &it3);
    int it4 = 10;
    dispatch_qos_class_t class_t4 = dispatch_queue_get_qos_class(concurrentQueue, &it4);
    int it5 = 10;
    dispatch_qos_class_t class_t5 = dispatch_queue_get_qos_class(concurrent2Queue, &it5);
    
    
    NSLog(@"it: %zd, %zd, %zd, %zd, %zd", (long)it1, (long)it2, (long)it3, (long)it4, (long)it5);
    NSLog(@"class_t: %zd, %zd, %zd, %zd, %zd", (long)class_t1, (long)class_t2, (long)class_t3, (long)class_t4, (long)class_t5);
    
    
    
}

/*
 * @param ti
 *
 *
 * @param log
 * log string
 */
- (void)costForTimerInterval:(NSTimeInterval)ti log:(NSString *)log
{
    [NSThread sleepForTimeInterval:ti];
    NSLog(@"%@", log);
}

- (void)test_group_001
{
    __weak __typeof(self) weakSelf = self;
    // code1 queue是并发队列
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_queue_create("com.rx.001", DISPATCH_QUEUE_CONCURRENT);
    
    // code2
    dispatch_group_async(group, queue, ^(void){
        [weakSelf costForTimerInterval:0.1 log:@"2"];
    });
    // code3
    dispatch_group_async(group, queue, ^(void){
        [weakSelf costForTimerInterval:0.1 log:@"3"];
    });
    // code4
    dispatch_group_async(group, queue, ^(void){
        [weakSelf costForTimerInterval:0.1 log:@"4"];
    });
    // code5
    dispatch_group_async(group, queue, ^{
        [weakSelf costForTimerInterval:6 log:@"5"];
    });
    // code6
    dispatch_group_notify(group, queue, ^{
        [weakSelf costForTimerInterval:0.1 log:@"done"];
    });
    // code7 从当前时间延后5秒
    dispatch_time_t time = dispatch_time(DISPATCH_TIME_NOW, 5ull * NSEC_PER_SEC);
    // code8, group的时间最少是6秒
    long result = dispatch_group_wait(group, time);
    if (result == 0) {
        [weakSelf costForTimerInterval:0.1 log:@"finish"];
    } else {
        [weakSelf costForTimerInterval:0.1 log:@"not finish"];
    }

    // code9
    [weakSelf costForTimerInterval:0.1 log:@"main task"];
    
}

- (void)test_group_002
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue1 = dispatch_queue_create("com.rx.001", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue2 = dispatch_queue_create("com.rx.002", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue3 = dispatch_queue_create("com.rx.003", DISPATCH_QUEUE_CONCURRENT);
    
    dispatch_group_async(group, queue1, ^{
        sleep(1);
        NSLog(@"1");
    });
    
    
    dispatch_group_async(group, queue2, ^{
        sleep(2);
        NSLog(@"2");
    });
    
    
    dispatch_group_async(group, queue1, ^{
        NSLog(@"3");
    });
    
    
    dispatch_group_async(group, queue1, ^{
        sleep(3);
        NSLog(@"3.1");
    });
    
    dispatch_group_async(group, queue2, ^{
        NSLog(@"4");
    });
    
    dispatch_group_notify(group, queue2, ^{
        NSLog(@"6");
    });
    dispatch_group_notify(group, queue1, ^{
        NSLog(@"5");
    });
    dispatch_group_notify(group, queue3, ^{
        NSLog(@"8");
    });
    
    NSLog(@"7");
    
}

- (void)test_group_003
{
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
//    dispatch_group_async(group, queue, ^{
//        NSLog(@"0");
//    });
//    dispatch_group_async(group, queue, ^{
//        sleep(1);
//        NSLog(@"1");
//    });
//    
//    dispatch_group_async(group, queue, ^{
//        sleep(2);
//        NSLog(@"2");
//    });
//    
//    
//    dispatch_group_async(group, queue, ^{
//        sleep(3);
//        NSLog(@"3");
//    });
    
//    dispatch_async(queue, ^{
    
        for (NSInteger i = 0; i < 5; i++) {
            dispatch_group_enter(group);
            
            
            dispatch_async(queue, ^{
                
                sleep((int)i);
                NSLog(@"%zd", i);
                dispatch_group_leave(group);
            });
            
            
        }
        
        
//    });
    
    long result = dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
    if (result == 0) {
        NSLog(@"finish");
    } else {
        NSLog(@"not finishi");
    }
    NSLog(@"5");
    dispatch_async(dispatch_get_main_queue(), ^{
        NSLog(@"main done");
    });
    
}

- (void)test_group_004
{
    dispatch_queue_t queue1 = dispatch_queue_create("com.rx.001", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue1, ^{
        
        dispatch_group_t group = dispatch_group_create();
        dispatch_queue_t queue2 = dispatch_queue_create("com.rx.002", DISPATCH_QUEUE_CONCURRENT);
        
        for (NSInteger i = 0; i < 5; i++) {
            dispatch_group_enter(group);
            dispatch_async(queue2, ^{
                sleep((int)i);
                NSLog(@"i:%zd", i);
                dispatch_group_leave(group);
            });
            
        }
        
        
        dispatch_group_wait(group, DISPATCH_TIME_FOREVER);
        NSLog(@"7");
        dispatch_group_notify(group, queue2, ^{
            NSLog(@"8");
        });
        sleep(1);
        NSLog(@"9");
        dispatch_async(dispatch_get_main_queue(), ^{
            NSLog(@"update UI");
        });
        
        
    });
    
    NSLog(@"main done");
}


#pragma mark - Current Queue
- (void)testGetCurrentQueue
{
//    dispatch_queue_t queue0 = dispatch_queue_create("1", DISPATCH_QUEUE_SERIAL);
    NSMutableArray *ary = [NSMutableArray new];
    for (int i = 0; i < 10; i++) {
        [ary addObject:dispatch_queue_create("1", DISPATCH_QUEUE_SERIAL)];
    }
    
    dispatch_queue_t globalQueue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    for (int i = 0; i < 10; i++) {
        dispatch_queue_t queue = ary[i];
        
        // 这个只是假装有10个线程去处理，不能修改这里
        dispatch_async(globalQueue, ^{
            dispatch_sync(queue, ^{
                // do a lot of thing
            });
        });
    }
    
//    dispatch_queue_t queue0 = dispatch_get_current_queue();
    dispatch_queue_t queue1 = dispatch_get_main_queue();
    dispatch_queue_t queue2 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0);
    dispatch_queue_t queue3 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t queue4 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0);
    dispatch_queue_t queue5 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_queue_t queue5_1 = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0);
    dispatch_queue_t queue6 = dispatch_get_global_queue(6, 0);
    
    dispatch_queue_t queue7_1 = dispatch_queue_create("com.rx.001", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue7_2 = dispatch_queue_create("com.rx.001", DISPATCH_QUEUE_CONCURRENT);
    dispatch_queue_t queue7_3 = dispatch_queue_create("com.rx.003", DISPATCH_QUEUE_CONCURRENT);
    
    
    dispatch_queue_t queue8_1 = dispatch_queue_create("com.rx.001", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue8_2 = dispatch_queue_create("com.rx.001", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue8_3 = dispatch_queue_create("com.rx.003", DISPATCH_QUEUE_SERIAL);
    

    
    
//    NSLog(@"queue0:%s %p", dispatch_queue_get_label(queue0), queue0);
    NSLog(@"queue1:%s %p", dispatch_queue_get_label(queue1), queue1);
    NSLog(@"queue2:%s %p", dispatch_queue_get_label(queue2), queue2);
    NSLog(@"queue3:%s %p", dispatch_queue_get_label(queue3), queue3);
    NSLog(@"queue4:%s %p", dispatch_queue_get_label(queue4), queue4);
    NSLog(@"queue5:%s %p", dispatch_queue_get_label(queue5), queue5);
    NSLog(@"queue5_1:%s %p", dispatch_queue_get_label(queue5_1), queue5_1);
    NSLog(@"queue6:%s %p", dispatch_queue_get_label(queue6), queue6);
    
    
    NSLog(@"queue7_1:%s %p", dispatch_queue_get_label(queue7_1), queue7_1);
    NSLog(@"queue7_2:%s %p", dispatch_queue_get_label(queue7_2), queue7_2);
    NSLog(@"queue7_3:%s %p", dispatch_queue_get_label(queue7_3), queue7_3);
    
    NSLog(@"queue8_1:%s %p", dispatch_queue_get_label(queue8_1), queue8_1);
    NSLog(@"queue8_2:%s %p", dispatch_queue_get_label(queue8_2), queue8_2);
    NSLog(@"queue8_3:%s %p", dispatch_queue_get_label(queue8_3), queue8_3);
    
    NSLog(@"perform");
    
//    [NSThread detachNewThreadSelector:@selector(detachTest) toTarget:self withObject:nil];
    [self performSelectorInBackground:@selector(performBackground) withObject:nil];
//    [self performSelectorOnMainThread:@selector(performMain) withObject:nil waitUntilDone:YES];
    
}
- (void)detachTest
{
    [self onPlayWithString:@"detachTest"];
}
- (void)performBackground
{
    [self onPlayWithString:@"performBackground"];
}
- (void)performMain
{
    [self onPlayWithString:@"performMain"];
}
- (void)onPlayWithString:(NSString *)string
{
    dispatch_queue_t queue = dispatch_get_current_queue();
    NSLog(@"%@:%s %p", string, dispatch_queue_get_label(queue), queue);
    NSInteger i = 10;
    NSInteger j = 5;
    NSInteger k = i + j;
    NSLog(@"%zd", k);
}


#pragma mark - dispatch_block_t
- (void)test_dispatch_block_001
{
    dispatch_block_t blockT = ^(void) {
        NSInteger i = 0;
        NSInteger j = 1;
        NSLog(@"%zd %zd", i, j);
    };
    
    blockT();
}
#pragma mark - dispatch_set_target_queue
- (void)test_dispatch_set_target_queue_001
{
    dispatch_queue_t targetQueue = dispatch_queue_create("test.target.queue", DISPATCH_QUEUE_SERIAL);
    
    dispatch_queue_t queue1 = dispatch_queue_create("test.1", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("test.2", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue3 = dispatch_queue_create("test.3", DISPATCH_QUEUE_SERIAL);
    
    dispatch_set_target_queue(queue1, targetQueue);
    dispatch_set_target_queue(queue2, targetQueue);
    dispatch_set_target_queue(queue3, targetQueue);
    
    dispatch_async(queue1, ^{
        NSLog(@"1 in");
        [NSThread sleepForTimeInterval:3.f];
        NSLog(@"1 out");
    });
    
    dispatch_async(queue2, ^{
        NSLog(@"2 in");
        [NSThread sleepForTimeInterval:2.f];
        NSLog(@"2 out");
    });
    dispatch_async(queue3, ^{
        NSLog(@"3 in");
        [NSThread sleepForTimeInterval:1.f];
        NSLog(@"3 out");
    });
}

#pragma mark - dispatch_set/get_specific
- (void)test_dispatch_setget_specific_001
{
    
    // don't get error example
    dispatch_queue_t queue1 = dispatch_queue_create("rx.test.001", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue2 = dispatch_queue_create("rx.test.001", DISPATCH_QUEUE_SERIAL);
    dispatch_queue_t queue3 = dispatch_queue_create("rx.test.003", DISPATCH_QUEUE_SERIAL);
    
    
    NSLog(@"queue1:%s %p", dispatch_queue_get_label(queue1), queue1);
    NSLog(@"queue2:%s %p", dispatch_queue_get_label(queue2), queue2);
    NSLog(@"queue3:%s %p", dispatch_queue_get_label(queue3), queue3);
    
    
    int specificKey = 0;
    CFStringRef specificValueRef = CFSTR("rx.001");
//    dispatch_queue_set_specific(queue1, &specificKey, (void *)specificValueRef, (dispatch_function_t)CFRelease);
    dispatch_queue_set_specific(queue1, &specificKey, (void *)specificValueRef, NULL);
    CFStringRef getSpecificString = dispatch_queue_get_specific(queue1, &specificKey);
    NSLog(@"%@  %@", specificValueRef, getSpecificString);
    
    dispatch_sync(queue1, ^{
       
        dispatch_queue_t queue = dispatch_get_current_queue();
        NSLog(@"queue:%s %p", dispatch_queue_get_label(queue), queue);

        
        
        CFStringRef getSpecific2String = dispatch_get_specific(&specificKey);
        NSLog(@"%@  %@", specificValueRef, getSpecific2String);

        
    });
    
    dispatch_async(queue1, ^{
        
        // 这里是异步的不能使用这个函数:dispatch_get_current_queue
//        dispatch_queue_t queue = dispatch_get_current_queue();
//        NSLog(@"queue:%s %p", dispatch_queue_get_label(queue), queue);
        
        
        
        
        CFStringRef getSpecific2String = dispatch_get_specific(&specificKey);
        NSLog(@"%@  %@", specificValueRef, getSpecific2String);
        
        
    });
    
    
//    dispatch_sync(queue1, ^{
//        
//        CFStringRef getSpecific2String = dispatch_get_specific(&specificKey);
//        NSLog(@"%@  %@", specificValueRef, getSpecific2String);
//        
//        
//    });
    
    
}

- (void)test_dispatch_setget_specific_002
{
    dispatch_queue_t queueA = dispatch_queue_create("com.rx.001", NULL);
    dispatch_queue_t queueB = dispatch_queue_create("com.rx.002", NULL);
    dispatch_set_target_queue(queueB, queueA);
    
    static int specificKey;
    CFStringRef specificValue = CFSTR("queueA");
    dispatch_queue_set_specific(queueA,
                                &specificKey,
                                (void*)specificValue,
                                (dispatch_function_t)CFRelease);
    
    
    CFStringRef getSpecificString = dispatch_queue_get_specific(queueA, &specificKey);
    NSLog(@"%@  %@", specificValue, getSpecificString);
    
    dispatch_sync(queueB, ^{
        dispatch_block_t block = ^{
            //do something
            NSLog(@"11");
        };
        
        
        
        dispatch_queue_t queue = dispatch_get_current_queue();
        NSLog(@"queue:%s %p", dispatch_queue_get_label(queue), queue);
        
        CFStringRef retrievedValue = dispatch_get_specific(&specificKey);
        NSLog(@"retrievedValue:%@", retrievedValue);

        if (retrievedValue) {
            block();
        } else {
            dispatch_sync(queueA, block);
        }
    });
}

#pragma mark - dispatch_function_t
- (void)test_dispatch_function_001
{
//    dispatch_function_t function = (__bridge void *)^(void *test) {
//        NSInteger i = 0;
//        NSInteger j = 1;
//        NSLog(@"%zd %zd", i, j);
//        return test;
//    };
//    
//    CFStringRef str2Ref = CFSTR("queueA");
    
    // 这个有问题
//    CFStringRef ret = (CFStringRef)function((void *)str2Ref);
    
}

#pragma mark - queue
- (void)test_queue
{
    
    
    dispatch_queue_t queueA = dispatch_queue_create("com.yiyaaixuexi.queueA", NULL);
    dispatch_queue_t queueB = dispatch_queue_create("com.yiyaaixuexi.queueB", NULL);
    dispatch_sync(queueA, ^{
        dispatch_sync(queueB, ^{
            dispatch_block_t block = ^{
                
                NSLog(@"111");
            };

            
        
        });
    });

}


#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    
    
}
- (void)initializeAction
{
//    [self test1];
//    [self test2];
//    [self test3];
//    [self test4];
//    [self test5];
//    [self test5_1];
//    [self test_2_1];
    
//    [self test_async_sync_004];
//    [self test_get_label];
//    [self test_group_001];
    
    
//    [self testGetCurrentQueue];
//    [self test_dispatch_block_001];
    
//    [self test_dispatch_set_target_queue_001];
    
//    [self test_dispatch_setget_specific_001];
//    [self test_dispatch_setget_specific_002];
    
    
    
    // [self test_dispatch_function_001];
    
//     [self test_queue_serial_sync];
//    [self test_queue_serial_async];
    
//    [self test_queue_concurrent_sync];
//    [self test_queue_concurrent_async];
    
    
//    [self test_queue_serial_concurrent_sync_async];
    
    
//    [[RXLogManager sharedInstance] writeToLogTextView:@"111"];
    
    
//    [self testSD_GCD];
    
//    [self testMain11];
    
    
//    [self test2222];
    
//    [self test_async_serial_inlist];
//    [self test_okkk];
    
    [self test_dispath];
}

- (void)test_dispath {
    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        [self performSelector:@selector(main2Action) withObject:nil afterDelay:1];
//    });
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        [self performSelector:@selector(otherAction) withObject:nil afterDelay:3];
//    });
//    [self performSelector:@selector(mainAction) withObject:nil afterDelay:2];

//
}

- (void)main2Action {
    NSLog(@"main2");
}
- (void)mainAction {
    NSLog(@"main");
}
- (void)otherAction {
    NSLog(@"other");
}

- (void)test_okkk {
    NSDictionary *dict = @{
                           @"key1": @"value1",
                           @"key2": @"value2",
                           @"key3": @"value3",
                           @"key4": @"value4",
                           @"key5": @"value5",
                           @"key6": @"value6"
    };
    NSLog(@"aaaa:0");
    NSLog(@"aaaa:%@", dict.allKeys);
    [dict enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        NSLog(@"aaaa begin:key:%@ value:%@", key, obj);
        if ([key isEqualToString:@"key3"]) {
            return;
        }
        NSLog(@"aaaa end:key:%@ value:%@", key, obj);
    }];
    NSLog(@"aaaa:100");
}

- (void)test_async_serial_inlist {
    self.serialQueue = dispatch_queue_create("abc", DISPATCH_QUEUE_SERIAL);
    [self test_async_serial_inlist1];
    
}
- (void)test_async_serial_inlist1 {
    dispatch_async(self.serialQueue, ^{
        NSLog(@"test_async_serial_inlist1");
        [self test_async_serial_inlist2];
    });
}
- (void)test_async_serial_inlist2 {
    dispatch_async(self.serialQueue, ^{
        NSLog(@"test_async_serial_inlist2");
        [self test_async_serial_inlist3];
    });
}
- (void)test_async_serial_inlist3 {
    dispatch_async(self.serialQueue, ^{
        NSLog(@"test_async_serial_inlist3");
    });
}

// 串行队列,异步执行
- (void)test2222
{
//    UITouchPhase
    dispatch_queue_t queue = dispatch_queue_create("11111", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        NSLog(@"1");
    });
    dispatch_async(queue, ^{
        NSLog(@"2");
    });
    dispatch_async(queue, ^{
        NSLog(@"3");
    });
    dispatch_async(queue, ^{
        NSLog(@"4");
    });
    dispatch_async(queue, ^{
        NSLog(@"5");
    });
    dispatch_async(queue, ^{
        NSLog(@"6");
    });
    dispatch_async(queue, ^{
        NSLog(@"7");
    });
}

- (void)testMain11
{
    NSThread *thread = [NSThread mainThread];
    NSLog(@"thread name:%@---end", thread.name);
    
    dispatch_queue_t main_queue = dispatch_get_main_queue();
    const char *name = dispatch_queue_get_label(main_queue);
    NSLog(@"dispatch_queue_t name:%s---end", name);
    
    const char *name2 = dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL);
    NSLog(@"DISPATCH_CURRENT_QUEUE_LABEL name2:%s---end", name2);
    
    
    NSThread *newThread = [[NSThread alloc] initWithBlock:^{
        NSLog(@"newThread");
    }];
    [newThread start];
    
}

- (void)testSD_GCD
{
    
    
    
//    void(^block22)() = ^void(){
//        NSLog(@"111111");
//    };
    
    NSLog(@"ccc:%p", NULL);
    NSLog(@"ccc1:%p", dispatch_get_main_queue());
    NSLog(@"ccc:%p", dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL));
    NSLog(@"ccc:%p", dispatch_queue_get_label(dispatch_get_main_queue()));
    
    if (strcmp(dispatch_queue_get_label(DISPATCH_CURRENT_QUEUE_LABEL), dispatch_queue_get_label(dispatch_get_main_queue())) == 0) {
        NSLog(@"111111");
    } else {
        dispatch_async(dispatch_get_main_queue(), ^void() {
            NSLog(@"222222222");
        });
    }
}

- (void)test_completion
{
    
    void (^complet111)(NSInteger, NSInteger) = ^(NSInteger i, NSInteger j){
        NSInteger k = i + j;
        NSLog(@"k:%zd", k);
    };
    
    complet111(1, 2);
    
    void (^complte2222)(void) = ^(void){
        NSInteger k = 10;
        NSLog(@"k:%zd", k);
    };
    complte2222();
}

#pragma mark - View Life Cycle


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    [self initializeUIAndData];
    [self initializeAction];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
