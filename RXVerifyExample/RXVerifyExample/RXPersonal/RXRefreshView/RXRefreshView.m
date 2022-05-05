//
//  RXRefreshView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/9.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXRefreshView.h"
#import "RXItemView.h"


typedef enum E_RX_RefreshState {
    kE_RX_RefreshState_Idle,            // 空闲状态
    kE_RX_RefreshState_Refreshing,      // 正在刷新状态
    kE_RX_RefreshState_Disappear,       // 消失状态
}E_RX_RefreshState;




@interface RXRefreshView ()


@property (nonatomic, weak) id target;
@property (nonatomic, assign) SEL action;

@property (nonatomic, strong) NSArray *items;



@property (nonatomic, weak) UIScrollView *scrollView;

// 当下拉的高度大于此值的时候,表示是下拉刷新
// 当前默认是80
@property (nonatomic, assign) CGFloat dropHeight;
// 水平随机的一个数据
@property (nonatomic, assign) NSInteger horizontalRandomness;


@property (nonatomic, assign) E_RX_RefreshState e_RX_RefreshState;




// 是否处于加载的过程中
@property (nonatomic, assign) BOOL isLoading;


// 另外一种形式的定时器
@property (nonatomic, strong) CADisplayLink *displayLink;

@property (nonatomic, assign) CGFloat disappearProgress;

@end

@implementation RXRefreshView

#pragma mark - Private
- (void)startLoadingAnimation
{
    for (NSInteger i = 0; i < self.items.count; i++) {
        RXItemView *itemView = self.items[i];
        [self performSelector:@selector(itemViewAnimation:) withObject:itemView afterDelay:(i * 0.1) inModes:@[NSRunLoopCommonModes]];
    }
}
- (void)itemViewAnimation:(RXItemView *)itemView
{
    switch (self.e_RX_RefreshState) {
        case kE_RX_RefreshState_Refreshing:
        {
            itemView.alpha = 1;
            [itemView.layer removeAllAnimations];
            [UIView animateWithDuration:0.8 animations:^{
                itemView.alpha = 0.4;
            } completion:^(BOOL finished) {
                
            }];
            BOOL isLastOne = (itemView.tag == self.items.count - 1);
            if (isLastOne) {
                [self startLoadingAnimation];
            }
        }
            break;
        case kE_RX_RefreshState_Disappear:
        case kE_RX_RefreshState_Idle:
        default:
            break;
    }
}

- (void)updateDisappearAnimation
{
    if (self.disappearProgress >= 0 && self.disappearProgress <= 1) {
        self.disappearProgress -= 1/60.0f/1.2f;
        [self updateBarItem];
        
    } else {
        [self.items enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
            RXItemView *itemView = obj;
            itemView.transform = CGAffineTransformIdentity;
            itemView.alpha = 0.4f;
        }];
    }
}

- (void)updateBarItem
{
    CGFloat progress = self.disappearProgress;
    CGFloat internalAnimationFactor = 0.7;
    for (NSInteger i = 0; i < self.items.count; i++) {
        RXItemView *itemView = self.items[i];
        CGFloat startPadding = (1 - internalAnimationFactor) / self.items.count * i;
        CGFloat endPadding = 1 - internalAnimationFactor - startPadding;
        
        if (progress == 1 || progress >= 1 - endPadding) {
            itemView.transform = CGAffineTransformIdentity;
            itemView.alpha = 0.4;
        } else if (progress == 0) {
            [itemView setHorizontalRandomness:self.horizontalRandomness dropHeight:self.dropHeight];
        } else {
            CGFloat realProgress;
            if (progress <= startPadding) {
                realProgress = 0;
            } else {
                realProgress = MIN(1, (progress - startPadding) / internalAnimationFactor);
            }
            itemView.transform = CGAffineTransformMakeTranslation(itemView.translationX*(1-realProgress), -self.dropHeight*(1-realProgress));
            itemView.transform = CGAffineTransformRotate(itemView.transform, M_PI*(realProgress));
            itemView.transform = CGAffineTransformScale(itemView.transform, realProgress, realProgress);
            itemView.alpha = realProgress * 0.4;
        }
        
    }
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll
{

    if (self.scrollView.contentOffset.y > 0) {
        return;
    }
    CGFloat y = fabs(self.scrollView.contentOffset.y);
    
    CGFloat height = self.frame.size.height;
    CGFloat newY = 0;
    if (y < height) {
        newY = -height;
    } else {
        newY = -((y - height) / 2.0f + height);
    }
    CGRect frame = self.frame;
    frame.origin.y = newY;
    self.frame = frame;
    
    if (self.isLoading) {
        // Do Nothing
    } else {
        if (y >= self.dropHeight) {
            if (self.e_RX_RefreshState == kE_RX_RefreshState_Idle) {
                self.disappearProgress = 0;
                [self updateBarItem];
            }
            self.e_RX_RefreshState = kE_RX_RefreshState_Refreshing;
        } else {
            self.e_RX_RefreshState = kE_RX_RefreshState_Idle;
        }
    }
    
}


- (void)scrollViewDidEndDragging
{
    if (self.isLoading) {
        return;
    }
    
    switch (self.e_RX_RefreshState) {
        case kE_RX_RefreshState_Refreshing:
        {
            UIEdgeInsets newInsets;
            newInsets.top = self.dropHeight;
            
            self.isLoading = YES;
            
            [UIView animateWithDuration:0 animations:^(void) {
                self.scrollView.contentInset = newInsets;
            }];
            
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
            
            if ([self.target respondsToSelector:self.action]) {
                [self.target performSelector:self.action withObject:self];
            }
            
#pragma clang diagnostic pop
            
            [self startLoadingAnimation];
            
            
        }
            break;
        case kE_RX_RefreshState_Idle:
        case kE_RX_RefreshState_Disappear:
        default:
            // Do Nothing
            break;
    }
}
- (void)finishingLoading
{
    self.e_RX_RefreshState = kE_RX_RefreshState_Disappear;
    UIEdgeInsets newInsets;
    newInsets.top = 0;
    [UIView animateWithDuration:1.2 animations:^{
        self.scrollView.contentInset = newInsets;
    } completion:^(BOOL finished) {
        self.e_RX_RefreshState = kE_RX_RefreshState_Idle;
        self.isLoading = NO;
        [self.displayLink invalidate];
        self.disappearProgress = 1.0f;
    }];
    
    
    for (RXItemView *itemView in self.items) {
        [itemView.layer removeAllAnimations];
        itemView.alpha = 0.4;
    }
    
    self.displayLink = [CADisplayLink displayLinkWithTarget:self selector:@selector(updateDisappearAnimation)];
    [self.displayLink addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSRunLoopCommonModes];
    self.disappearProgress = 1.0f;
}


#pragma mark - Class Method
+ (id)attachToScrollView:(UIScrollView *)scrollView target:(id)target action:(SEL)action
{
    
    
    
    // EECAR
    NSArray *allAry = @[@"{0,0}:{20,0}",
                        @"{0,0}:{0,25}",
                        @"{0,12.5}:{20,12.5}",
                        @"{0,25}:{20,25}",
                        
                        @"{24,0}:{44,0}",
                        @"{24,0}:{24,25}",
                        @"{24,12.5}:{45,12.5}",
                        @"{24,25}:{44,25}",
                        
                        @"{48,0}:{68,0}",
                        @"{48,0}:{48,25}",
                        @"{48,25}:{68,25}",
                        
                        @"{72,0}:{92,0}",
                        @"{72,0}:{72,25}",
                        @"{72,12.5}:{92,12.5}",
                        @"{91,0}:{91,25}",
                        
                        @"{96,0}:{116,0}",
                        @"{96,0}:{96,25}",
                        @"{114.75,0}:{114.75,12.5}",
                        @"{96,12.5}:{116,12.5}",
                        @"{106,12.5}:{116,25}"
                        ];
    
    NSMutableArray *startPoints = [NSMutableArray array];
    NSMutableArray *endPoints = [NSMutableArray array];
    for (NSString *str in allAry) {
        NSArray *tmpAry = [str componentsSeparatedByString:@":"];
        [startPoints addObject:tmpAry[0]];
        [endPoints addObject:tmpAry[1]];
    }
    
    
    
    
    CGFloat width = 0;
    CGFloat height = 0;
    for (NSInteger i = 0; i < startPoints.count; i++) {
        CGPoint startPoint = CGPointFromString(startPoints[i]);
        CGPoint endPoint = CGPointFromString(endPoints[i]);
        if (startPoint.x > width) width = startPoint.x;
        if (endPoint.x > width) width = endPoint.x;
        if (startPoint.y > height) height = startPoint.y;
        if (endPoint.y > height) height = endPoint.y;
    }
    
    CGRect frame = CGRectMake(0, 0, width, height);
    
    RXRefreshView *refreshView = [[RXRefreshView alloc] init];
    
    refreshView.dropHeight = 80;
    refreshView.horizontalRandomness = 300;
    
    NSMutableArray *ary = [NSMutableArray array];
    for (NSInteger i = 0; i < startPoints.count; i++) {
        CGPoint startPoint = CGPointFromString(startPoints[i]);
        CGPoint endPoint = CGPointFromString(endPoints[i]);
        RXItemView *itemView = [[RXItemView alloc] initWithFrame:frame startPoint:startPoint endPoint:endPoint color:[UIColor whiteColor] lineWidth:2.5];
        itemView.tag = i;
        itemView.backgroundColor = [UIColor clearColor];
        itemView.alpha = 0.4;
        [ary addObject:itemView];
        [refreshView addSubview:itemView];
    }
    
    refreshView.items = ary;
    CGFloat winWidth = [UIScreen mainScreen].bounds.size.width;
    frame.origin.x = (winWidth - width) / 2.0f;
    frame.origin.y = -height;
    refreshView.frame = frame;
    
    refreshView.isLoading = NO;
    refreshView.target = target;
    refreshView.action = action;
    refreshView.backgroundColor = [UIColor clearColor];
    [scrollView addSubview:refreshView];
    
    refreshView.scrollView = scrollView;
    return refreshView;
}










@end
