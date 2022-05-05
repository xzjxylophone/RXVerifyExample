//
//  KSAdCountdownView.h
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/8/12.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@interface KSAdCountdownView : UIView


// 多长时间后可以关闭，单位秒， default=5
@property (nonatomic, assign, readonly) NSInteger timeInterval;

+ (instancetype)defaultView;
+ (instancetype)defaultViewWithTimeInterval:(NSInteger)timeInterval;


@property (nonatomic, copy) void(^clickCloseBlock)(void);

#pragma mark - Public
- (void)start;

@end

NS_ASSUME_NONNULL_END
