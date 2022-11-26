//
//  RXUIAnimationViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/9/28.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXUIAnimationViewController.h"
#import "UIView+RXUtility.h"
@interface UIHitView : UIView

@end

@implementation UIHitView

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    return nil;
    return [super hitTest:point withEvent:event];
}

@end


@interface RXUIAnimationViewController ()

@property (nonatomic, strong) UIView *animationView;

@property (nonatomic, assign) BOOL expand;

@end

@implementation RXUIAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // https://blog.csdn.net/yang2735/article/details/39008381
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self test2];
    [self test3];
}

- (void)test3 {
    UIView *view1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 300, 300)];
    view1.backgroundColor = [UIColor redColor];
    [view1 rx_addGestureRecognizerWithTarget:self action:@selector(view1Action)];
    
    UIHitView *view2 = [[UIHitView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    view2.backgroundColor = [UIColor greenColor];
    
    [view1 addSubview:view2];
    [self.view addSubview:view1];
}

- (void)view1Action {
    NSLog(@"11111111");
}
/**
 animationBorderWidth = 0;
 animationDelay = "0.5";
 animationDirection = normal;
 animationDuration = "1.299999952316284";
 animationEffectWidth = 50;
 animationFadeEnd = 0;
 animationFadeStart = 0;
 animationFillMode = both;
 animationInterval = 1;
 animationIterationCount = 0;
 animationRippleBackgroundColor = "";
 animationRotate = 1;
 animationScaleDirection = center;
 animationScaleX = 0;
 animationScaleY = 0;
 animationStretch = 0;
 animationStretchDirection = center;
 animationSwing = 1;
 animationTimeFunction = linear;
 animationTranslateX = 0;
 animationTranslateY = 0;
 animationType = shine;
 
 */

- (void)test2 {
    UIView *animationView = [UIView new];
    animationView.frame = CGRectMake(100, 100, 82, 45.4);
    animationView.backgroundColor = [UIColor redColor];
    
    
    CGFloat BUScreenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat animationEffectWidth = 50;
    CGFloat animationDuration = 1.3;
    CGFloat animationInterval = 1;
    CGFloat animationIterationCount = 0;
    CGFloat animationDelay = 0.5;
    
    
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    NSArray *alphaColorArray = @[@(0), @(0.25), @(0.3), @(0.25), @(0)];
    NSMutableArray *colorsArray = [NSMutableArray array];
    for (NSNumber *alphaValue in alphaColorArray) {
        [colorsArray addObject:(__bridge id)[UIColor colorWithWhite:1.0 alpha:[alphaValue floatValue]].CGColor];
    }
    gradientLayer.colors = colorsArray;
    gradientLayer.locations = @[@0, @0.3, @0.5, @0.7, @1.0];
    gradientLayer.startPoint = CGPointMake(0, 0.5);
    gradientLayer.endPoint = CGPointMake(1, 0.5);
    gradientLayer.frame = CGRectMake(0, -400, animationEffectWidth, 800);
    
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.fromValue = [NSNumber numberWithFloat:0.f];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI/4];
    [rotationAnimation setBeginTime:0];
    rotationAnimation.duration = 0;
    rotationAnimation.fillMode = kCAFillModeForwards;
    rotationAnimation.removedOnCompletion = NO;
    
    CABasicAnimation *translateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation"];
    translateAnimation.duration = animationDuration;
    translateAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(BUScreenWidth, 0)];
    translateAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(-BUScreenWidth, 0)];
    translateAnimation.fillMode = kCAFillModeForwards;
    translateAnimation.removedOnCompletion = NO;
    translateAnimation.repeatCount = 1;
    translateAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];;
    
//    switch (animationModel.dynamicAnimationDirection) {
//        case BUDynamicAnimationDirection_Normal:
            translateAnimation.autoreverses = NO;
            translateAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(-BUScreenWidth, 0)];
            translateAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(BUScreenWidth, 0)];
//            break;
//        case BUDynamicAnimationType_Reverse:
//            translateAnimation.autoreverses = NO;
//            translateAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(BUScreenWidth, 0)];
//            translateAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(-BUScreenWidth, 0)];
//            break;
//        case BUDynamicAnimationType_Alternate:
//            translateAnimation.autoreverses = YES;
//            translateAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(-BUScreenWidth, 0)];
//            translateAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(BUScreenWidth, 0)];
//            break;
//        case BUDynamicAnimationType_AlternateReverse:
//            translateAnimation.autoreverses = YES;
//            translateAnimation.fromValue = [NSValue valueWithCGPoint:CGPointMake(BUScreenWidth, 0)];
//            translateAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(-BUScreenWidth, 0)];
//            break;
//        case BUDynamicAnimationDirection_None:
//        default:
//            break;
//    }
    
    NSArray *animationArray = [NSArray arrayWithObjects:rotationAnimation,translateAnimation, nil];
    CAAnimationGroup *groupAnimation = [CAAnimationGroup animation];
    groupAnimation.animations = animationArray;
    [groupAnimation setBeginTime:CACurrentMediaTime() + animationDelay];
    groupAnimation.duration = animationDuration + animationInterval;
    groupAnimation.repeatCount = animationIterationCount == 0 ? INFINITY : animationIterationCount;
    groupAnimation.fillMode = kCAFillModeForwards;
    groupAnimation.removedOnCompletion = NO;
    [gradientLayer addAnimation:groupAnimation forKey:nil];
    
    [animationView.layer insertSublayer:gradientLayer atIndex:0];
    
    [self.view addSubview:animationView];
}









- (void)test1 {
    
    self.animationView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
    self.animationView.backgroundColor = [UIColor redColor];
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
    v1.backgroundColor = [UIColor greenColor];
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 150, 100)];
    v2.backgroundColor = [UIColor blueColor];
    
    [self.animationView addSubview:v1];
    [self.animationView addSubview:v2];
    self.animationView.clipsToBounds = YES;
    
    
    [self.view rx_addGestureRecognizerWithTarget:self action:@selector(viewAction)];
    [self.view addSubview:self.animationView];
}


- (void)viewAction {
    self.expand = !self.expand;
}

- (void)setExpand:(BOOL)expand {
    _expand = expand;
    
    if (expand) {
        [UIView animateWithDuration:1 animations:^{
            self.animationView.rx_top = 200;
            self.animationView.rx_height = 200;
        } completion:^(BOOL finished) {
            
        }];
    } else {
        
        [UIView animateWithDuration:1 animations:^{
            self.animationView.rx_top = 300;
            self.animationView.rx_height = 100;
        } completion:^(BOOL finished) {
            
        }];
        
    }
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
