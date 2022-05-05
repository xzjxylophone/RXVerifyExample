//
//  UIView+Frame.h
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Frame)
// shortcuts for frame properties
@property (nonatomic, assign) CGPoint origin;
@property (nonatomic, assign) CGSize size;

// shortcuts for positions
@property (nonatomic) CGFloat centerX;
@property (nonatomic) CGFloat centerY;


@property (nonatomic) CGFloat top;
@property (nonatomic) CGFloat bottom;
@property (nonatomic) CGFloat right;
@property (nonatomic) CGFloat left;

@property (nonatomic) CGFloat width;
@property (nonatomic) CGFloat height;
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;

@end

@interface UIView (VK_Attach)

/**
 *  加载在某个view上，与父视图大小一致
 *
 *  @param view 父试图
 */
- (void)vk_attach:(UIView *)view;

+ (id)vk_loadNibView;

+ (instancetype)vk_loadNibViewFromBundle:(NSBundle *)bundle;

- (void)removeAllSubviews;
- (id)userObject;
- (void)setUserObject:(NSObject *)userObject;
- (UIImage *)screenShots;
- (void)makeRoundCorner:(float)radius withClip:(BOOL)clip;
- (void)makeBorder:(UIColor*)color withWidth:(float)width;
- (void)makeShadow:(CGSize)offset withColor:(UIColor*)color withRadius:(float)radius;

- (void)vk_deactiveAllConstraints;

/**
 *  获取当前UIVIEW 所在的UIViewController
 *
 *  @return UIViewController
 */
- (UIViewController *)viewController;

@end


@interface UIView (VKAddTapGestureRecognizer)
+ (void)addTapGestureRecognizerTo:(UIView *)view withTarget:(id)target action:(SEL)selector;

- (void)vk_addTapWithTarget:(id)target action:(SEL)selector;

- (void)vk_addTapWithBlock:(void(^)(void))aBlock;
@end


@interface UIView (VKRound)

/**
 *  设置View的圆角弧度、边框宽度、边框颜色
 *
 *  @param radius      弧度
 *  @param borderWidth 边框宽度
 *  @param borderColor 边框颜色
 */
- (void)vk_setRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;
/**
 *  设置远角弧度
 *
 *  @param radius 弧度
 */
- (void)vk_setRadius:(CGFloat)radius;

- (void)vk_setBezierPathRadius:(CGFloat)radius;

/**
 * 任意位置设置圆角
 * @param corners 任意位置圆角 eg. (UIRectCornerTopLeft | UIRectCornerBottomRight) 表示左上和右下圆角 其他仍直角
 * @param cornerRadii 圆角弧度大小
 */
- (void)vk_setCornerByRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;

@end


@interface NSLayoutConstraint (VK_AutoLayout)

- (void)vk_autoAddConstraint NS_AVAILABLE(10_10, 8_0);
- (void)vk_autoRemoveConstraint NS_AVAILABLE(10_10, 8_0);
@end

@interface UIView (VK_AutoLayout)

@property (nonatomic, strong) NSLayoutConstraint *heightLayoutConstraint;
@property (nonatomic, strong) NSLayoutConstraint *widthLayoutConstraint;

@property (nonatomic, strong) NSLayoutConstraint *topLayoutConstraint;
@property (nonatomic, strong) NSLayoutConstraint *leftLayoutConstraint;
@property (nonatomic, strong) NSLayoutConstraint *bottomLayoutConstraint;
@property (nonatomic, strong) NSLayoutConstraint *rightLayoutConstraint;

// height
- (NSLayoutConstraint *)vk_constraintHeight:(CGFloat)aHeight;
- (NSLayoutConstraint *)vk_constraintHeightEqualToView:(UIView *)aView;

// width
- (NSLayoutConstraint *)vk_constraintWidth:(CGFloat)width;
- (NSLayoutConstraint *)vk_constraintWidthEqualToView:(UIView *)aView;

// center
- (NSLayoutConstraint *)vk_constraintCenterXEqualToView:(UIView *)aView;
- (NSLayoutConstraint *)vk_constraintCenterYEqualToView:(UIView *)aView;

// top, bottom, left, right
- (NSLayoutConstraint *)vk_constraintsTop:(CGFloat)top FromView:(UIView *)aView;
- (NSLayoutConstraint *)vk_constraintsBottom:(CGFloat)bottom FromView:(UIView *)aView;
- (NSLayoutConstraint *)vk_constraintsLeft:(CGFloat)left FromView:(UIView *)aView;
- (NSLayoutConstraint *)vk_constraintsRight:(CGFloat)right FromView:(UIView *)aView;

- (NSLayoutConstraint *)vk_constraintTopEqualToView:(UIView *)aView;
- (NSLayoutConstraint *)vk_constraintBottomEqualToView:(UIView *)aView;
- (NSLayoutConstraint *)vk_constraintLeftEqualToView:(UIView *)aView;
- (NSLayoutConstraint *)vk_constraintRightEqualToView:(UIView *)aView;

// size
- (NSArray *)vk_constraintsSize:(CGSize)aSize;
- (NSArray *)vk_constraintsSizeEqualToView:(UIView *)aView;




#pragma mark - SuperView
- (NSLayoutConstraint *)vk_autoSuperViewLeft;
- (NSLayoutConstraint *)vk_autoSuperViewTop;
- (NSLayoutConstraint *)vk_autoSuperViewRight;
- (NSLayoutConstraint *)vk_autoSuperViewBottom;
- (NSLayoutConstraint *)vk_autoSuperViewCenterX;
- (NSLayoutConstraint *)vk_autoSuperViewCenterY;
- (NSLayoutConstraint *)vk_autoSuperViewWidth;
- (NSLayoutConstraint *)vk_autoSuperViewHeight;

- (NSLayoutConstraint *)vk_autoSuperViewAttribute:(NSLayoutAttribute)attribute;
- (NSLayoutConstraint *)vk_autoSuperViewAttribute:(NSLayoutAttribute)attribute constant:(CGFloat)constant;
- (NSLayoutConstraint *)vk_autoSuperViewAttribute:(NSLayoutAttribute)attribute constant:(CGFloat)constant relation:(NSLayoutRelation)relation;
- (NSArray<NSLayoutConstraint *> *)vk_autoEdgesToSuperviewEdges;
- (NSArray<NSLayoutConstraint *> *)vk_autoEdgesToSuperviewEdgesWithInsets:(UIEdgeInsets)insets;

#pragma mark - Margin
- (NSLayoutConstraint *)vk_autoTopMarginBottom:(UIView *)otherItem offset:(CGFloat)offset;
- (NSLayoutConstraint *)vk_autoBottomMarginTop:(UIView *)otherItem offset:(CGFloat)offset;
- (NSLayoutConstraint *)vk_autoLeftMarginRight:(UIView *)otherItem offset:(CGFloat)offset;
- (NSLayoutConstraint *)vk_autoRightMarginLeft:(UIView *)otherItem offset:(CGFloat)offset;
- (NSArray <NSLayoutConstraint *> *)vk_autoEdgesToItem:(UIView *)toItem insets:(UIEdgeInsets)insets;

#pragma mark - SameItem
- (NSLayoutConstraint *)vk_autoLeftToItem:(UIView *)toItem;
- (NSLayoutConstraint *)vk_autoTopToItem:(UIView *)toItem;
- (NSLayoutConstraint *)vk_autoRightToItem:(UIView *)toItem;
- (NSLayoutConstraint *)vk_autoBottomToItem:(UIView *)toItem;

- (NSLayoutConstraint *)vk_autoLeftToItem:(UIView *)toItem offset:(CGFloat)offset;
- (NSLayoutConstraint *)vk_autoTopToItem:(UIView *)toItem offset:(CGFloat)offset;
- (NSLayoutConstraint *)vk_autoRightToItem:(UIView *)toItem offset:(CGFloat)offset;
- (NSLayoutConstraint *)vk_autoBottomToItem:(UIView *)toItem offset:(CGFloat)offset;

- (NSLayoutConstraint *)vk_autoWidthToItem:(UIView *)toItem;
- (NSLayoutConstraint *)vk_autoHeightToItem:(UIView *)toItem;

- (NSLayoutConstraint *)vk_autoWidthToItem:(UIView *)toItem multiplier:(CGFloat)multiplier;
- (NSLayoutConstraint *)vk_autoHeightToItem:(UIView *)toItem multiplier:(CGFloat)multiplier;

- (NSLayoutConstraint *)vk_autoCenterXToItem:(UIView *)toItem;
- (NSLayoutConstraint *)vk_autoCenterYToItem:(UIView *)toItem;

- (NSLayoutConstraint *)vk_autoCenterXToItem:(UIView *)toItem offset:(CGFloat)offset;
- (NSLayoutConstraint *)vk_autoCenterYToItem:(UIView *)toItem offset:(CGFloat)offset;

- (NSLayoutConstraint *)vk_autoAttribute:(NSLayoutAttribute)attribute toSameItem:(UIView *)sameItem;
- (NSLayoutConstraint *)vk_autoAttribute:(NSLayoutAttribute)attribute toSameItem:(UIView *)sameItem offset:(CGFloat)offset;
- (NSLayoutConstraint *)vk_autoAttribute:(NSLayoutAttribute)attribute toSameItem:(UIView *)sameItem multiplier:(CGFloat)multiplier;

#pragma mark - Ratio

- (NSLayoutConstraint *)vk_autoWidthToHeightRatio:(CGFloat)ratio;
- (NSLayoutConstraint *)vk_autoHeightToWidthRatio:(CGFloat)ratio;

- (NSLayoutConstraint *)vk_autoHeightRatio:(CGFloat)ratio item:(UIView *)item;
- (NSLayoutConstraint *)vk_autoWidthRatio:(CGFloat)ratio item:(UIView *)item;

#pragma mark - Size
- (NSArray<NSLayoutConstraint *> *)vk_autoSetSize:(CGSize)size;
- (NSLayoutConstraint *)vk_autoSetWidth:(CGFloat)width;
- (NSLayoutConstraint *)vk_autoSetHeight:(CGFloat)height;

#pragma mark - Base
- (NSLayoutConstraint *)vk_autoAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute toItem:(UIView *)toItem;
- (NSLayoutConstraint *)vk_autoAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute toItem:(UIView *)toItem offset:(CGFloat)offset;
- (NSLayoutConstraint *)vk_autoAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute toItem:(UIView *)toItem offset:(CGFloat)offset relation:(NSLayoutRelation)relation;
- (NSLayoutConstraint *)vk_autoAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute toItem:(UIView *)toItem offset:(CGFloat)offset relation:(NSLayoutRelation)relation multiplier:(CGFloat)multiplier;

@end


