//
//  RXCrashService.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/9/12.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXCrashService.h"
#import "UncaughtExceptionHandler.h"

@implementation RXCrashService

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSLog(@"initialization RXCrashService");
    [UncaughtExceptionHandler installUncaughtExceptionHandler:YES showAlert:YES];
    return YES;
}
@end
