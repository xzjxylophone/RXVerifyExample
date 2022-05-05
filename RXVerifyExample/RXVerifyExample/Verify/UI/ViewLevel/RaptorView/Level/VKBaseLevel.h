//
//  VKBaseLevel.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/6.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface VKBaseLevel : NSObject
// 一个占位view,frame为zero
@property (nonatomic, readonly) UIView *placeholderView;
// 实际显示的view,不包括占位view
@property (nonatomic, readonly) NSArray *subviews;
// 此层级是否为空
@property (nonatomic, readonly) BOOL empty;
// 需要使用weak,要不然会出现循环引用了
@property (nonatomic, readonly, weak) UIView *superview;
// Need Override, 所有可能的view
@property (nonatomic, readonly) NSArray *possibleSubviews;
- (id)initWithSuperview:(UIView *)superview;
- (void)addSubview:(UIView *)view;
@end

NS_ASSUME_NONNULL_END
