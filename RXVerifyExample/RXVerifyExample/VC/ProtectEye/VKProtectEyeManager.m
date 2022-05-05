//
//  VKProtectEyeManager.m
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/5/22.
//

#import "VKProtectEyeManager.h"
#import "VKProtectEyeView.h"
#import "VKProtectEyeWindow.h"
#import "VKProtectEyeViewController.h"
#import "UIWindow+VKProtectEye.h"
@interface VKProtectEyeManager()
@property (nonatomic, strong) VKProtectEyeView *protectEyeView;


@property (nonatomic, strong) VKProtectEyeWindow *protectEyeWindow;


@property (nonatomic, strong) UIWindow *window;
@end

@implementation VKProtectEyeManager


#pragma mark - Public
- (void)enter {
    // bugtag不支持
    if (![self bugtagAllow]) {
        return;
    }
    // 上次没有开启
    if (![self lastValue]) {
        return;
    }
    // huizhong
    [self addView];
}

- (void)open {
    // bugtag不支持
    if (![self bugtagAllow]) {
        return;
    }
    [self addView];
    // 保存为YES
    [self saveLastValue:YES];
}
- (void)close {
    [self removeView];
    // 保存为NO
    [self saveLastValue:NO];
}
- (void)leave {
    [self removeView];
}

#pragma mark - UserDefault
#define VK_UD_ProtectEye_LastValue @"VK_UD_ProtectEye_LastValue"
- (BOOL)lastValue {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    id value = [ud objectForKey:VK_UD_ProtectEye_LastValue];
    if (value == nil) {
        return NO;
    } else {
        return [value boolValue];
    }
}
- (void)saveLastValue:(BOOL)value {
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    [ud setObject:@(value) forKey:VK_UD_ProtectEye_LastValue];
    [ud synchronize];
}
#pragma mark - Private
// bugtag是否开启了此功能
- (BOOL)bugtagAllow {
    return YES;
}



- (void)addView {
    
    // window 策略
//    [self removeView];
//    self.protectEyeView = [VKProtectEyeView new];
//    self.protectEyeView.frame = CGRectMake(0, 0, 300, 300);
//
//    self.protectEyeWindow = [VKProtectEyeWindow new];
//    self.protectEyeWindow.frame = CGRectMake(0, 0, RX_Window_Width, RX_Window_Height);
//    self.protectEyeWindow.windowLevel = 0;
//    self.protectEyeWindow.hidden = NO;
//
//    [self.protectEyeWindow addSubview:self.protectEyeView];
////    self.protectEyeWindow.rootViewController = [[VKProtectEyeViewController alloc] init];
//
//
//
////    [self.protectEyeWindow makeKeyAndVisible];
//
//    [[self appDelegateWindow] makeKeyAndVisible];
    
    // view 策略
//    [self removeView];
    
    // 已经存在了
    if (self.protectEyeView != nil) {
        return;
    }
    
    [UIWindow vkProtectEye_exchangeAddSubview];
    
    self.protectEyeView = [VKProtectEyeView new];
    self.protectEyeView.frame = CGRectMake(0, 0, RX_Window_Width, RX_Window_Height);

    UIWindow *window = [self appDelegateWindow];
    [window addSubview:self.protectEyeView];
    

//    [self.protectEyeView vk_autoSuperViewTop];
//    [self.protectEyeView vk_autoSuperViewLeft];
//    [self.protectEyeView vk_autoSuperViewBottom];
//    [self.protectEyeView vk_autoSuperViewRight];
}

- (void)showFirst:(UIWindow *)window {
    // 如果没有护眼view,直接结束
    if (self.protectEyeView == nil) {
        return;
    }
    // 如果添加的window不是appdelegate的window,直接结束
    if (window != [self appDelegateWindow]) {
        return;
    }
    [window bringSubviewToFront:self.protectEyeView];
}

- (void)removeView {
    // window 策略
//    [self.protectEyeWindow resignKeyWindow];
//    self.protectEyeWindow.windowLevel = -1000;
//    self.protectEyeWindow.hidden = YES;
//    [self.protectEyeWindow.rootViewController dismissViewControllerAnimated:NO completion:nil];
//    self.protectEyeWindow = nil;
    
    // view 策略
    [self.protectEyeView removeFromSuperview];
    self.protectEyeView = nil;
}
- (UIWindow *)appDelegateWindow {
    id<UIApplicationDelegate> applicationDelegate = [UIApplication sharedApplication].delegate;
    id appDelegate = applicationDelegate;
    SEL sel = NSSelectorFromString(self.windowPropertyNameInAppDelegate);
    UIWindow *result = nil;
    if ([appDelegate respondsToSelector:sel]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        result = (UIWindow *)[appDelegate performSelector:sel];
#pragma clang diagnostic pop
    }
    if (result && [result isKindOfClass:[UIWindow class]]) {
        // 获取到了window
    } else {
        result = [UIApplication sharedApplication].keyWindow;
    }
    return result;
}


#pragma mark - Singleton
+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once (& onceToken, ^ {
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
- (id)init {
    if (self = [super init]) {
        self.windowPropertyNameInAppDelegate = @"window";
    }
    return self;
}
@end
