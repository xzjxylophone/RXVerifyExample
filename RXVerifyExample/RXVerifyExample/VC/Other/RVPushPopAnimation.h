//
//  RVPushPopAnimation.h
//  RXVerifyExample
//
//  Created by ceshi on 16/4/19.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RVPushPopAnimation : NSObject <UIViewControllerAnimatedTransitioning>

- (id)initWithCircleCenter:(CGPoint)circleCenter circleRadius:(CGFloat)circleRadius;

@property (nonatomic, assign)   UINavigationControllerOperation ncOperation;
@property (nonatomic, assign)   CGFloat maximumCircleScale;
@property (nonatomic, assign)   CGFloat minimumCircleScale;
@property (nonatomic, assign)   CGPoint circleCenter;
@property (nonatomic, assign)   CGFloat circleRadius;
@end
