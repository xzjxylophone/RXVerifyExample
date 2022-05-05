//
//  RXEventListCategory.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/7.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXEventListCategory.h"
#import "RXRuntimeUtil.h"
@implementation UIResponder (RXEventList)
//+ (void)initialize
//{
////    NSLog(@"cls :%@ initialize in UIResponder", NSStringFromClass([self class]));
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        [RXRuntimeUtil exchangeMethodSafely:[self class] originSel:@selector(touchesBegan:withEvent:) newSel:@selector(rx_swizzle_touchesBegan:withEvent:)];
//    });
//}
//
//- (void)rx_swizzle_touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"UIResponder touchBegin");
//    [self rx_swizzle_touchesBegan:touches withEvent:event];
//}

@end

@implementation AppDelegate (RXEventList)
//+ (void)initialize
//{
////    NSLog(@"cls :%@ initialize in UIResponder", NSStringFromClass([self class]));
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        [RXRuntimeUtil exchangeMethodSafely:[self class] originSel:@selector(touchesBegan:withEvent:) newSel:@selector(rx_swizzle_touchesBegan:withEvent:)];
//    });
//
//}
//- (void)rx_swizzle_touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
////    NSLog(@"AppDelegate touchBegin");
//    [self rx_swizzle_touchesBegan:touches withEvent:event];
//}
@end


@implementation UIApplication (RXEventList)
//+ (void)initialize
//{
////    NSLog(@"cls :%@ initialize in UIApplication", NSStringFromClass([self class]));
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        [RXRuntimeUtil exchangeMethodSafely:[self class] originSel:@selector(touchesBegan:withEvent:) newSel:@selector(rx_swizzle_touchesBegan:withEvent:)];
//    });
//}
//
//- (void)rx_swizzle_touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"UIApplication touchBegin");
//    [self rx_swizzle_touchesBegan:touches withEvent:event];
//}
@end


@implementation UIViewController (RXEventList)
//+ (void)initialize
//{
////    NSLog(@"cls :%@ initialize in UIViewController", NSStringFromClass([self class]));
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//
//    });
//}
//- (void)rx_swizzle_touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
////    NSLog(@"UIViewController touchBegin");
//    [self rx_swizzle_touchesBegan:touches withEvent:event];
//}
@end

@implementation UIView (RXEventList)
//+ (void)initialize
//{
////    NSLog(@"cls :%@ initialize in UIView", NSStringFromClass([self class]));
//    static dispatch_once_t onceToken;
//    dispatch_once(&onceToken, ^{
//        [RXRuntimeUtil exchangeMethodSafely:[self class] originSel:@selector(touchesBegan:withEvent:) newSel:@selector(rx_swizzle_touchesBegan:withEvent:)];
//    });
//}
//- (void)rx_swizzle_touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    NSLog(@"UIView touchBegin");
//    [self rx_swizzle_touchesBegan:touches withEvent:event];
//}

@end
