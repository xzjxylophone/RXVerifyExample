//
//  VKAnimationQueue.h
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/6/17.
//

#import <Foundation/Foundation.h>
#import "VKAnimationItem.h"
NS_ASSUME_NONNULL_BEGIN

@interface VKAnimationQueue : NSObject
- (void)addAnimation:(dispatch_block_t)animation;
- (void)addAnimations:(NSArray *)animations;


- (void)addAnimationItem:(VKAnimationItem *)animation;
- (void)addAnimationItems:(NSArray<VKAnimationItem *> *)animations;


- (void)continueAnimation;

- (void)cancelAll;
@end

NS_ASSUME_NONNULL_END
