//
//  UIView+Frame.m
//  IOS-Categories
//
//  Created by Jakey on 14/12/15.
//  Copyright (c) 2014年 www.skyfox.org. All rights reserved.
//

#import "UIView+VK.h"
#import <objc/runtime.h>

@implementation UIView (Frame)
#pragma mark - Shortcuts for the coords

- (CGFloat)top
{
    return self.frame.origin.y;
}

- (void)setTop:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)right
{
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setRight:(CGFloat)right
{
    CGRect frame = self.frame;
    frame.origin.x = right - self.frame.size.width;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - self.frame.size.height;
    self.frame = frame;
}

- (CGFloat)left
{
    return self.frame.origin.x;
}

- (void)setLeft:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

#pragma mark - Shortcuts for frame properties

- (CGPoint)origin {
    return self.frame.origin;
}

- (void)setOrigin:(CGPoint)origin {
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGSize)size {
    return self.frame.size;
}

- (void)setSize:(CGSize)size {
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}
#pragma mark - Shortcuts for positions

- (CGFloat)centerX {
    return self.center.x;
}

- (void)setCenterX:(CGFloat)centerX {
    self.center = CGPointMake(centerX, self.center.y);
}

- (CGFloat)centerY {
    return self.center.y;
}

- (void)setCenterY:(CGFloat)centerY {
    self.center = CGPointMake(self.center.x, centerY);
}
- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

@end

@implementation UIView (VK_Attach)

-(void)removeAllSubviews
{
    [self.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
}

-(id)userObject
{
    return objc_getAssociatedObject(self, @selector(userObject));
}

-(void)setUserObject:(NSObject*)userObject
{
    objc_setAssociatedObject(self, @selector(userObject), userObject, OBJC_ASSOCIATION_RETAIN);
}

-(UIImage *)screenShots
{
    UIGraphicsBeginImageContextWithOptions(self.size, YES, 0);
    [self.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *ret = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return ret;
}

-(void)makeBorder:(UIColor *)color withWidth:(float)width
{
    CALayer *layer = self.layer;
    [layer setBorderColor:[color CGColor]];
    [layer setBorderWidth:width];
}

-(void)makeRoundCorner:(float)radius withClip:(BOOL)clip
{
    CALayer *layer = self.layer;
    [layer setCornerRadius:radius];
    [layer setMasksToBounds:clip];
    
    for (CALayer *tmpLayer in layer.sublayers)
    {
        if (CGRectEqualToRect(tmpLayer.bounds, layer.bounds))
        {
            [tmpLayer setCornerRadius:radius];
            [tmpLayer setMasksToBounds:clip];
        }
    }
}

-(void)makeShadow:(CGSize)offset withColor:(UIColor *)color withRadius:(float)radius
{
    CALayer *layer = self.layer;
    [layer setShadowOffset:offset];
    [layer setShadowRadius:radius];
    [layer setShadowOpacity:0.5];
    [layer setShadowColor:color.CGColor];
}

/**
 *  获取当前UIVIEW 所在的UIViewController
 *
 *  @return UIViewController
 */
- (UIViewController *)viewController
{
    for (UIView* next = [self superview]; next; next = next.superview)
    {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]])
        {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

- (void)vk_attach:(UIView *)view{
    if (!view) {
        return;
    }
    self.translatesAutoresizingMaskIntoConstraints = NO;
    [view addSubview:self];
    NSLayoutConstraint *leftConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                      attribute:NSLayoutAttributeLeft
                                                                      relatedBy:NSLayoutRelationEqual
                                                                         toItem:view
                                                                      attribute:NSLayoutAttributeLeft
                                                                     multiplier:1
                                                                       constant:0];
    NSLayoutConstraint *topConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                     attribute:NSLayoutAttributeTop
                                                                     relatedBy:NSLayoutRelationEqual
                                                                        toItem:view
                                                                     attribute:NSLayoutAttributeTop
                                                                    multiplier:1
                                                                      constant:0];
    NSLayoutConstraint *rightConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                       attribute:NSLayoutAttributeRight
                                                                       relatedBy:NSLayoutRelationEqual
                                                                          toItem:view
                                                                       attribute:NSLayoutAttributeRight
                                                                      multiplier:1
                                                                        constant:0];
    NSLayoutConstraint *bottomConstraint = [NSLayoutConstraint constraintWithItem:self
                                                                        attribute:NSLayoutAttributeBottom
                                                                        relatedBy:NSLayoutRelationEqual
                                                                           toItem:view
                                                                        attribute:NSLayoutAttributeBottom
                                                                       multiplier:1
                                                                         constant:0];
    [view addConstraints:@[leftConstraint, topConstraint, rightConstraint, bottomConstraint]];
}

+ (id)vk_loadNibView {
    return [[[NSBundle mainBundle]loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil]lastObject];
}

+ (instancetype)vk_loadNibViewFromBundle:(NSBundle *)bundle {

    return [[bundle loadNibNamed:NSStringFromClass([self class]) owner:nil options:nil] lastObject];
}

- (void)vk_deactiveAllConstraints {
    [self.constraints enumerateObjectsUsingBlock:^(__kindof NSLayoutConstraint * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        obj.active = NO;
    }];
}

@end

@implementation UIView (VKAddTapGestureRecognizer)

+ (void)addTapGestureRecognizerTo:(UIView *)view withTarget:(id)target action:(SEL)selector{
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:target action:selector];
    view.userInteractionEnabled = YES;
    [view addGestureRecognizer:tapGesture];
}

- (void)vk_addTapWithTarget:(id)target action:(SEL)selector {
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc]initWithTarget:target action:selector];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tapGesture];
}

- (void)vk_addTapWithBlock:(void (^)(void))aBlock {
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(vk_actionTap)];
    self.userInteractionEnabled = YES;
    [self addGestureRecognizer:tap];

    objc_setAssociatedObject(self, @selector(vk_actionTap), aBlock, OBJC_ASSOCIATION_COPY);
}

- (void)vk_actionTap {
    void (^block)(void) = objc_getAssociatedObject(self, _cmd);
    if (block) {
        block();
    }
}

@end



@implementation UIView (VKRound)

- (void)vk_setRadius:(CGFloat)radius borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor {
    CALayer *layer = self.layer;
    layer.borderWidth = borderWidth;
    if (borderColor) {
        layer.borderColor = borderColor.CGColor;
    }
    layer.masksToBounds = YES;
    layer.cornerRadius = radius;
}

- (void)vk_setRadius:(CGFloat)radius {
    [self vk_setRadius:radius borderWidth:0 borderColor:nil];
}

- (void)vk_setBezierPathRadius:(CGFloat)radius {

    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:radius];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame = self.bounds;
    maskLayer.path = maskPath.CGPath;
    self.layer.mask = maskLayer;
}

- (void)vk_setCornerByRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii {
	UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:self.bounds
												   byRoundingCorners:corners
														 cornerRadii:cornerRadii];
	CAShapeLayer *maskLayer =  [CAShapeLayer new];
	maskLayer.frame = self.bounds;
	maskLayer.path = maskPath.CGPath;
	self.layer.masksToBounds = YES;
	self.layer.mask = maskLayer;
}

@end


@implementation NSLayoutConstraint (VK_AutoLayout)

- (void)vk_autoAddConstraint {

#if !(TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1)
    NSAssert(NO, @"vk_autoAddConstraint must use base SDK greater than iOS7.1.",);
#endif

    if ([self respondsToSelector:@selector(setActive:)]) {
        self.active = YES;
    }
}

- (void)vk_autoRemoveConstraint {

#if !(TARGET_OS_IPHONE && __IPHONE_OS_VERSION_MAX_ALLOWED > __IPHONE_7_1)
    NSAssert(NO, @"vk_autoAddConstraint must use base SDK greater than iOS7.1.",);
#endif

    if ([self respondsToSelector:@selector(setActive:)]) {
        self.active = NO;
    }
}

@end

@implementation UIView (VK_AutoLayout)

#pragma mark - Property

- (NSLayoutConstraint *)heightLayoutConstraint {

    return objc_getAssociatedObject(self, _cmd);
}

- (void)setHeightLayoutConstraint:(NSLayoutConstraint *)heightLayoutConstraint {

    objc_setAssociatedObject(self, @selector(heightLayoutConstraint), heightLayoutConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)widthLayoutConstraint {

    return objc_getAssociatedObject(self, _cmd);
}

- (void)setWidthLayoutConstraint:(NSLayoutConstraint *)widthLayoutConstraint {

    objc_setAssociatedObject(self, @selector(widthLayoutConstraint), widthLayoutConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)topLayoutConstraint {

    return objc_getAssociatedObject(self, _cmd);
}

- (void)setTopLayoutConstraint:(NSLayoutConstraint *)topLayoutConstraint {

    objc_setAssociatedObject(self, @selector(topLayoutConstraint), topLayoutConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);

}

- (NSLayoutConstraint *)leftLayoutConstraint {

    return objc_getAssociatedObject(self, _cmd);
}

- (void)setLeftLayoutConstraint:(NSLayoutConstraint *)leftLayoutConstraint {

    objc_setAssociatedObject(self, @selector(leftLayoutConstraint), leftLayoutConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)bottomLayoutConstraint {

    return objc_getAssociatedObject(self, _cmd);
}

- (void)setBottomLayoutConstraint:(NSLayoutConstraint *)bottomLayoutConstraint {

    objc_setAssociatedObject(self, @selector(bottomLayoutConstraint), bottomLayoutConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSLayoutConstraint *)rightLayoutConstraint {

    return objc_getAssociatedObject(self, _cmd);
}

- (void)setRightLayoutConstraint:(NSLayoutConstraint *)rightLayoutConstraint {

    objc_setAssociatedObject(self, @selector(rightLayoutConstraint), rightLayoutConstraint, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark - Methods

- (NSLayoutConstraint *)vk_constraintHeight:(CGFloat)aHeight
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                       multiplier:1.0f
                                         constant:aHeight];
}

- (NSLayoutConstraint *)vk_constraintWidth:(CGFloat)aWidth
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:nil
                                        attribute:NSLayoutAttributeNotAnAttribute
                                       multiplier:1.0f
                                         constant:aWidth];
}

- (NSLayoutConstraint *)vk_constraintCenterXEqualToView:(UIView *)aView
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeCenterX
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:aView
                                        attribute:NSLayoutAttributeCenterX
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)vk_constraintCenterYEqualToView:(UIView *)aView
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeCenterY
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:aView
                                        attribute:NSLayoutAttributeCenterY
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)vk_constraintHeightEqualToView:(UIView *)aView
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeHeight
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:aView
                                        attribute:NSLayoutAttributeHeight
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)vk_constraintWidthEqualToView:(UIView *)aView
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeWidth
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:aView
                                        attribute:NSLayoutAttributeWidth
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)vk_constraintsTop:(CGFloat)aTop FromView:(UIView *)aView
{
    self.translatesAutoresizingMaskIntoConstraints = NO;

    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeTop
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:aView
                                        attribute:NSLayoutAttributeTop
                                       multiplier:1.0f
                                         constant:aTop];
}

- (NSLayoutConstraint *)vk_constraintsBottom:(CGFloat)aBottom FromView:(UIView *)aView
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeBottom
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:aView
                                        attribute:NSLayoutAttributeBottom
                                       multiplier:1.0f
                                         constant:aBottom];
}

- (NSLayoutConstraint *)vk_constraintsLeft:(CGFloat)aLeft FromView:(UIView *)aView
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeLeft
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:aView
                                        attribute:NSLayoutAttributeLeft
                                       multiplier:1.0f
                                         constant:aLeft];
}

- (NSLayoutConstraint *)vk_constraintsRight:(CGFloat)aRight FromView:(UIView *)aView
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeRight
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:aView
                                        attribute:NSLayoutAttributeRight
                                       multiplier:1.0f
                                         constant:aRight];
}

- (NSArray *)vk_constraintsSizeEqualToView:(UIView *)aView
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return @[
             [self vk_constraintHeightEqualToView:aView],
             [self vk_constraintWidthEqualToView:aView]
             ];
}

- (NSArray *)vk_constraintsSize:(CGSize)aSize
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return @[
             [self vk_constraintHeight:aSize.height],
             [self vk_constraintWidth:aSize.width]
             ];
}

- (NSLayoutConstraint *)vk_constraintTopEqualToView:(UIView *)aView
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeTop
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:aView
                                        attribute:NSLayoutAttributeTop
                                       multiplier:1.0
                                         constant:0.0];
}

- (NSLayoutConstraint *)vk_constraintBottomEqualToView:(UIView *)aView
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeBottom
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:aView
                                        attribute:NSLayoutAttributeBottom
                                       multiplier:1.0f
                                         constant:0.0f];
}
- (NSLayoutConstraint *)vk_constraintLeftEqualToView:(UIView *)aView
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeLeft
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:aView
                                        attribute:NSLayoutAttributeLeft
                                       multiplier:1.0f
                                         constant:0.0f];
}

- (NSLayoutConstraint *)vk_constraintRightEqualToView:(UIView *)aView
{
    self.translatesAutoresizingMaskIntoConstraints = NO;
    return [NSLayoutConstraint constraintWithItem:self
                                        attribute:NSLayoutAttributeRight
                                        relatedBy:NSLayoutRelationEqual
                                           toItem:aView
                                        attribute:NSLayoutAttributeRight
                                       multiplier:1.0f
                                         constant:0.0f];
}





#pragma mark - SuperView

- (NSLayoutConstraint *)vk_autoSuperViewLeft
{
    return [self vk_autoSuperViewAttribute:NSLayoutAttributeLeft];
}

- (NSLayoutConstraint *)vk_autoSuperViewTop
{
    return [self vk_autoSuperViewAttribute:NSLayoutAttributeTop];
}

- (NSLayoutConstraint *)vk_autoSuperViewRight
{
    return [self vk_autoSuperViewAttribute:NSLayoutAttributeRight];
}

- (NSLayoutConstraint *)vk_autoSuperViewBottom
{
    return [self vk_autoSuperViewAttribute:NSLayoutAttributeBottom];
}

- (NSLayoutConstraint *)vk_autoSuperViewCenterX
{
    return [self vk_autoSuperViewAttribute:NSLayoutAttributeCenterX];
}

- (NSLayoutConstraint *)vk_autoSuperViewCenterY
{
    return [self vk_autoSuperViewAttribute:NSLayoutAttributeCenterY];
}

- (NSLayoutConstraint *)vk_autoSuperViewWidth
{
    return [self vk_autoSuperViewAttribute:NSLayoutAttributeWidth];
}

- (NSLayoutConstraint *)vk_autoSuperViewHeight
{
    return [self vk_autoSuperViewAttribute:NSLayoutAttributeHeight];
}

- (NSLayoutConstraint *)vk_autoSuperViewAttribute:(NSLayoutAttribute)attribute {
    return [self vk_autoSuperViewAttribute:attribute constant:0];
}

- (NSLayoutConstraint *)vk_autoSuperViewAttribute:(NSLayoutAttribute)attribute constant:(CGFloat)constant {

    return [self vk_autoSuperViewAttribute:attribute constant:constant relation:NSLayoutRelationEqual];
}

- (NSLayoutConstraint *)vk_autoSuperViewAttribute:(NSLayoutAttribute)attribute constant:(CGFloat)constant relation:(NSLayoutRelation)relation
{
    UIView *superview = self.superview;
    NSAssert(superview, @"View's superview must not be nil.\nView: %@", self);
    return [self vk_autoAttribute:attribute toAttribute:attribute toItem:superview offset:constant relation:relation];
}


- (NSArray<NSLayoutConstraint *> *)vk_autoEdgesToSuperviewEdges
{

    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    [mutableArray addObject:[self vk_autoSuperViewAttribute:NSLayoutAttributeLeft]];
    [mutableArray addObject:[self vk_autoSuperViewAttribute:NSLayoutAttributeTop]];
    [mutableArray addObject:[self vk_autoSuperViewAttribute:NSLayoutAttributeRight]];
    [mutableArray addObject:[self vk_autoSuperViewAttribute:NSLayoutAttributeBottom]];
    return mutableArray;
}

- (NSArray<NSLayoutConstraint *> *)vk_autoEdgesToSuperviewEdgesWithInsets:(UIEdgeInsets)insets
{

    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    [mutableArray addObject:[self vk_autoSuperViewAttribute:NSLayoutAttributeLeft constant:insets.left]];
    [mutableArray addObject:[self vk_autoSuperViewAttribute:NSLayoutAttributeTop constant:insets.top]];
    [mutableArray addObject:[self vk_autoSuperViewAttribute:NSLayoutAttributeRight constant:insets.right]];
    [mutableArray addObject:[self vk_autoSuperViewAttribute:NSLayoutAttributeBottom constant:insets.bottom]];
    return mutableArray;
}

#pragma mark - Margin

- (NSLayoutConstraint *)vk_autoTopMarginBottom:(UIView *)otherItem offset:(CGFloat)offset
{
    return [self vk_autoAttribute:NSLayoutAttributeTop toAttribute:NSLayoutAttributeBottom toItem:otherItem offset:offset];
}

- (NSLayoutConstraint *)vk_autoBottomMarginTop:(UIView *)otherItem offset:(CGFloat)offset
{
    return [self vk_autoAttribute:NSLayoutAttributeBottom toAttribute:NSLayoutAttributeTop toItem:otherItem offset:offset];
}

- (NSLayoutConstraint *)vk_autoLeftMarginRight:(UIView *)otherItem offset:(CGFloat)offset
{
    return [self vk_autoAttribute:NSLayoutAttributeLeft toAttribute:NSLayoutAttributeRight toItem:otherItem offset:offset];
}

- (NSLayoutConstraint *)vk_autoRightMarginLeft:(UIView *)otherItem offset:(CGFloat)offset
{
    return [self vk_autoAttribute:NSLayoutAttributeRight toAttribute:NSLayoutAttributeLeft toItem:otherItem offset:offset];
}

- (NSArray<NSLayoutConstraint *> *)vk_autoEdgesToItem:(UIView *)toItem insets:(UIEdgeInsets)insets {

    NSLayoutConstraint *left = [self vk_autoLeftToItem:toItem offset:insets.left];
    NSLayoutConstraint *top = [self vk_autoTopToItem:toItem offset:insets.top];
    NSLayoutConstraint *right = [self vk_autoRightToItem:toItem offset:insets.right];
    NSLayoutConstraint *bottom = [self vk_autoBottomToItem:toItem offset:insets.bottom];

    return @[left, top, right, bottom];
}

#pragma mark - SameItem

- (NSLayoutConstraint *)vk_autoLeftToItem:(UIView *)toItem
{
    return [self vk_autoLeftToItem:toItem offset:0];
}

- (NSLayoutConstraint *)vk_autoTopToItem:(UIView *)toItem
{
    return [self vk_autoTopToItem:toItem offset:0];
}

- (NSLayoutConstraint *)vk_autoRightToItem:(UIView *)toItem
{
    return [self vk_autoRightToItem:toItem offset:0];
}

- (NSLayoutConstraint *)vk_autoBottomToItem:(UIView *)toItem
{
    return [self vk_autoBottomToItem:toItem offset:0];
}

- (NSLayoutConstraint *)vk_autoLeftToItem:(UIView *)toItem offset:(CGFloat)offset
{
    return [self vk_autoAttribute:NSLayoutAttributeLeft toSameItem:toItem offset:offset];
}

- (NSLayoutConstraint *)vk_autoTopToItem:(UIView *)toItem offset:(CGFloat)offset
{
    return [self vk_autoAttribute:NSLayoutAttributeTop toSameItem:toItem offset:offset];
}

- (NSLayoutConstraint *)vk_autoRightToItem:(UIView *)toItem offset:(CGFloat)offset
{
    return [self vk_autoAttribute:NSLayoutAttributeRight toSameItem:toItem offset:offset];
}

- (NSLayoutConstraint *)vk_autoBottomToItem:(UIView *)toItem offset:(CGFloat)offset
{
    return [self vk_autoAttribute:NSLayoutAttributeBottom toSameItem:toItem offset:offset];
}

- (NSLayoutConstraint *)vk_autoWidthToItem:(UIView *)toItem
{
    return [self vk_autoWidthToItem:toItem multiplier:1];
}

- (NSLayoutConstraint *)vk_autoHeightToItem:(UIView *)toItem
{
    return [self vk_autoHeightToItem:toItem multiplier:1];
}

- (NSLayoutConstraint *)vk_autoWidthToItem:(UIView *)toItem multiplier:(CGFloat)multiplier
{
    return [self vk_autoAttribute:NSLayoutAttributeWidth toSameItem:toItem multiplier:multiplier];
}

- (NSLayoutConstraint *)vk_autoHeightToItem:(UIView *)toItem multiplier:(CGFloat)multiplier
{
    return [self vk_autoAttribute:NSLayoutAttributeHeight toSameItem:toItem multiplier:multiplier];
}

//ratio = width / height
- (NSLayoutConstraint *)vk_autoWidthToHeightRatio:(CGFloat)ratio
{
    return [self vk_autoAttribute:NSLayoutAttributeWidth toAttribute:NSLayoutAttributeHeight toItem:self offset:0 relation:NSLayoutRelationEqual multiplier:ratio];
}

- (NSLayoutConstraint *)vk_autoCenterXToItem:(UIView *)toItem
{
    return [self vk_autoCenterXToItem:toItem offset:0];
}

- (NSLayoutConstraint *)vk_autoCenterYToItem:(UIView *)toItem
{
    return [self vk_autoCenterYToItem:toItem offset:0];
}

- (NSLayoutConstraint *)vk_autoCenterXToItem:(UIView *)toItem offset:(CGFloat)offset
{
    return [self vk_autoAttribute:NSLayoutAttributeCenterX toSameItem:toItem offset:offset];
}

- (NSLayoutConstraint *)vk_autoCenterYToItem:(UIView *)toItem offset:(CGFloat)offset
{
    return [self vk_autoAttribute:NSLayoutAttributeCenterY toSameItem:toItem offset:offset];
}

- (NSLayoutConstraint *)vk_autoAttribute:(NSLayoutAttribute)attribute toSameItem:(UIView *)sameItem
{
    return [self vk_autoAttribute:attribute toSameItem:sameItem offset:0];
}

- (NSLayoutConstraint *)vk_autoAttribute:(NSLayoutAttribute)attribute toSameItem:(UIView *)sameItem offset:(CGFloat)offset
{
    return [self vk_autoAttribute:attribute toAttribute:attribute toItem:sameItem offset:offset relation:NSLayoutRelationEqual];
}

- (NSLayoutConstraint *)vk_autoAttribute:(NSLayoutAttribute)attribute toSameItem:(UIView *)sameItem multiplier:(CGFloat)multiplier
{

    return [self vk_autoAttribute:attribute toAttribute:attribute toItem:sameItem offset:0 relation:NSLayoutRelationEqual multiplier:multiplier];
}

#pragma mark - Ratio

//ratio = width / height

- (NSLayoutConstraint *)vk_autoHeightToWidthRatio:(CGFloat)ratio
{
    return [self vk_autoAttribute:NSLayoutAttributeHeight
                      toAttribute:NSLayoutAttributeWidth
                           toItem:self
                           offset:0
                         relation:NSLayoutRelationEqual
                       multiplier:ratio];
}

- (NSLayoutConstraint *)vk_autoHeightRatio:(CGFloat)ratio item:(UIView *)item {

    return [self vk_autoAttribute:NSLayoutAttributeHeight
                      toAttribute:NSLayoutAttributeHeight
                           toItem:item
                           offset:0
                         relation:NSLayoutRelationEqual
                       multiplier:ratio];
}

- (NSLayoutConstraint *)vk_autoWidthRatio:(CGFloat)ratio item:(UIView *)item {

    return [self vk_autoAttribute:NSLayoutAttributeWidth
                      toAttribute:NSLayoutAttributeWidth
                           toItem:item
                           offset:0
                         relation:NSLayoutRelationEqual
                       multiplier:ratio];
}

#pragma mark - Size
- (NSArray<NSLayoutConstraint *> *)vk_autoSetSize:(CGSize)size
{
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    [mutableArray addObject:[self vk_autoSetHeight:size.height]];
    [mutableArray addObject:[self vk_autoSetWidth:size.width]];
    return mutableArray;
}

- (NSLayoutConstraint *)vk_autoSetWidth:(CGFloat)width
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1
                                                                   constant:width];
    [constraint vk_autoAddConstraint];
    self.widthLayoutConstraint = constraint;
    return constraint;
}

- (NSLayoutConstraint *)vk_autoSetHeight:(CGFloat)height
{
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:NSLayoutAttributeHeight
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1
                                                                   constant:height];
    [constraint vk_autoAddConstraint];
    self.heightLayoutConstraint = constraint;
    return constraint;
}

#pragma mark - Base

- (NSLayoutConstraint *)vk_autoAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute toItem:(UIView *)toItem
{
    return [self vk_autoAttribute:attribute toAttribute:toAttribute toItem:toItem offset:0 relation:NSLayoutRelationEqual];
}

- (NSLayoutConstraint *)vk_autoAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute toItem:(UIView *)toItem offset:(CGFloat)offset
{
    return [self vk_autoAttribute:attribute toAttribute:toAttribute toItem:toItem offset:offset relation:NSLayoutRelationEqual];
}

- (NSLayoutConstraint *)vk_autoAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute toItem:(UIView *)toItem offset:(CGFloat)offset relation:(NSLayoutRelation)relation
{
    return [self vk_autoAttribute:attribute toAttribute:toAttribute toItem:toItem offset:offset relation:NSLayoutRelationEqual multiplier:1];
}


- (NSLayoutConstraint *)vk_autoAttribute:(NSLayoutAttribute)attribute toAttribute:(NSLayoutAttribute)toAttribute toItem:(UIView *)toItem offset:(CGFloat)offset relation:(NSLayoutRelation)relation multiplier:(CGFloat)multiplier
{
    if (toAttribute != NSLayoutAttributeNotAnAttribute) {
        NSAssert(toItem, @"toitem must not be nil.\nView: %@", toItem);
    }

    self.translatesAutoresizingMaskIntoConstraints = NO;
    NSLayoutConstraint *constraint = [NSLayoutConstraint constraintWithItem:self
                                                                  attribute:attribute
                                                                  relatedBy:relation
                                                                     toItem:toItem
                                                                  attribute:toAttribute
                                                                 multiplier:multiplier
                                                                   constant:offset];
    [self vk_setConstraintPropertyWithConstraint:constraint attribute:attribute];
    [constraint vk_autoAddConstraint];
    return constraint;
}

- (void)vk_setConstraintPropertyWithConstraint:(NSLayoutConstraint *)constraint attribute:(NSLayoutAttribute)attribute {

    switch (attribute) {
        case NSLayoutAttributeTop:
        {
            self.topLayoutConstraint = constraint;
        }
            break;

        case NSLayoutAttributeLeft:
        {
            self.leftLayoutConstraint = constraint;
        }
            break;
        case NSLayoutAttributeBottom:
        {
            self.bottomLayoutConstraint = constraint;
        }
            break;
        case NSLayoutAttributeRight:
        {
            self.rightLayoutConstraint = constraint;
        }
            break;
        default:
            break;
    }
}

@end


