//
//  RXARCNSReturnsRetainedObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/19.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCNSReturnsRetainedObject.h"
#import "RXMRCUtil.h"
#import "RXARCTmpObject.h"
@interface RXARCNSReturnsRetainedObject()
@property (nonatomic, strong) RXARCTmpObject *tmpObject;
@end

@implementation RXARCNSReturnsRetainedObject
- (id)_foo_have_attribute __attribute((ns_returns_retained))
{
#if __has_attribute(ns_returns_retained)
    NSLog(@"__has_attribute ns_returns_retained");
#else
    NSLog(@"not __has_attribute ns_returns_retained");
#endif
    RXARCTmpObject *object = [RXARCTmpObject new];
    NSUInteger count = [RXMRCUtil objectRetainCount:object];
    NSLog(@"count in _foo_have_attribute:%zd", count);
    return object;
}
- (id)_foo_have_attribute_not_retains __attribute((ns_returns_not_retained))
{
#if __has_attribute(ns_returns_not_retained)
    NSLog(@"__has_attribute ns_returns_not_retained");
#else
    NSLog(@"not __has_attribute ns_returns_not_retained");
#endif
    RXARCTmpObject *object = [RXARCTmpObject new];
    NSUInteger count = [RXMRCUtil objectRetainCount:object];
    NSLog(@"count in _foo_have_attribute:%zd", count);
    return object;
}
- (id)_foo_not_attribute
{
    RXARCTmpObject *object = [RXARCTmpObject new];
    NSUInteger count = [RXMRCUtil objectRetainCount:object];
    NSLog(@"count in _foo_not_attribute:%zd", count);
    return object;
}
- (void)_print_tmpObject_info:(NSString *)prefix
{
    NSUInteger count = [RXMRCUtil objectRetainCount:self.tmpObject];
    NSLog(@"count in %@:%zd", prefix, count);
}
- (void)_add_runloop_observer
{
    //1.创建监听者
    /*
     第一个参数:怎么分配存储空间
     第二个参数:要监听的状态 kCFRunLoopAllActivities 所有的状态
     第三个参数:时候持续监听
     第四个参数:优先级 总是传0
     第五个参数:当状态改变时候的回调
     */
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        
        /*
         kCFRunLoopEntry = (1UL << 0),        即将进入runloop
         kCFRunLoopBeforeTimers = (1UL << 1), 即将处理timer事件
         kCFRunLoopBeforeSources = (1UL << 2),即将处理source事件
         kCFRunLoopBeforeWaiting = (1UL << 5),即将进入睡眠
         kCFRunLoopAfterWaiting = (1UL << 6), 被唤醒
         kCFRunLoopExit = (1UL << 7),         runloop退出
         kCFRunLoopAllActivities = 0x0FFFFFFFU
         */
        switch (activity) {
            case kCFRunLoopEntry:
                NSLog(@"即将进入runloop");
                [self _print_tmpObject_info:@"kCFRunLoopEntry"];
                break;
            case kCFRunLoopBeforeTimers:
                NSLog(@"即将处理timer事件");
                [self _print_tmpObject_info:@"kCFRunLoopBeforeTimers"];
                break;
            case kCFRunLoopBeforeSources:
                NSLog(@"即将处理source事件");
                [self _print_tmpObject_info:@"kCFRunLoopBeforeSources"];
                break;
            case kCFRunLoopBeforeWaiting:
                NSLog(@"即将进入睡眠");
                [self _print_tmpObject_info:@"kCFRunLoopBeforeWaiting"];
                break;
            case kCFRunLoopAfterWaiting:
                NSLog(@"被唤醒");
                [self _print_tmpObject_info:@"kCFRunLoopAfterWaiting"];
                break;
            case kCFRunLoopExit:
                NSLog(@"runloop退出");
                [self _print_tmpObject_info:@"kCFRunLoopExit"];
                break;
                
            default:
                break;
        }
    });
    
    /*
     第一个参数:要监听哪个runloop
     第二个参数:观察者
     第三个参数:运行模式
     */
    CFRunLoopAddObserver(CFRunLoopGetCurrent(),observer, kCFRunLoopDefaultMode);
    
    //NSDefaultRunLoopMode == kCFRunLoopDefaultMode
    //NSRunLoopCommonModes == kCFRunLoopCommonModes
}
- (void)test
{
    
    [self _add_runloop_observer];
    
//    id object = [self _foo_have_attribute];
//    id object = [self _foo_have_attribute_not_retains];
    id object = [self _foo_not_attribute];
    NSUInteger count = [RXMRCUtil objectRetainCount:object];
    NSLog(@"count in after call foo:%zd", count);
    self.tmpObject = object;
    count = [RXMRCUtil objectRetainCount:object];
    NSLog(@"count in after self.tmpObject:%zd", count);
    
    self.tmpObject = nil;
    
    count = [RXMRCUtil objectRetainCount:object];
    NSLog(@"count in after self.tmpObject = nil:%zd", count);
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self _print_tmpObject_info:@"dispatch"];
//    });
}
@end
