//
//  RVRunLoopViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/5/23.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVRunLoopViewController.h"


void RunLoopSourceScheduleRoutine (void *info, CFRunLoopRef rl, CFStringRef mode)
{
    
    NSLog(@"RunLoopSourceScheduleRoutine");
//    RunLoopSource* obj = (RunLoopSource*)info;
//    AppDelegate*   del = [AppDelegate sharedAppDelegate];
//    RunLoopContext* theContext = [[RunLoopContext alloc] initWithSource:obj andLoop:rl];
//    
//    [del performSelectorOnMainThread:@selector(registerSource:)
//                          withObject:theContext waitUntilDone:NO];
}
void RunLoopSourcePerformRoutine (void *info)
{
    NSLog(@"RunLoopSourcePerformRoutine");

//    RunLoopSource*  obj = (RunLoopSource*)info;
//    [obj sourceFired];
}

void RunLoopSourceCancelRoutine (void *info, CFRunLoopRef rl, CFStringRef mode)
{
    NSLog(@"RunLoopSourceCancelRoutine");

//    RVRunLoopViewController* obj = (RVRunLoopViewController*)info;
//    AppDelegate* del = [AppDelegate sharedAppDelegate];
//    RunLoopContext* theContext = [[RunLoopContext alloc] initWithSource:obj andLoop:rl];
//    [del performSelectorOnMainThread:@selector(removeSource:)
//                          withObject:theContext waitUntilDone:YES];
}


void myRunLoopObserver(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    switch (activity) {
            //The entrance of the run loop, before entering the event processing loop.
            //This activity occurs once for each call to CFRunLoopRun and CFRunLoopRunInMode
        case kCFRunLoopEntry:
            NSLog(@"run loop entry");
            break;
            //Inside the event processing loop before any timers are processed
        case kCFRunLoopBeforeTimers:
            NSLog(@"run loop before timers");
            break;
            //Inside the event processing loop before any sources are processed
        case kCFRunLoopBeforeSources:
            NSLog(@"run loop before sources");
            break;
            //Inside the event processing loop before the run loop sleeps, waiting for a source or timer to fire.
            //This activity does not occur if CFRunLoopRunInMode is called with a timeout of 0 seconds.
            //It also does not occur in a particular iteration of the event processing loop if a version 0 source fires
        case kCFRunLoopBeforeWaiting:
            NSLog(@"run loop before waiting");
            break;
            //Inside the event processing loop after the run loop wakes up, but before processing the event that woke it up.
            //This activity occurs only if the run loop did in fact go to sleep during the current loop
        case kCFRunLoopAfterWaiting:
            NSLog(@"run loop after waiting");
            break;
            //The exit of the run loop, after exiting the event processing loop.
            //This activity occurs once for each call to CFRunLoopRun and CFRunLoopRunInMode
        case kCFRunLoopExit:
            NSLog(@"run loop exit");
            break;
            /*
             A combination of all the preceding stages
             case kCFRunLoopAllActivities:
             break;
             */
        default:  
            break;  
    }  
}

@interface RVRunLoopViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) NSArray *dataArray;


@property (nonatomic, assign) CFRunLoopRef runLoopRef;


@property (nonatomic, weak) NSThread *runLoopThread;

@property (nonatomic, strong) NSRunLoop *runLoop;



@end

@implementation RVRunLoopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(50, 50, 50, 50);
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
//    CFRunLoopGetMain()
    
    
//    [self testCommonMode];
    
//    [self test002];
    
//    [self testChangeToOtherRunLoop];
    
//    [self testNewRunLoop];
    
    [self testRunLoop_WangYunPeng];
    
//    NSRunLoop *runLoop;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)dealloc
{
    NSLog(@"deallocdeallocdeallocdeallocdeallocdeallocdealloc");
}
#pragma mark - Test
- (void)testRunLoop_WangYunPeng
{
    // main
    CFRunLoopRef runLoopRef = CFRunLoopGetMain();
    CFStringRef stringRef = CFRunLoopCopyCurrentMode(runLoopRef);
    NSLog(@"main runLoopRef:%p mode:%@", runLoopRef, (__bridge NSString *)stringRef);

    dispatch_async(dispatch_queue_create("1111", DISPATCH_QUEUE_PRIORITY_DEFAULT), ^{
        // cur1111
        CFRunLoopRef cur1 = CFRunLoopGetCurrent();
        CFStringRef stringRefCur1 = CFRunLoopCopyCurrentMode(cur1);
        NSLog(@"cur1 runLoopRef:%p mode:%@", cur1, (__bridge NSString *)stringRefCur1);
        

        [NSThread sleepForTimeInterval:0.1];
        
        // cur2222
        CFRunLoopRef cur2 = CFRunLoopGetCurrent();
        CFStringRef stringRefCur2 = CFRunLoopCopyCurrentMode(cur2);
        NSLog(@"cur2 runLoopRef:%p mode:%@", cur2, (__bridge NSString *)stringRefCur2);
        
        NSLog(@"11111");
    });
}
- (void)testRunLoopObserve
{
    CFRunLoopRef runLoopRef = CFRunLoopGetMain();
    
    
    //设置Run loop observer的运行环境
    CFRunLoopObserverContext context = {0, (__bridge void *)self, NULL, NULL, NULL};
    
    //创建Run loop observer对象
    //第一个参数用于分配observer对象的内存
    //第二个参数用以设置observer所要关注的事件，详见回调函数myRunLoopObserver中注释
    //第三个参数用于标识该observer是在第一次进入run loop时执行还是每次进入run loop处理时均执行
    //第四个参数用于设置该observer的优先级
    //第五个参数用于设置该observer的回调函数
    //第六个参数用于设置该observer的运行环境
    CFRunLoopObserverRef runLoopObserverRef = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, &myRunLoopObserver, &context);
    
    
    CFRunLoopAddObserver(runLoopRef, runLoopObserverRef, kCFRunLoopDefaultMode);
    
//    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(doFireTimer:) userInfo:nil repeats:YES];
    
    NSInteger loopCount = 10;
    
    do {
        //启动当前thread的loop直到所指定的时间到达，在loop运行时，run loop会处理所有来自与该run loop联系的input source的数据
        //对于本例与当前run loop联系的input source只有一个Timer类型的source。
        //该Timer每隔0.1秒发送触发事件给run loop，run loop检测到该事件时会调用相应的处理方法。
        
        //由于在run loop添加了observer且设置observer对所有的run loop行为都感兴趣。
        //当调用runUnitDate方法时，observer检测到run loop启动并进入循环，observer会调用其回调函数，第二个参数所传递的行为是kCFRunLoopEntry。
        //observer检测到run loop的其它行为并调用回调函数的操作与上面的描述相类似。
//        [runLoopRef runUntilDate:[NSDate dateWithTimeIntervalSinceNow:1.0]];
        //当run loop的运行时间到达时，会退出当前的run loop。observer同样会检测到run loop的退出行为并调用其回调函数，第二个参数所传递的行为是kCFRunLoopExit。
        
    
        
        loopCount--;
    } while (loopCount);

}

- (void)doFireTimer:(id)sender
{
    NSLog(@"doFireTimer:");
}


- (void)testAddRunLoopMode
{
    CFRunLoopRef mainRunLoopRef = CFRunLoopGetMain();
    
    
    CFStringRef model = (__bridge CFStringRef)@"testabc";
    CFRunLoopAddCommonMode(mainRunLoopRef, model);
    
    
    
    CFRunLoopSourceContext    context = {0, (__bridge void *)(self), NULL, NULL, NULL, NULL, NULL,
        &RunLoopSourceScheduleRoutine,
        RunLoopSourceCancelRoutine,
        RunLoopSourcePerformRoutine};
    
    CFRunLoopSourceRef runLoopSourceRef = CFRunLoopSourceCreate(NULL, 0, &context);
    CFRunLoopAddSource(mainRunLoopRef, runLoopSourceRef, model);
    
    
}

- (void)testMainAddNewMode
{
    CFRunLoopRef runLoopRef = CFRunLoopGetCurrent();
    
    [self printAllModeNameInRunLoopRef:runLoopRef];
    
    NSDate *date = [[NSDate new] dateByAddingTimeInterval:100];
    NSTimeInterval ti = [date timeIntervalSinceReferenceDate];
    CFRunLoopRunResult result = CFRunLoopRunInMode((__bridge CFStringRef)@"123", ti, false);
    NSLog(@"CFRunLoopRunResult:%zd", (NSInteger)result);
    
    
    [self printAllModeNameInRunLoopRef:runLoopRef];
}

- (void)testNewRunLoop
{
    
    
    
    NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(testNewRunLoopEntryPoint) object:nil];
    
    self.runLoopThread = thread;
    [self.runLoopThread start];
}

- (void)testNewRunLoopEntryPoint
{
    
//    [self printMainAndCurrentRunLoopInfoWithDes:@"testNewRunLoopEntryPoint"];

//    CFRunLoopRef runLoopRef = CFRunLoopGetCurrent();
//
//    CFRunLoopRunInMode((__bridge CFStringRef)@"123", 0.001, NO);
    
    
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    self.runLoop = runLoop;
    
    [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
    
    
    [runLoop addPort:[NSMachPort port] forMode:@"123"];
    
    
    
    [self printMainAndCurrentRunLoopInfoWithDes:@"testNewRunLoopEntryPoint"];
    
    CFRunLoopRef runLoopRef = [runLoop getCFRunLoop];
    
    
    CFRunLoopAddCommonMode(runLoopRef, (__bridge CFStringRef)@"123");
    
//    //设置Run loop observer的运行环境
    CFRunLoopObserverContext context = {0, (__bridge void *)self, NULL, NULL, NULL};
    CFRunLoopObserverRef runLoopObserverRef = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, &myRunLoopObserver, &context);
    CFRunLoopAddObserver(runLoopRef, runLoopObserverRef, (__bridge CFStringRef)@"123");
//
//    
    CFRunLoopAddObserver(runLoopRef, runLoopObserverRef, kCFRunLoopDefaultMode);

    
//    CFRunLoopAddSource(runLoopRef, runLoopSourceRef, kCFRunLoopDefaultMode);
    
//    CFRunLoopRunInMode((__bridge CFStringRef)@"123", 0.1, false);
    
    
    
    CFRunLoopSourceContext    context2 = {0, (__bridge void *)(self), NULL, NULL, NULL, NULL, NULL,
        &RunLoopSourceScheduleRoutine,
        RunLoopSourceCancelRoutine,
        RunLoopSourcePerformRoutine};
    
    CFRunLoopSourceRef runLoopSourceRef = CFRunLoopSourceCreate(NULL, 0, &context2);
    CFRunLoopAddSource(runLoopRef, runLoopSourceRef, (__bridge CFStringRef)@"123");
    
    
//
//    
//    
    CFRunLoopSourceContext    context3 = {1, (__bridge void *)(self), NULL, NULL, NULL, NULL, NULL,
        &RunLoopSourceScheduleRoutine,
        RunLoopSourceCancelRoutine,
        RunLoopSourcePerformRoutine};
    
    CFRunLoopSourceRef runLoopSourceRef3 = CFRunLoopSourceCreate(NULL, 0, &context3);
    CFRunLoopAddSource(runLoopRef, runLoopSourceRef3, (__bridge CFStringRef)@"123");
    
//    [self.runLoop runMode:@"123" beforeDate:[[NSDate new] dateByAddingTimeInterval:100]];
    

    [self.runLoop run];
    
    NSLog(@"kkkk");
    
    
//    BOOL result = [self.runLoop runMode:@"123" beforeDate:[[NSDate new] dateByAddingTimeInterval:10]];
//    
//    NSLog(@"result:%zd", result);
    
    
    
    
    
//    [runLoop run];

    
//    [runLoop runUntilDate:[NSDate new]];
//    [runLoop addPort:[NSMachPort port] forMode:@"123"];
//    [runLoop runMode:@"123" beforeDate:[NSDate new]];
    
//    [self testAnalysis];
    
    
    
//    NSThread
    
    
    
    
}

- (void)exeInRunLoop
{
    [self testAnalysis];
    [self printMainAndCurrentRunLoopInfoWithDes:@"exeInRunLoop"];
}

- (void)exeInRunLoop2
{
    NSLog(@"exeInRunLoop2");

    [self performSelector:@selector(exeInRunLoop) onThread:self.runLoopThread withObject:nil waitUntilDone:NO modes:@[@"123"]];

}

- (void)exeInRunLoop1
{
    [self printMainAndCurrentRunLoopInfoWithDes:@"exeInRunLoop1"];
    // 不能是yes
    [self performSelectorOnMainThread:@selector(exeInRunLoop2) withObject:nil waitUntilDone:YES];
    
    NSLog(@"exeInRunLoop1");
    
    
    CFRunLoopRef runLoopRef = [self.runLoop getCFRunLoop];
    
    CFRunLoopSourceContext    context2 = {0, (__bridge void *)(self), NULL, NULL, NULL, NULL, NULL,
        &RunLoopSourceScheduleRoutine,
        RunLoopSourceCancelRoutine,
        RunLoopSourcePerformRoutine};
    
    CFRunLoopSourceRef runLoopSourceRef = CFRunLoopSourceCreate(NULL, 0, &context2);
    CFRunLoopAddSource(runLoopRef, runLoopSourceRef, (__bridge CFStringRef)@"123");
    
    
    //
    //
    //
    CFRunLoopSourceContext    context3 = {1, (__bridge void *)(self), NULL, NULL, NULL, NULL, NULL,
        &RunLoopSourceScheduleRoutine,
        RunLoopSourceCancelRoutine,
        RunLoopSourcePerformRoutine};
    
    CFRunLoopSourceRef runLoopSourceRef3 = CFRunLoopSourceCreate(NULL, 0, &context3);
    CFRunLoopAddSource(runLoopRef, runLoopSourceRef3, (__bridge CFStringRef)@"123");
    
    
    [self.runLoop runMode:@"123" beforeDate:[[NSDate new] dateByAddingTimeInterval:100]];
    
}
- (void)testAnalysis
{
    NSDictionary *dic = @{@"msg":@"mmmmmm",
                          @"state":@"sssss",
                          @"key":@"kkk"};
    for (NSString *tmp in dic.allKeys) {
        NSString *value = dic[tmp];
        NSLog(@"key=%@ value=%@", tmp, value);
    }
}





/*
 主线程的 RunLoop 里有两个预置的 Mode：kCFRunLoopDefaultMode 和 UITrackingRunLoopMode。
 这两个 Mode 都已经被标记为"Common"属性。DefaultMode 是 App 平时所处的状态，
 TrackingRunLoopMode 是追踪 ScrollView 滑动时的状态。
 当你创建一个 Timer 并加到 DefaultMode 时，Timer 会得到重复回调，
 但此时滑动一个TableView时，RunLoop 会将 mode 切换为 TrackingRunLoopMode，
 这时 Timer 就不会被回调，并且也不会影响到滑动操作。
 
 有时你需要一个 Timer，在两个 Mode 中都能得到回调，
 方法1: 将这个 Timer 分别加入这两个 Mode。
 方法2: 将 Timer 加入到顶层的 RunLoop 的 "commonModeItems" 中。"commonModeItems" 被 RunLoop 自动更新到所有具有"Common"属性的 Mode 里去。
 */
- (void)testTimerInUITrackingRunLoopMode
{
    CGFloat width = RX_Window_Width;
    CGFloat height = RX_Window_Height;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < 100; i++) {
        [array addObject:@(i)];
    }
    self.dataArray = array;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
    
    
    
    CFRunLoopRef runLoopRef = CFRunLoopGetMain();
    
    // 方法1: 加入到ui更新的runLoop中
//    CFRunLoopAddTimer(runLoopRef, (__bridge CFRunLoopTimerRef)self.timer, (__bridge CFStringRef)UITrackingRunLoopMode);
    
    // 方法2: 加入到
    CFRunLoopAddTimer(runLoopRef, (__bridge CFRunLoopTimerRef)self.timer, kCFRunLoopCommonModes);
    

    
}

- (void)buttonTouchUpInside:(id)sender
{
    
    
   
//    [self.runLoop runMode:@"123" beforeDate:[[NSDate new] dateByAddingTimeInterval:100]];

    
//    CFRunLoopRef runLoopRef = [self.runLoop getCFRunLoop];
//    [self.runLoop run];
//    CFRunLoopWakeUp(runLoopRef);

//    [self performSelector:@selector(exeInRunLoop) onThread:self.runLoopThread withObject:nil waitUntilDone:YES modes:@[NSDefaultRunLoopMode]];

    
    
//    CFRunLoopSourceContext    context2 = {0, (__bridge void *)(self), NULL, NULL, NULL, NULL, NULL,
//        &RunLoopSourceScheduleRoutine,
//        RunLoopSourceCancelRoutine,
//        RunLoopSourcePerformRoutine};
//    
//    CFRunLoopSourceRef runLoopSourceRef = CFRunLoopSourceCreate(NULL, 0, &context2);
//    CFRunLoopAddSource(runLoopRef, runLoopSourceRef, (__bridge CFStringRef)@"123");
//    
//    
//    
//    CFRunLoopSourceContext    context3 = {1, (__bridge void *)(self), NULL, NULL, NULL, NULL, NULL,
//        &RunLoopSourceScheduleRoutine,
//        RunLoopSourceCancelRoutine,
//        RunLoopSourcePerformRoutine};
//    
//    CFRunLoopSourceRef runLoopSourceRef3 = CFRunLoopSourceCreate(NULL, 0, &context3);
//    CFRunLoopAddSource(runLoopRef, runLoopSourceRef3, (__bridge CFStringRef)@"123");
//
    
    
    
    
//    CFRunLoopRef mainRunLoopRef = CFRunLoopGetMain();
//    [self printAllModeNameInRunLoopRef:mainRunLoopRef];
//    
//    
//    
//    
//    BOOL result = [self.runLoop runMode:@"123" beforeDate:[[NSDate new] dateByAddingTimeInterval:100]];
//    
//    [self.runLoop run];
//    
//    [self printAllModeNameInRunLoopRef:mainRunLoopRef];
//    
//    
//    [self printAllModeNameInRunLoopRef:[self.runLoop getCFRunLoop]];
//    
//    [self performSelector:@selector(exeInRunLoop) onThread:self.runLoopThread withObject:nil waitUntilDone:NO modes:@[@"123"]];

//
    
//    sleep(1);
    
//    [self performSelector:@selector(exeInRunLoop) onThread:self.runLoopThread withObject:nil waitUntilDone:NO modes:@[NSDefaultRunLoopMode]];
//    return;

    
    // 只能执行一次, 那个 被 RunLoop exit
    
    // 一定要是 YES 否则会出现 死锁
    [self performSelector:@selector(exeInRunLoop1) onThread:self.runLoopThread withObject:nil waitUntilDone:NO modes:@[NSDefaultRunLoopMode]];
    
    

    
    [self printMainAndCurrentRunLoopInfoWithDes:@"buttonTouchUpInside"];
//
//    [self performSelector:@selector(performButtonTouchUpInside) onThread:self.runLoopThread withObject:nil waitUntilDone:YES modes:[NSSet setWithObject:NSRunLoopCommonModes].allObjects];
    
    
}
- (void)performButtonTouchUpInside
{
    [self printMainAndCurrentRunLoopInfoWithDes:@"performButtonTouchUpInside"];

}
- (void)testChangeToOtherRunLoop
{
    [self printMainAndCurrentRunLoopInfoWithDes:@"testChangeToOtherRunLoop"];
    
    
    
    NSThread *newThread = [[NSThread alloc] initWithTarget:self selector:@selector(testChangeToOtherRunLoopSelector) object:nil];
    [newThread start];
    self.runLoopThread = newThread;
}
- (void)testChangeToOtherRunLoopSelector
{
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:NO];
    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
    [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
    [self printMainAndCurrentRunLoopInfoWithDes:@"testChangeToOtherRunLoopSelector"];

    [runLoop addTimer:self.timer forMode:NSDefaultRunLoopMode];
    [runLoop run];

    NSLog(@"kkkk");
}


//- (void)testCommonMode
//{
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];
//    CFRunLoopRef runLoopRef = CFRunLoopGetCurrent();
//    CFStringRef mode = (__bridge CFStringRef)@"testabc";
//    CFRunLoopAddCommonMode(runLoopRef, mode);
//    [self printAllModeNameInRunLoopRef:runLoopRef];
//    CFRunLoopRef mainRunLoopRef = CFRunLoopGetMain();
//    CFRunLoopAddTimer(mainRunLoopRef, (__bridge CFRunLoopTimerRef)self.timer, kCFRunLoopCommonModes);
//    CFRunLoopRunInMode(mode, 1, NO);
//    
//}



- (void)testCommonMode
{
    
    
    CFRunLoopRef runLoopRef = CFRunLoopGetCurrent();
    CFStringRef mode = (__bridge CFStringRef)@"testabc";
    CFRunLoopAddCommonMode(runLoopRef, mode);
    
    CFStringRef mode2 = (__bridge CFStringRef)@"testabc2";
    CFRunLoopAddCommonMode(runLoopRef, mode2);
    
    [self printAllModeNameInRunLoopRef:runLoopRef];
    
    
   
    CFRunLoopRunInMode(mode, 0.001, false);
    [self performSelector:@selector(testAddCommonModeAction) withObject:nil afterDelay:1 inModes:@[@"testabc"]];
    
    
}

- (void)testAddCommonModeAction
{
    CFRunLoopRef runLoopRef = CFRunLoopGetCurrent();
    
    [self printAllModeNameInRunLoopRef:runLoopRef];
    
    [self printMainAndCurrentRunLoopInfoWithDes:@"testAddCommonModeAction"];
}




- (void)test001
{
    CGFloat width = RX_Window_Width;
    CGFloat height = RX_Window_Height;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < 100; i++) {
        [array addObject:@(i)];
    }
    self.dataArray = array;
    

//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];


    
    [self.view addSubview:tableView];
}


- (void)test002
{
    CGFloat width = RX_Window_Width;
    CGFloat height = RX_Window_Height;
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, width, height) style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    
    NSMutableArray *array = [NSMutableArray array];
    for (NSInteger i = 0; i < 100; i++) {
        [array addObject:@(i)];
    }
    self.dataArray = array;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];

    
    CFRunLoopRef runLoopRef = CFRunLoopGetMain();

    // 第一种方式: 加入到ui更新的runLoop中
//    CFRunLoopAddTimer(runLoopRef, (__bridge CFRunLoopTimerRef)self.timer, (__bridge CFStringRef)UITrackingRunLoopMode);
    
    
//    CFRunLoopAddTimer(runLoopRef, (__bridge CFRunLoopTimerRef)self.timer, kCFRunLoopCommonModes);

    
//    CFRunLoopAddCommonMode(runLoopRef, (__bridge CFStringRef)UITrackingRunLoopMode);
//    CFRunLoopAddCommonMode(runLoopRef, kCFRunLoopCommonModes);
    
    
    [self printAllModeNameInRunLoopRef:runLoopRef];
    
    
    
    [self.view addSubview:tableView];
}
- (void)cellLoad
{
    [self printMainAndCurrentRunLoopInfoWithDes:@"cellLoad"];
}

- (void)test003
{
    __weak __typeof(self) weakSelf = self;
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction:) userInfo:nil repeats:YES];

    dispatch_queue_t queue = dispatch_queue_create("123", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        
        [weakSelf printMainAndCurrentRunLoopInfoWithDes:@"dispatch_async"];
        
        
        NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
        [runLoop addPort:[NSMachPort port] forMode:NSDefaultRunLoopMode];
        [runLoop run];

        
        
        
//        CFRunLoopRef runLoopRef = CFRunLoopGetCurrent();
//        CFRunLoopAddTimer(runLoopRef, (__bridge CFRunLoopTimerRef)weakSelf.timer, (__bridge CFStringRef)@"123456");
//        
//        CFRunLoopRun();
//        weakSelf.runLoopRef = runLoopRef;
        
    });
    
//    [self performSelector:@selector(test004) withObject:nil afterDelay:3 inModes:@[(__bridge NSString *)kCFRunLoopDefaultMode]];
}

- (void)test004
{
    
    NSLog(@"%@", self.runLoopRef);
    
    CFRunLoopAddTimer(self.runLoopRef, (__bridge CFRunLoopTimerRef)self.timer, (__bridge CFStringRef)@"123456");
    
    [self performSelector:@selector(test005) withObject:nil afterDelay:3 inModes:@[@"123456"]];
    
    CFArrayRef arrayRef = CFRunLoopCopyAllModes(self.runLoopRef);
    
    NSLog(@"%@", arrayRef);

}
- (void)test005
{
    NSLog(@"005 begin");
    for (NSInteger i = 0; i < 10; i++) {
        [NSThread sleepForTimeInterval:3];
    }
    NSLog(@"005 end");
}







#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"1234567";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%@", self.dataArray[indexPath.row]];
    
    
    [self printMainAndCurrentRunLoopInfoWithDes:@"cellForRow"];
    [self performSelector:@selector(cellLoad) withObject:nil afterDelay:0 inModes:@[NSDefaultRunLoopMode]];


    return cell;
}

#pragma mark - Action
- (void)timerAction:(id)sender
{
    [self printMainAndCurrentRunLoopInfoWithDes:@"timerAction"];
}


#pragma mark - Private
- (void)printAllModeNameInRunLoopRef:(CFRunLoopRef)runLoopRef
{
    CFArrayRef arrayRef = CFRunLoopCopyAllModes(runLoopRef);
    [self printCFArrayRef:arrayRef];
}

- (void)printMainAndCurrentRunLoopInfoWithDes:(NSString *)des
{
    CFRunLoopRef mainRunLoopRef = CFRunLoopGetMain();
    CFStringRef mainStringRef = CFRunLoopCopyCurrentMode(mainRunLoopRef);
    CFRunLoopRef curRunLoopRef = CFRunLoopGetCurrent();
    CFStringRef curStringRef = CFRunLoopCopyCurrentMode(curRunLoopRef);
    
    NSLog(@"%@ main:%p:%@ cur:%p:%@", des, mainRunLoopRef, (__bridge NSString *)mainStringRef, curRunLoopRef, (__bridge NSString *)curStringRef);
}

- (void)printCFArrayRef:(CFArrayRef)arrayRef
{
    NSArray *array = (__bridge NSArray *)arrayRef;
    NSLog(@"allModeNameInRunLoopRef:%@", [array componentsJoinedByString:@","]);
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
