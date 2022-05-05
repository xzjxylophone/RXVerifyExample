//
//  RXRunloopUtil.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/21.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXRunloopUtil.h"

@implementation RXRunloopUtil

+ (void)addRunloopObserver:(void(^)(CFRunLoopObserverRef, CFRunLoopActivity))block
{
    /*
     第一个参数:怎么分配存储空间
     第二个参数:要监听的状态 kCFRunLoopAllActivities 所有的状态
     第三个参数:时候持续监听
     第四个参数:优先级 总是传0
     第五个参数:当状态改变时候的回调
     */
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, block);
    /*
     第一个参数:要监听哪个runloop
     第二个参数:观察者
     第三个参数:运行模式
     */
    CFRunLoopAddObserver(CFRunLoopGetCurrent(),observer, kCFRunLoopDefaultMode);
}

@end
