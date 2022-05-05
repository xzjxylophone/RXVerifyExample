//
//  RXRunLoop.m
//  RXVerifyExample
//
//  Created by ceshi on 16/5/25.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RXRunLoop.h"



void myRunLoopObserver2(CFRunLoopObserverRef observer, CFRunLoopActivity activity, void *info) {
    RXRunLoop *rxRunLoop = (__bridge RXRunLoop *)info;
    
    
    NSString *str = rxRunLoop.currentMode;
    switch (activity) {
            //The entrance of the run loop, before entering the event processing loop.
            //This activity occurs once for each call to CFRunLoopRun and CFRunLoopRunInMode
        case kCFRunLoopEntry:
            NSLog(@"%@ run loop entry", str);
            break;
            //Inside the event processing loop before any timers are processed
        case kCFRunLoopBeforeTimers:
            NSLog(@"%@ run loop before timers", str);
            break;
            //Inside the event processing loop before any sources are processed
        case kCFRunLoopBeforeSources:
            NSLog(@"%@ run loop before sources", str);
            break;
            //Inside the event processing loop before the run loop sleeps, waiting for a source or timer to fire.
            //This activity does not occur if CFRunLoopRunInMode is called with a timeout of 0 seconds.
            //It also does not occur in a particular iteration of the event processing loop if a version 0 source fires
        case kCFRunLoopBeforeWaiting:
            NSLog(@"%@ run loop before waiting", str);
            break;
            //Inside the event processing loop after the run loop wakes up, but before processing the event that woke it up.
            //This activity occurs only if the run loop did in fact go to sleep during the current loop
        case kCFRunLoopAfterWaiting:
            NSLog(@"%@ run loop after waiting", str);
            break;
            //The exit of the run loop, after exiting the event processing loop.
            //This activity occurs once for each call to CFRunLoopRun and CFRunLoopRunInMode
        case kCFRunLoopExit:
        {
            NSLog(@"%@ run loop exit", str);
            if ([rxRunLoop.currentMode isEqualToString:NSDefaultRunLoopMode]) {
                NSLog(@"rxRunLoop stop");
                [rxRunLoop stop];
            } else {
                NSLog(@"rxRunLoop not stop");

            }
        }
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

@interface RXRunLoop ()


@property (nonatomic, strong) NSThread *thread;
@property (nonatomic, strong) NSRunLoop *runLoop;
@property (nonatomic, assign) CFRunLoopRef runLoopRef;

@property (nonatomic, strong) RXRunLoopExeObject *rxRunLoopExeObject;



@property (nonatomic, strong) NSMutableDictionary *modePortDictionary;


@end

@implementation RXRunLoop




#pragma mark - Constructor And Destructor
- (id)init
{
    if (self = [super init]) {
        self.modePortDictionary = [NSMutableDictionary dictionary];
        
        NSThread *thread = [[NSThread alloc] initWithTarget:self selector:@selector(threadEntryPoint:) object:nil];
        [thread setName:@"RXRunLoop"];
        [thread start];
        
        self.thread = thread;
    }
    return self;
}

- (void)dealloc
{
    NSLog(@"RXRunLoop dealloc");
}

#pragma mark - Public
- (void)executeWithRXRunLoopExeObject:(RXRunLoopExeObject *)object
{
    if (object.mode.length == 0) {
        // mode 必须不能为空
        return;
    }
    
    if ([object.mode isEqualToString:NSDefaultRunLoopMode]) {
        // 如果mode是NSDefaultRunLoopMode 请使用其他的方法
        
        [object.target performSelector:object.action onThread:self.thread withObject:object.object waitUntilDone:NO modes:@[NSDefaultRunLoopMode]];
        
        return;
    }
    
    CFRunLoopRef currentRunLoopRef = CFRunLoopGetCurrent();
    CFRunLoopRef mainRunLoopRef = CFRunLoopGetMain();
    if (currentRunLoopRef != mainRunLoopRef) {
        // 只能在主线程执行
        return;
    }
    
    
    // 只能在MainRunLoop执行
    
    self.rxRunLoopExeObject = object;
    
    BOOL isModeExist = [self isModeExistInRunLoopWithMode:object.mode];
    
    if (!isModeExist) {
        // 创建一个新的port
        [self createANewModeInRunLoopRefWithMode:object.mode];
        
        // 设置成common属性
//        CFRunLoopAddCommonMode(self.runLoopRef, (__bridge CFStringRef)object.mode);
        
        
        //设置Run loop observer的运行环境
        CFRunLoopObserverContext context = {0, (__bridge void *)self, NULL, NULL, NULL};
        //创建Run loop observer对象
        //第一个参数用于分配observer对象的内存
        //第二个参数用以设置observer所要关注的事件，详见回调函数myRunLoopObserver中注释
        //第三个参数用于标识该observer是在第一次进入run loop时执行还是每次进入run loop处理时均执行
        //第四个参数用于设置该observer的优先级
        //第五个参数用于设置该observer的回调函数
        //第六个参数用于设置该observer的运行环境
        CFRunLoopObserverRef runLoopObserverRef = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, &myRunLoopObserver2, &context);
        CFRunLoopAddObserver(self.runLoopRef, runLoopObserverRef, (__bridge CFStringRef)object.mode);
    }
    
    
    [self performSelector:@selector(executeOnThisThread) onThread:self.thread withObject:nil waitUntilDone:NO modes:@[NSDefaultRunLoopMode]];

}


- (void)stop
{
    
    [NSObject cancelPreviousPerformRequestsWithTarget:self];
    
//    [self.thread cancel];
    NSLog(@"stopstopstopstopstop");
    NSLog(@"%@", self);
    for (NSString *mode in self.modePortDictionary) {
        id item = self.modePortDictionary[mode];
        NSLog(@"mode:%@ port:%@", mode, item);
        if ([item isKindOfClass:[NSPort class]]) {
            NSPort *port = item;
            [port invalidate];
            [self.runLoop removePort:port forMode:mode];
            
            
        }
    }
    
    CFRunLoopStop(self.runLoopRef);

    
//    [self performSelector:@selector(stopOnThisThread) onThread:self.thread withObject:nil waitUntilDone:NO];
}


- (void)stopOnThisThread
{
    
}

- (BOOL)isModeExistInRunLoopWithMode:(NSString *)mode
{
    CFArrayRef arrayRef = CFRunLoopCopyAllModes(self.runLoopRef);
    NSArray *array = (__bridge NSArray *)arrayRef;
    for (NSString *tmp in array) {
        if ([tmp isEqualToString:mode]) {
            return YES;
        }
    }

    return NO;
}

- (void)executeOnThisThread
{
    // 不能是yes
    [self performSelectorOnMainThread:@selector(executeOnMainThread) withObject:nil waitUntilDone:NO];
    
    BOOL result = [self.runLoop runMode:self.rxRunLoopExeObject.mode beforeDate:[[NSDate new] dateByAddingTimeInterval:10]];
    NSLog(@"result:%zd", result);
}
- (void)executeOnMainThread
{
    id targe = self.rxRunLoopExeObject.target;
    SEL action = self.rxRunLoopExeObject.action;
    NSThread *onThread = self.thread;
    id object = self.rxRunLoopExeObject.object;
    NSString *mode = self.rxRunLoopExeObject.mode;
    [targe performSelector:action onThread:onThread withObject:object waitUntilDone:NO modes:@[mode]];
    
    
    NSLog(@"111111");
}


#pragma mark - Thread Manager
- (void)threadEntryPoint:(id)__unused value
{
    self.runLoop = [NSRunLoop currentRunLoop];
    self.runLoopRef = [self.runLoop getCFRunLoop];
    
    // 代码001
    // 为什么要加入这一行代码,如果不加会出现什么问题
    [self createANewModeInRunLoopRefWithMode:NSDefaultRunLoopMode];
    
    
    
    //设置Run loop observer的运行环境
    CFRunLoopObserverContext context = {0, (__bridge void *)self, NULL, NULL, NULL};
    //创建Run loop observer对象
    //第一个参数用于分配observer对象的内存
    //第二个参数用以设置observer所要关注的事件，详见回调函数myRunLoopObserver中注释
    //第三个参数用于标识该observer是在第一次进入run loop时执行还是每次进入run loop处理时均执行
    //第四个参数用于设置该observer的优先级
    //第五个参数用于设置该observer的回调函数
    //第六个参数用于设置该observer的运行环境
    CFRunLoopObserverRef runLoopObserverRef = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, &myRunLoopObserver2, &context);
    CFRunLoopAddObserver(self.runLoopRef, runLoopObserverRef, kCFRunLoopDefaultMode);
    
    
    
    
    
    
    [self createANewModeInRunLoopRefWithMode:@"internal_mode_test"];
    //设置Run loop observer的运行环境
    CFRunLoopObserverContext context1 = {0, (__bridge void *)self, NULL, NULL, NULL};
    //创建Run loop observer对象
    //第一个参数用于分配observer对象的内存
    //第二个参数用以设置observer所要关注的事件，详见回调函数myRunLoopObserver中注释
    //第三个参数用于标识该observer是在第一次进入run loop时执行还是每次进入run loop处理时均执行
    //第四个参数用于设置该observer的优先级
    //第五个参数用于设置该observer的回调函数
    //第六个参数用于设置该observer的运行环境
    CFRunLoopObserverRef runLoopObserverRef1 = CFRunLoopObserverCreate(kCFAllocatorDefault, kCFRunLoopAllActivities, YES, 0, &myRunLoopObserver2, &context1);
    CFRunLoopAddObserver(self.runLoopRef, runLoopObserverRef1, (__bridge CFStringRef)@"internal_mode_test");
    
    [self.runLoop run];
    
    //
    NSLog(@"如果有代码1,那么这一行NSLog代码不执行,如果没有代码1,那么就执行,因为run是直接退出了,而不是在执行");
    
}

- (void)createANewModeInRunLoopRefWithMode:(NSString *)mode
{
    NSPort *port = [NSMachPort port];
    [self.runLoop addPort:port forMode:mode];
    [self.modePortDictionary setValue:port forKey:mode];
}

#pragma mark - Property
- (NSString *)currentMode
{
    CFStringRef stringRef = CFRunLoopCopyCurrentMode(self.runLoopRef);
    return (__bridge NSString *)stringRef;
}


#pragma mark - NSString Info
- (NSString *)stringWithCFArrayRef:(CFArrayRef)arrayRef
{
    NSArray *array = (__bridge NSArray *)arrayRef;
    return [array componentsJoinedByString:@","];
}


- (NSString *)description
{
    
    NSString *str0 = [NSString stringWithFormat:@"this RXRunLoop address:%p", self];
    
    CFRunLoopRef mainRunLoopRef = CFRunLoopGetMain();
    NSArray *arr1 = [self descriptionInfoArrayWithRunLoopRef:mainRunLoopRef tag:@"main"];
    
    
    CFRunLoopRef currentRunLoopRef = CFRunLoopGetCurrent();
    NSArray *arr2 = [self descriptionInfoArrayWithRunLoopRef:currentRunLoopRef tag:@"current"];
    
    
    NSArray *arr3 = [self descriptionInfoArrayWithRunLoopRef:self.runLoopRef tag:@"this object"];

    
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:str0];
    [array addObjectsFromArray:arr1];
    [array addObjectsFromArray:arr2];
    [array addObjectsFromArray:arr3];
    
    return [array description];
}


- (NSString *)currentRunLoopInfo
{
    CFRunLoopRef runLoopRef = CFRunLoopGetCurrent();
    
    NSArray *array = [self descriptionInfoArrayWithRunLoopRef:runLoopRef tag:@"current"];
    
    return [array description];
    
    
}


- (NSArray *)descriptionInfoArrayWithRunLoopRef:(CFRunLoopRef)runLoopRef tag:(NSString *)tag
{
    
    CFArrayRef mainArrayRef = CFRunLoopCopyAllModes(runLoopRef);
    CFStringRef str21Ref = CFRunLoopCopyCurrentMode(runLoopRef);
    NSString *str2 = [NSString stringWithFormat:@"%@ RunLoopRef address:%p currentMode:%@, all modes:%@", tag, runLoopRef, (__bridge NSString *)str21Ref, [self stringWithCFArrayRef:mainArrayRef]];
    
    return @[str2];
}


















@end
