//
//  RXRefreshView.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/9.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RXRefreshView : UIView
+ (id)attachToScrollView:(UIScrollView *)scrollView target:(id)target action:(SEL)action;


#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll;
- (void)scrollViewDidEndDragging;
- (void)finishingLoading;


@end
