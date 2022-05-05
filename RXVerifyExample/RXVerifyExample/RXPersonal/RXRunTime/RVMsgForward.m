//
//  RVMsgForward.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/9.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RVMsgForward.h"
#import "RVMsgForwardProxy.h"
#import <objc/runtime.h>
void test2() {
    NSLog(@"RVMsgForward test");
}

@implementation RVMsgForward

+ (BOOL)resolveClassMethod:(SEL)sel
{
    NSLog(@"%@--------%@", NSStringFromSelector(_cmd), NSStringFromSelector(sel));
    return NO;
}
+ (BOOL)resolveInstanceMethod:(SEL)sel
{
    NSLog(@"%@--------%@", NSStringFromSelector(_cmd), NSStringFromSelector(sel));
//    class_addMethod([self class], sel, (IMP)test2, "v@");
    return NO;
}







- (id)forwardingTargetForSelector:(SEL)aSelector {
    NSLog(@"%@--------%@", NSStringFromSelector(_cmd), NSStringFromSelector(aSelector));
//    return [RVMsgForwardProxy new];
    
    return objc_getMetaClass("RVMsgForwardProxy");
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector {
    NSLog(@"%@--------%@", NSStringFromSelector(_cmd), NSStringFromSelector(aSelector));
    return nil;
}

- (void)forwardInvocation:(NSInvocation *)anInvocation
{
    NSLog(@"%@--------%@", NSStringFromSelector(_cmd), anInvocation);
}

@end
