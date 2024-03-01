//
//  AppDelegate.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/11/12.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "AppDelegate.h"
#import "XGPush.h"
#import "MainViewController.h"
//#import <RX3_TencentLiteSDK/TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/TencentOAuth.h>

#import "UncaughtExceptionHandler.h"
#import "RXServiceManager.h"
#import "RXTidyMainViewController.h"
#import "RXAutoGenerateManager.h"
#import <UserNotifications/UserNotifications.h>
#import <BUAdSDK/BUAdSDK.h>




/***
* 1. 尽量不要出现有硬编码
* 2. url进行导航
* 3. 面向协议的注册
*
*
*
*
*
*
*
*
*
*
*/


@interface AppDelegate () <UNUserNotificationCenterDelegate>
@property (nonatomic, strong) UINavigationController *mainNC;

@end

@implementation AppDelegate


- (void)config
{
//    [RXServiceManager addServiceName:@"RXCrashService" enable:YES async:YES];
//    [RXServiceManager addServiceName:@"RXJLRoutesService" enable:YES async:NO];
    
    
    
}

- (void)setupBUAdSDK {

#if __has_include(<BUAdTestMeasurement/BUAdTestMeasurement.h>)
    #if DEBUG
        // 测试工具
        [BUAdTestMeasurementConfiguration configuration].debugMode = YES;
    #endif
#endif

    BUAdSDKConfiguration *configuration = [BUAdSDKConfiguration configuration];
    configuration.appID = @"1111";
//    configuration.privacyProvider = [[BUDPrivacyProvider alloc] init];
    configuration.appLogoImage = [UIImage imageNamed:@"AppIcon"];
    configuration.debugLog = @(1);
    
#ifdef IS_MEDIATION
    // 如果使用聚合维度功能，则务必将以下字段设置为YES
    // 并检查工程有引用CSJMediation.framework，这样SDK初始化时将启动聚合相关必要组件
    configuration.useMediation = YES;
    [self useMediationSettings];
#endif
    
    [BUAdSDKManager startWithAsyncCompletionHandler:^(BOOL success, NSError *error) {
        if (success) {
            dispatch_async(dispatch_get_main_queue(), ^{
#ifdef IS_MEDIATION
                // 聚合维度首次预缓存
                [self useMediationPreload];
#endif
//                 splash AD demo
//                [self addSplashAD];
//                 private config for demo
//                [self configDemo];
//                 Setup live stream ad
#if __has_include(<BUAdLive/BUAdLive.h>)
                [BUAdSDKManager setUpLiveAdSDK];
#endif
                
            });
        }
    }];
    
//    [self playerCoustomAudio];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self requestIDFATracking];
    });
}


//- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
//{
//    [super touchesBegan:touches withEvent:event];
//    NSLog(@"touches began in AppDelegate");
//}


- (void)showMain
{
    UIViewController *vc = nil;
    vc = [[MainViewController alloc] init];
//    vc = [RXTidyMainViewController new];
    self.mainNC = [[UINavigationController alloc] initWithRootViewController:vc];
    self.window.rootViewController = self.mainNC;
    
    
    
//    SEL selector = NSSelectorFromString(@"reportForScene:");
//    NSMethodSignature *signature = [vc methodSignatureForSelector:selector];
//
//    char *type = (char *)[signature methodReturnType];
//
//    id tmpResult = [self safe_performSelectWithInstance:vc selectorString:@"reportForScene"];
//    NSLog(@"tmpResult:%@", tmpResult);
}
- (id)safe_performSelectWithInstance:(id)instance selectorString:(NSString *)selectorString {
    return [instance performSelector:NSSelectorFromString(selectorString)];
}

- (void)xxxxxx {
    NSArray *buyAry = @[
                        @"20190408,11.04,1100",
//                        @"20190409,11.25,1700",
                        @"20190410,10.87,2500",
                        @"20190412,10.73,1200",
//                        @"20190418,10.19,2300",
//                        @"20190422,10.05,2400",
                        @"20190423,9.84,1800",
                        @"20190424,10.27,2400",
                        @"20190507,7.11,1400",
                        @"20190510,6.49,3200",
                        @"20190516,6.94,1500",
                        @"20190523,6.77,2600",
                        @"20190528,6.91,3800",
                        @"",
                        @"",
                        @"",
                        @""
                        ];
    NSArray *sellAry = @[
//                        @"20190415,11.03,2100", // 200
//                        @"20190419.10.51,2300",
//                        @"20190423,10.70,2200",
                        @"20190510,6.39,1700",
                        @"20190514,6.91,1500",
                        @"20190523,7.05,2500",
                        @"20190527,6.99,2600",
                        @"20190528,7.01,2600",
                        @"",
                        @"",
                        @"",
                        @"",
                        @""
                        ];
}
#pragma mark - UNUserNotificationCenterDelegate


#define LocalNotiReqIdentifer    @"LocalNotiReqIdentifer"

#pragma mark - Notification
- (void)sendLocalNotification {
    
    NSString *title = @"通知-title";
    NSString *subtitle = @"通知-subtitle";
    NSString *body = @"通知-body";
    NSInteger badge = 1;
    NSInteger timeInteval = 5;
    NSDictionary *userInfo = @{@"id":@"LOCAL_NOTIFY_SCHEDULE_ID"};
    
    if (@available(iOS 10.0, *)) {
        // 1.创建通知内容
        UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
        [content setValue:@(YES) forKeyPath:@"shouldAlwaysAlertWhileAppIsForeground"];
        content.sound = [UNNotificationSound defaultSound];
        content.title = title;
        content.subtitle = subtitle;
        content.body = body;
        content.badge = @(badge);

        content.userInfo = userInfo;

        // 2.设置通知附件内容
        NSError *error = nil;
        NSString *path = [[NSBundle mainBundle] pathForResource:@"logo_img_02@2x" ofType:@"png"];
        UNNotificationAttachment *att = [UNNotificationAttachment attachmentWithIdentifier:@"att1" URL:[NSURL fileURLWithPath:path] options:nil error:&error];
        if (error) {
            NSLog(@"attachment error %@", error);
        }
        content.attachments = @[att];
        content.launchImageName = @"icon_certification_status1@2x";
        // 2.设置声音
        UNNotificationSound *sound = [UNNotificationSound soundNamed:@"sound01.wav"];// [UNNotificationSound defaultSound];
        content.sound = sound;

        // 3.触发模式
        UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:timeInteval repeats:NO];

        // 4.设置UNNotificationRequest
        UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:LocalNotiReqIdentifer content:content trigger:trigger];

        // 5.把通知加到UNUserNotificationCenter, 到指定触发点会被触发
        [[UNUserNotificationCenter currentNotificationCenter] addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        }];

    } else {
    
        UILocalNotification *localNotification = [[UILocalNotification alloc] init];
        
        // 1.设置触发时间（如果要立即触发，无需设置）
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
        
        // 2.设置通知标题
        localNotification.alertBody = title;
        
        // 3.设置通知动作按钮的标题
        localNotification.alertAction = @"查看";
        
        // 4.设置提醒的声音
        localNotification.soundName = @"sound01.wav";// UILocalNotificationDefaultSoundName;
        
        // 5.设置通知的 传递的userInfo
        localNotification.userInfo = userInfo;
        
        // 6.在规定的日期触发通知
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
        // 6.立即触发一个通知
//        [[UIApplication sharedApplication] presentLocalNotificationNow:localNotification];
    }
}

//作者：QiShare
//链接：https://juejin.im/post/5b926847f265da0af2134b3b
//来源：掘金
//著作权归作者所有。商业转载请联系作者获得授权，非商业转载请注明出处。
- (void)xzj_notification {
//    NSString *deviceName = [UIDevice currentDevice].name;
//    if ([deviceName isEqualToString:@"Rush.D.xzj"]) {
////        [self registLocalNotification];
////        [self registerNotification:5];
//        
//        [self sendLocalNotification];
//    }
}


#pragma mark - UIApplicationDelegate
- (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
//    NSMutableArray *ary = [NSMutableArray new];
//    [ary removeObjectAtIndex:0];
    
//    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:nil];
//    NSString *str = @"\"OneV\", \"TwoV\", \"ThreeV\"";
//    NSArray *ary = [str componentsSeparatedByString:@","];
//    NSLog(@"%@", ary);
    // third part 第三方初始化
    
//    NSString *str = @"a&bbbbbbbbbbbbbb&cc&dd&ddd&";
//    NSRange rang = [str rangeOfString:@"&"];
//    NSLog(@"range");
    
//    [self config];
//    [RXServiceManager application:application willFinishLaunchingWithOptions:launchOptions];
    
    [RXAutoGenerateManager generate];
    return YES;
}

static NSMapTable *mapTable;
- (void)test {
    
//    if (mapTable == nil) {
//        mapTable = [NSMapTable mapTableWithKeyOptions:NSMapTableWeakMemory valueOptions:NSMapTableWeakMemory];
//    }
//
//    for (NSInteger i = 0; i < 1000; i++) {
//        dispatch_async(dispatch_get_global_queue(0, 0), ^{
//            int tmpA = arc4random() % 10000;
//            BOOL tmp = tmpA % 2 == 0;
//            NSString *tmpStr = [NSString stringWithFormat:@"%@", @(tmpA)];
//            if (tmp) {
//                NSLog(@"addd:%@", [NSThread currentThread]);
//                [mapTable setObject:tmpStr forKey:tmpStr];
//            } else {
//                NSLog(@"remove:%@", [NSThread currentThread]);
//                [mapTable removeAllObjects];
//            }
//        });
//
//    }
//    NSMutableArray *ary = [NSMutableArray new];// 里面有10个并行queue
//    for (int i = 0; i < 10; i++) {
//        NSString *str = [NSString stringWithFormat:@"com.%ld.abc", (long)i];
//        dispatch_queue_t queue = dispatch_queue_create([str UTF8String], DISPATCH_QUEUE_CONCURRENT);
//        [ary addObject:queue];
//    }
//    
//    NSArray *queueAry = ary;
    
//    dispatch_queue_t serialQueue = dispatch_queue_create("com.serial.queue", DISPATCH_QUEUE_SERIAL);
//    for (dispatch_queue_t queue in ary) {
//        dispatch_set_target_queue(queue, serialQueue);
//    }
    
    
    
    
    
//    for (int i  = 0; i < 10; i++) {
//        dispatch_async(queueAry[i], ^{
//            int random = arc4random() % 10000;
//            NSLog(@"aaaaaaaa:i:%ld--random:%ld", (long)i, (long)random);
//            if (random % 2 == 0) {
//                NSLog(@"aaaaaaaa:i:%ld--random:%ld (2==0)", (long)i, (long)random);
//            }
//        });
//    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
//    [RXServiceManager application:application didFinishLaunchingWithOptions:launchOptions];
//    [self xzj_notification];
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    [self showMain];
    [self.window makeKeyAndVisible];
//    [self test];
    
    [self setupBUAdSDK];
    
    return YES;
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
//    [RXServiceManager executeSelector:_cmd paramArray:@[application]];
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


//- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
//    NSArray *paramArray = @[application,
//                            url ? url : [NSNull null],
//                            sourceApplication ? sourceApplication : [NSNull null],
//                            annotation ? annotation : [NSNull null]];
//    return [RXServiceManager boolReturnExecuteSelector:_cmd paramArray:paramArray];
//}

//- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {

//    NSArray *paramArray = @[application,
//                            url ? url : [NSNull null]];
//    return [RXServiceManager boolReturnExecuteSelector:_cmd paramArray:paramArray];
//}
//- (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window {
//    return [RXServiceManager application:application supportedInterfaceOrientationsForWindow:window];
//}

@end
