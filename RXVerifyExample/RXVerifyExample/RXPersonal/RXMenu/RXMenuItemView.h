//
//  RXMenuItemView.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/8.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>


@class RXMenuItemView;

@protocol RXMenuItemViewDelegate <NSObject>

- (void)rxMenuItemViewTouchesBegan:(RXMenuItemView *)item;
- (void)rxMenuItemViewTouchesEnd:(RXMenuItemView *)item;

@end


@interface RXMenuItemView : UIImageView




@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint endPoint;
@property (nonatomic, assign) CGPoint nearPoint;
@property (nonatomic, assign) CGPoint farPoint;




- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage contentImage:(UIImage *)contentImage highlightedContentImage:(UIImage *)highlightedContentImage;

@property (nonatomic, weak) id<RXMenuItemViewDelegate> delegate;


@end
