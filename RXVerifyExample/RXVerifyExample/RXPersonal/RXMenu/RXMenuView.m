//
//  RXMenuView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/8.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXMenuView.h"
#import "RXMenuItemView.h"


#define k_CS_RX_TagOffset       1000
#define k_CS_RX_TimeInterval            0.026f
//#define k_CS_RX_TimeInterval            1.0f

@interface RXMenuView ()<RXMenuItemViewDelegate>

@property (nonatomic, strong) NSArray *aryMenu;
@property (nonatomic, strong) RXMenuItemView *addMenuItemView;
@property (nonatomic, assign) NSInteger animationIndex;
@property (nonatomic, strong) NSTimer *timer;

@end



@implementation RXMenuView


#pragma mark - Property
- (void)setIsExpand:(BOOL)isExpand
{
    if (_isExpand == isExpand) {
        return;
    }
    _isExpand = isExpand;
    
    float angle = self.isExpand ? -M_PI_4 : 0.0f;
    [UIView animateWithDuration:0.2f animations:^{
        self.addMenuItemView.transform = CGAffineTransformMakeRotation(angle);
    }];
    
    if (self.timer == nil) {
        NSLog(@"定时器不存在,创建");
        self.animationIndex = isExpand ? 0 : self.aryMenu.count - 1;
        SEL selector = isExpand ? @selector(expandAction) : @selector(closeAction);
        self.timer = [NSTimer scheduledTimerWithTimeInterval:k_CS_RX_TimeInterval target:self selector:selector userInfo:nil repeats:YES];
    } else {
        NSLog(@"定时器存在,忽略");
    }
}

#pragma mark - Private
- (void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - Timer Action   add btn action
- (void)expandAction
{
    if (self.animationIndex == self.aryMenu.count) {
        [self stopTimer];
        NSLog(@"全部打开销毁定时器");
        return;
    }
    NSInteger tag = k_CS_RX_TagOffset + self.animationIndex;
    NSLog(@"index:%zd", self.animationIndex);
    RXMenuItemView *item = (RXMenuItemView *)[self viewWithTag:tag];
    
    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.values = @[@(M_PI), @(0.0f)];
    rotateAnimation.duration = 0;
    rotateAnimation.keyTimes = @[@(0.3f), @(0.4f)];
    
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.duration = 0;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, item.startPoint.x, item.startPoint.y);
    CGPathAddLineToPoint(path, NULL, item.farPoint.x, item.farPoint.y);
    CGPathAddLineToPoint(path, NULL, item.nearPoint.x, item.nearPoint.y);
    CGPathAddLineToPoint(path, NULL, item.endPoint.x, item.endPoint.y);
    positionAnimation.path = path;
    CGPathRelease(path);
    
    CGFloat duration = 0.5f;
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.duration = duration;
    animationGroup.animations = @[positionAnimation, rotateAnimation];
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [item.layer addAnimation:animationGroup forKey:@"Expand"];
    item.center = item.endPoint;
    
    self.animationIndex++;
}
- (void)closeAction
{
    if (self.animationIndex == -1) {
        [self stopTimer];
        NSLog(@"全部关闭销毁定时器");
        return;
    }
    
    NSInteger tag = k_CS_RX_TagOffset + self.animationIndex;
    RXMenuItemView *item = (RXMenuItemView *)[self viewWithTag:tag];
    
    CAKeyframeAnimation *rotateAnimation = [CAKeyframeAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotateAnimation.values = @[@(0.0f), @(M_PI * 2), @(0.0f)];
    rotateAnimation.duration = 0;
    rotateAnimation.keyTimes = @[@(0.0f), @(0.4f), @(0.5f)];
    
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.duration = 0;
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, item.endPoint.x, item.endPoint.y);
    CGPathAddLineToPoint(path, NULL, item.farPoint.x, item.farPoint.y);
    CGPathAddLineToPoint(path, NULL, item.startPoint.x, item.startPoint.y);
    positionAnimation.path = path;
    CGPathRelease(path);
    
    
    CGFloat duration = 0.5f;
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[positionAnimation, rotateAnimation];
    animationGroup.duration = duration;
    animationGroup.fillMode = kCAFillModeForwards;
    animationGroup.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    [item.layer addAnimation:animationGroup forKey:@"Close"];
    
    item.center = item.startPoint;
    self.animationIndex--;
}

#pragma mark - Other Btn Animation


- (CAAnimationGroup *)animationGroupAtPoint:(CGPoint)point withScale:(CGFloat)scale
{
    CAKeyframeAnimation *positionAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnimation.values = @[[NSValue valueWithCGPoint:point]];
    positionAnimation.keyTimes = @[@(0.3f)];
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform"];
    scaleAnimation.fromValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 1)];
    scaleAnimation.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeScale(scale, scale, 1)];
    
    CABasicAnimation *opacityAnimation = [CABasicAnimation animationWithKeyPath:@"opacity"];
    opacityAnimation.toValue = @(0.0f);
    
    CAAnimationGroup *animationGroup = [CAAnimationGroup animation];
    animationGroup.animations = @[positionAnimation, scaleAnimation, opacityAnimation];
    animationGroup.duration = 0.3f;
    animationGroup.fillMode = kCAFillModeForwards;
    return animationGroup;
}


#pragma mark - RXMenuItemViewDelegate


- (void)rxMenuItemViewTouchesBegan:(RXMenuItemView *)item
{
    if (item == self.addMenuItemView) {
        self.isExpand = !self.isExpand;
    }
}
- (void)rxMenuItemViewTouchesEnd:(RXMenuItemView *)item
{
    if (item == self.addMenuItemView) {
        // 加号按钮
        return;
    } else {
        // 其他按钮
        
        _isExpand = NO;
        float angle = 0.0f;
        __weak __typeof(self) weakSelf = self;
        [UIView animateWithDuration:0.2f animations:^{
            weakSelf.addMenuItemView.transform = CGAffineTransformMakeRotation(angle);
        }];
        for (int i = 0; i < self.aryMenu.count; i++) {
            RXMenuItemView *itemView = self.aryMenu[i];
            CGFloat scale = 0;
            if (itemView.tag == item.tag) {
                scale = 3;
            } else {
                scale = 0.01;
            }
            CAAnimationGroup *animationGroup = [self animationGroupAtPoint:itemView.center withScale:scale];
            [itemView.layer addAnimation:animationGroup forKey:@"animationGroup"];
            itemView.center = itemView.startPoint;
        }
        [self.delegate rxMenuView:self didSelectIndex:(item.tag - k_CS_RX_TagOffset)];
        
    }
}



#pragma mark - Constructor And Destructor
- (id)initWithFrame:(CGRect)frame menus:(NSArray *)menus
{
    if (self = [super initWithFrame:frame]) {
        self.aryMenu = menus;
        
        CGPoint startPoint = CGPointMake(50, 430);
        CGFloat nearRadius = 130.0f;
        CGFloat endRadius = 140.0f;
        CGFloat farRadius = 160.0f;
        NSInteger count = menus.count;
        for (NSInteger i = 0; i < menus.count; i++) {
            RXMenuItemView *item = menus[i];
            item.startPoint = startPoint;
            CGFloat angle = i * M_PI_2 / (count - 1);
            item.endPoint = CGPointMake(startPoint.x + endRadius * sinf(angle), startPoint.y - endRadius * cosf(angle));
            item.nearPoint = CGPointMake(startPoint.x + nearRadius * sinf(angle), startPoint.y - nearRadius * cosf(angle));
            item.farPoint = CGPointMake(startPoint.x + farRadius * sinf(angle), startPoint.y - farRadius * cosf(angle));
            item.center = item.startPoint;
            item.delegate = self;
            item.tag = k_CS_RX_TagOffset + i;
            if (i >= 1) {
//                item.hidden = YES;
            }
            [self addSubview:item];
        }
        
        
        self.addMenuItemView = [[RXMenuItemView alloc] initWithImage:[UIImage imageNamed:@"bg_addbtn"] highlightedImage:[UIImage imageNamed:@"bg_addbtn_h"] contentImage:[UIImage imageNamed:@"icon_plus"] highlightedContentImage:[UIImage imageNamed:@"icon_plus_h"]];
        self.addMenuItemView.center = startPoint;
        self.addMenuItemView.delegate = self;
        
        
        _isExpand = NO;
        
        [self addSubview:self.addMenuItemView];
    }
    return self;
}


@end
