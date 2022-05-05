//
//  NSTimer+RXVerify.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/24.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//



#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSTimer (RXVerify)

+ (instancetype)rxv_scheduleTimerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats usingBlock:(void (^)(NSTimer *timer))block;
+ (instancetype)rxv_timerWithTimeInterval:(NSTimeInterval)seconds repeats:(BOOL)repeats usingBlock:(void (^)(NSTimer *timer))block;
@end

NS_ASSUME_NONNULL_END
