//
//  RXRunloopUtil.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/21.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXRunloopUtil : NSObject
/*
 kCFRunLoopEntry = (1UL << 0),        即将进入runloop
 kCFRunLoopBeforeTimers = (1UL << 1), 即将处理timer事件
 kCFRunLoopBeforeSources = (1UL << 2),即将处理source事件
 kCFRunLoopBeforeWaiting = (1UL << 5),即将进入睡眠
 kCFRunLoopAfterWaiting = (1UL << 6), 被唤醒
 kCFRunLoopExit = (1UL << 7),         runloop退出
 kCFRunLoopAllActivities = 0x0FFFFFFFU
 */
+ (void)addRunloopObserver:(void(^)(CFRunLoopObserverRef, CFRunLoopActivity))block;
@end
