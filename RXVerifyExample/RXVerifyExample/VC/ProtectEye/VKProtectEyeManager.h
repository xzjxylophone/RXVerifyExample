//
//  VKProtectEyeManager.h
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/5/22.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VKProtectEyeManager : NSObject

// default = @"window"
@property (nonatomic, copy) NSString *windowPropertyNameInAppDelegate;


#pragma mark - Public
// 进入教室的时候
- (void)enter;
// 用户开启护眼模式
- (void)open;
// 用户关闭护眼模式
- (void)close;
// 离开教室的时候
- (void)leave;

- (void)showFirst:(UIWindow *)window;

#pragma mark - Singleton
+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
