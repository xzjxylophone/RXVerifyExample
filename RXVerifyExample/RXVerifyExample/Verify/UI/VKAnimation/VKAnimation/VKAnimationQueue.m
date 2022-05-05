//
//  VKAnimationQueue.m
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/6/17.
//

#import "VKAnimationQueue.h"
#import "VKWeakTimer.h"
@interface VKAnimationQueue()


// 缓存所有的更新block
@property (nonatomic, strong) NSMutableArray<VKAnimationItem *> *animationBlockArray;
// 当前正在执行的动画
@property (nonatomic, strong) VKAnimationItem *currentAnimationItem;
@property (nonatomic, strong) NSTimer *timer;
@end
@implementation VKAnimationQueue

- (void)addAnimation:(dispatch_block_t)animation {
    VKAnimationItem *item = [VKAnimationItem new];
    item.executeBlock = animation;
    [self addAnimationItem:item];
}

- (void)addAnimations:(NSArray *)animations {
    NSMutableArray *mutAry = [NSMutableArray new];
    for (dispatch_block_t block in animations) {
        VKAnimationItem *item = [VKAnimationItem new];
        item.executeBlock = block;
        [mutAry addObject:item];
    }
    [self addAnimationItems:mutAry];
}

- (void)addAnimationItem:(VKAnimationItem *)animation {
    @synchronized (self.animationBlockArray) {
        [self.animationBlockArray addObject:animation];
    }
    [self _pvk_executeBlockTask];
}
- (void)addAnimationItems:(NSArray<VKAnimationItem *> *)animations {
    @synchronized (self.animationBlockArray) {
        [self.animationBlockArray addObjectsFromArray:animations];
    }
    [self _pvk_executeBlockTask];
}



- (void)continueAnimation {
    self.currentAnimationItem = nil;
    @synchronized (self.animationBlockArray) {
        if (self.animationBlockArray.count == 0) {
            [self _pvk_stopTimer];
            return;
        }
        VKAnimationItem *item = self.animationBlockArray.firstObject;
        // 设置动画的执行时间
        item.beginExecuteDate = [NSDate new];
        self.currentAnimationItem = item;
        [self _pvk_startTimer];
        [self.animationBlockArray removeObjectAtIndex:0];
        if (self.currentAnimationItem.executeBlock != nil) {
            dispatch_async(dispatch_get_main_queue(), self.currentAnimationItem.executeBlock);
        }
    }
}

- (void)cancelAll {
    @synchronized (self.animationBlockArray) {
        self.currentAnimationItem = nil;
        [self.animationBlockArray removeAllObjects];
    }
}



#pragma mark - Private
- (void)_pvk_executeBlockTask {
    // 当前没有动画的时候才会继续执行动画
    if (self.currentAnimationItem == nil) {
        [self continueAnimation];
    } else { // 如果有动画的时候,判断此动画是否可能有问题
        if (self.currentAnimationItem.maybeAnimationException) {
            // 清空动画的相关资源
            if (self.currentAnimationItem.eliminateBlock) {
                self.currentAnimationItem.eliminateBlock();
            }
            [self continueAnimation];
        }
    }
}

#pragma mark - timer
- (void)_pvk_startTimer {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        if (strongSelf.timer == nil) {
            strongSelf.timer = [VKWeakTimer scheduledTimerWithTimeInterval:10 target:strongSelf selector:@selector(_pvk_timerAction) userInfo:nil repeats:YES];
        }
    });
}
- (void)_pvk_stopTimer {
    __weak typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        __strong typeof(weakSelf) strongSelf = weakSelf;
        [strongSelf.timer invalidate];
        strongSelf.timer = nil;
    });
}
- (void)_pvk_timerAction {
    [self _pvk_executeBlockTask];
}


#pragma mark - Constructor And Destructor
- (id)init {
    if (self = [super init]) {
        self.animationBlockArray = [NSMutableArray new];
    }
    return self;
}
- (void)dealloc {
    [self cancelAll];
}
@end
