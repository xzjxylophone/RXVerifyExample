//
//  VKAnimationItem.h
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/6/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VKAnimationItem : NSObject
// 执行的动画任务
@property (nonatomic, copy) dispatch_block_t executeBlock;
// 当执行动画完成后(或者失败),需要清理的资源,此值可以为空
// 这个是补偿机制,千万不要依赖这个,要不然会导致交互不流畅
@property (nonatomic, copy, nullable) dispatch_block_t eliminateBlock;
@property (nonatomic, readonly, strong) NSDate *createDate;
// 动画开始执行时间
@property (nonatomic, strong) NSDate *beginExecuteDate;
// 默认60秒
@property (nonatomic, assign) NSInteger expiredSeconds;

// 动画是否可能出现异常
@property (nonatomic, readonly) BOOL maybeAnimationException;

@end

NS_ASSUME_NONNULL_END
