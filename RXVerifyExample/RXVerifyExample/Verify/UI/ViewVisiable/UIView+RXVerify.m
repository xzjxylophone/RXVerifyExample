//
//  UIView+RXVerify.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/18.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "UIView+RXVerify.h"



@implementation UIView (RXVerify)

- (CGFloat)rxv_viewVisiable {
    // 未添加到superview
    if (self.superview == nil) {
        return 0;
    }
    // view 隐藏
    if (self.hidden) {
        return 0;
    }
    UIView *rootView = self;
    while (rootView != nil) {
        UIView *superView = rootView.superview;
        if (superView.hidden) {
            return 0;
        }
        if (superView == nil) {
            break;
        }
        rootView = superView;
    }
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIScrollView *scrollView = nil;
    UIView *pView = self;
    while (pView != nil) {
        if ([pView isKindOfClass:[UIScrollView class]]) {
            scrollView = (UIScrollView *)pView;
            break;
        }
        pView = pView.superview;
    }
    UIView *visiableView = scrollView ? scrollView : window;
    CGRect rect = [visiableView convertRect:self.frame fromView:self.superview];
    if (CGRectIsEmpty(rect) || CGRectIsNull(rect) || CGSizeEqualToSize(rect.size, CGSizeZero)) {
        return 0;
    }
    // 获取 该view与visiableView 交叉的 Rect
    CGRect screenRect = visiableView.bounds;
    CGRect intersectionRect = CGRectIntersection(rect, screenRect);
    if (CGRectIsEmpty(intersectionRect) || CGRectIsNull(intersectionRect)) {
        return 0;
    }
    // 展示面积与实际面积的百分比
    CGFloat dividend = intersectionRect.size.width * intersectionRect.size.height;
    CGFloat divisor = (self.frame.size.width * self.frame.size.height);
    CGFloat showPercent = dividend / divisor;
    return showPercent;
}
@end
