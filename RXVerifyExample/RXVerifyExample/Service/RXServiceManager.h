//
//  RXServiceManager.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/9/12.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

// 为了不影响启动速度,就没有进行线程安全
@interface RXServiceManager : NSObject

// 请保证把一次性把所有的Service加载进去
+ (void)addServiceName:(NSString *)serviceName enable:(BOOL)enable async:(BOOL)async;

// 会根据serviceName判断是否是需要异步执行
+ (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
+ (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions;
// 同步执行
+ (void)executeSelector:(SEL)selector paramArray:(NSArray *)paramArray;
// 同步执行
+ (BOOL)boolReturnExecuteSelector:(SEL)selector paramArray:(NSArray *)paramArray;
// 同步执行
+ (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window;


@end




