//
//  RXMenuView.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/8.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@class RXMenuView;

@protocol RXMenuViewDelegate <NSObject>

- (void)rxMenuView:(RXMenuView *)menu didSelectIndex:(NSInteger)index;


@end


@interface RXMenuView : UIView
- (id)initWithFrame:(CGRect)frame menus:(NSArray *)menus;


@property (nonatomic, weak) id<RXMenuViewDelegate> delegate;


// 是否展开
@property (nonatomic, assign) BOOL isExpand;

@end
