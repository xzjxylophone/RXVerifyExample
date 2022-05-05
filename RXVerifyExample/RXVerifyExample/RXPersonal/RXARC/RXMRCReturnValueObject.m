//
//  RXMRCReturnValueObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/21.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMRCReturnValueObject.h"
#import "RXRunloopUtil.h"
#import "RXARCTmpObject.h"

@interface RXMRCReturnValueObject()
@property (nonatomic, retain) RXARCTmpObject *tmpObject;
@end

@implementation RXMRCReturnValueObject
// 调用者与被调用者的描述:

- (void)test
{
//    [self _test_ownership_from_callee_to_autorelease];
    
//    [self _test_ownership_from_callee_to_caller];
    
//    [self _test_ownership_from_callee_to_caller_2];
    
//    [self _test_kkk];
    
}


- (id)_foo_ownership_from_callee_to_autorelease
{
    RXARCTmpObject *object = [[RXARCTmpObject alloc] init];
    NSLog(@"count after alloc init:%zd", [object retainCount]);
    return [object autorelease];
}
- (void)_test_ownership_from_callee_to_autorelease
{
    id object = [self _foo_ownership_from_callee_to_autorelease];
    NSLog(@"count after call method:%zd", [object retainCount]);
    NSLog(@"%@", object);
}

- (id)_foo_ownership_from_callee_to_caller
{
    RXARCTmpObject *object = [[RXARCTmpObject alloc] init];
    NSLog(@"count after alloc init:%zd", [object retainCount]);
    return object;
}
- (void)_test_ownership_from_callee_to_caller
{
    id object = [self _foo_ownership_from_callee_to_caller];
    NSLog(@"count after call method:%zd", [object retainCount]);
    NSLog(@"%@", object);
    NSLog(@"before release");
    [object release]; // 如果没有这一行,object会内存泄漏
    NSLog(@"after release");
}

- (id)_foo_ownership_from_callee_to_caller_2
{
    RXARCTmpObject *object = [[RXARCTmpObject alloc] init];
    NSLog(@"count after alloc init:%zd", [object retainCount]);
    id returnValue = [object retain]; // 因为需要返回,所以先retain一次
    [object release]; // 谁申请谁释放原则,有一个alloc init,就有一个release
    return returnValue;
}
- (void)_test_ownership_from_callee_to_caller_2
{
    id object = [self _foo_ownership_from_callee_to_caller_2];
    NSLog(@"count after call method:%zd", [object retainCount]);
    NSLog(@"%@", object);
    NSLog(@"before release");
    [object release]; // 如果没有这一行,object会内存泄漏
    NSLog(@"after release");
}


- (id)_foo_ownership_noChange
{
    
    RXARCTmpObject *object = [[RXARCTmpObject alloc] init];
    NSString *str = [NSString stringWithFormat:@"%@", object]; // 这个内存是由 stringWithFormat 方法管理的
    [object release];
    NSLog(@"count after product:%zd", [str retainCount]);
    return str;
}
- (void)_test_ownership_noChange
{
    NSString *str = [self _foo_ownership_noChange];
    NSLog(@"count after call method:%zd", [str retainCount]);
    NSLog(@"str:%@", str);
}







//  可以做其他用处:



- (id)_foo_return_value
{
    RXARCTmpObject *object = [[RXARCTmpObject alloc] init];
    NSUInteger count = [object retainCount];
    NSLog(@"count after alloc init:%zd", count);
    return [object autorelease];
}
- (void)test_ns_retain_count
{
    [self _add_runloop_observer];
    
    id object = [self _foo_return_value];
    
    NSUInteger count = [object retainCount];
    NSLog(@"count after foo:%zd", count);
    
    self.tmpObject = object;
    count = [object retainCount];
    NSLog(@"count after self.tmp:%zd", count);
    //    // 这里self会出现循环引用,会出现self内存泄漏
    //    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    //        NSUInteger count2 = [self.tmpObject retainCount];
    //        NSLog(@"count in dispatch:%zd", count2);
    //    });
}




- (void)_print_tmpObject_info:(NSString *)prefix
{
    NSUInteger count = [self.tmpObject retainCount];
    NSLog(@"count in %@:%zd", prefix, count);
}
- (void)_add_runloop_observer
{
    void (^block)(CFRunLoopObserverRef, CFRunLoopActivity) = ^void(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
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
    };
    
    [RXRunloopUtil addRunloopObserver:block];
}

@end
