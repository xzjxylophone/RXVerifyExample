//
//  RVPushPopAnimation.m
//  RXVerifyExample
//
//  Created by ceshi on 16/4/19.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVPushPopAnimation.h"

static const float kLGCircleDefaultMaxScale = 15.0f;
static const float kLGCircleDefaultMinScale = 1.0f;
//static const float kLGCircleAnimationTime = 0.5f;   //圆圈遮罩的动画时间
//
//static const float kLGTransitionTime = 0.6f;    //整个呈现动画的时间
//static const float kLGScaleChange = 0.1f;

static NSString *kLGCircleMaskAnimation = @"kLGCircleMaskAnimation";


@interface RVPushPopAnimation ()
@property (nonatomic, strong) UIViewController *fromViewController;
@property (nonatomic, strong) UIViewController *toViewController;
@end

@implementation RVPushPopAnimation


/*
 
 
 UIButton *btn = fromVC.button;
 UIBezierPath *originPath = [UIBezierPath bezierPathWithOvalInRect:btn.frame];
 CGPoint extremePoint = CGPointMake(btn.center.x - 0,CGRectGetHeight(fromVC.view.bounds));
 
 float radius = sqrtf(extremePoint.x * extremePoint.x + extremePoint.y * extremePoint.y);
 UIBezierPath *finalPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(btn.frame, -radius, -radius)];
 
 CAShapeLayer *maskLayer = [CAShapeLayer layer];
 maskLayer.path = finalPath.CGPath;
 toVC.view.layer.mask = maskLayer;
 
 CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
 animation.removedOnCompletion = NO;
 animation.duration = [self transitionDuration:transitionContext];
 animation.delegate = self;
 animation.fromValue = (__bridge id _Nullable)(originPath.CGPath);
 animation.toValue =(__bridge id _Nullable)(finalPath.CGPath);
 
 [maskLayer addAnimation:animation forKey:@"path"];
 
 
 */


#pragma mark - UIViewControllerAnimatedTransitioning

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext
{
    self.fromViewController = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    self.toViewController = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIViewController *fromViewController = self.fromViewController;
    UIViewController *toViewController = self.toViewController;
    
    
    UIView *container = [transitionContext containerView];
    
    
    UIView *toView = toViewController.view;
    UIView *fromView = fromViewController.view;
    
    
    
    CGFloat duration = [self transitionDuration:transitionContext];

    switch (self.ncOperation) {
        case UINavigationControllerOperationPush:
        {
            
            [container addSubview:fromView];
            [container addSubview:toView];
            
            CGRect bounds = CGRectMake(RX_Window_Width - 25 - 37.5, RX_Window_Height - 25 - 37.5, 0, 0);
            toView.frame = bounds;
            [UIView animateWithDuration:duration delay:0 options:0 animations:^{
                toView.frame = CGRectMake(0, 64, RX_Window_Width, RX_Window_Height - 64);
            } completion:^(BOOL finished) { // Let's get rid of the old VC view
                [fromView removeFromSuperview];
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        }
            break;
        case UINavigationControllerOperationPop:
        default:
        {
            
            [container addSubview:toView];
            [container addSubview:fromView];
            [UIView animateWithDuration:duration delay:0 options:0 animations:^{
                CGRect bounds = CGRectMake(RX_Window_Width - 25 - 37.5, RX_Window_Height - 25 - 37.5, 0, 0);
                fromView.frame = bounds;
            } completion:^(BOOL finished) {
                [fromView removeFromSuperview];
                [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
            }];
        }
            break;
    }
}
- (NSTimeInterval)transitionDuration:(id <UIViewControllerContextTransitioning>)transitionContext
{
    return 3;
}
- (void)animationEnded:(BOOL)transitionCompleted
{
    
}


#pragma mark - Constructor And Destructor
- (id)initWithCircleCenter:(CGPoint)circleCenter circleRadius:(CGFloat)circleRadius
{
    if (self = [super init])
    {
        self.maximumCircleScale = kLGCircleDefaultMaxScale;
        self.minimumCircleScale = kLGCircleDefaultMinScale;
        self.circleCenter = circleCenter;
        self.circleRadius = circleRadius;
    }
    return self;
}

@end
