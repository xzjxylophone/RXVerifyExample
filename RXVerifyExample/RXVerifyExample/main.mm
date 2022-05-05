//
//  main.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/11/12.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "AppDelegate.h"


void test_showPools() {
    NSObject *obj = [[[NSObject alloc] init] autorelease];
    NSLog(@"obj:%@", obj);
    SEL sel = NSSelectorFromString(@"showPools"); // 没有开放此接口,所以使用performSelector
    // NSAutoreleasePool *pool = [NSAutoreleasePool new];
    // [pool performSelector:sel]; // 会出现崩溃
    [NSAutoreleasePool performSelector:sel]; // 能正确的输出
}
// Terminating app due to uncaught exception 'NSInvalidArgumentException', reason: '*** -[NSAutoreleasePool autorelease]: Cannot autorelease an autorelease pool'
void test_autoreleasePool_autorelease() {
    NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
    [pool autorelease];
    [pool drain];
    [pool release];
}

// 此文件已经被标识成禁止ARC了
int main(int argc, char * argv[]) {
//    test_showPools();
//    test_autoreleasePool_autorelease();
    @autoreleasepool {
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}


