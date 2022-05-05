//
//  RXMultThreadView.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2020/9/4.
//  Copyright © 2020 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@class RXMultThreadView;

@protocol RXMultThreadViewLoadDelegate <NSObject>

- (void)multThreadViewWillRender:(RXMultThreadView *)multThreadView;
- (void)multThreadViewDidRender:(RXMultThreadView *)multThreadView;

@end

@interface RXMultThreadView : UIView
- (void)render_really;
@property (nonatomic, assign) NSInteger renderIndex;
@property (nonatomic, weak) id<RXMultThreadViewLoadDelegate> loadDelegate;
@end

NS_ASSUME_NONNULL_END
