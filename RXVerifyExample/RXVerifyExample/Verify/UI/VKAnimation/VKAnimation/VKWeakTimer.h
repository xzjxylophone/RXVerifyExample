//
//  VKWeakTimer.h
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/6/21.
//

#import <Foundation/Foundation.h>

typedef void (^VKTimerHandler)(_Nullable id userInfo);
NS_ASSUME_NONNULL_BEGIN

@interface VKWeakTimer : NSObject

+ (NSTimer *) scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      target:(id)aTarget
                                    selector:(SEL)aSelector
                                    userInfo:(nullable id)userInfo
                                     repeats:(BOOL)repeats;

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)interval
                                      block:(VKTimerHandler)block
                                   userInfo:(nullable id)userInfo
                                    repeats:(BOOL)repeats;
@end

NS_ASSUME_NONNULL_END
