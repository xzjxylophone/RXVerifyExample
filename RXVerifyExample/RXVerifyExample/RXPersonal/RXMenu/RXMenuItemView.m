//
//  RXMenuItemView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/8.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RXMenuItemView.h"


static inline CGRect ScaleRect(CGRect rect, float n)
{
    CGFloat x = (rect.size.width - rect.size.width * n) / 2;
    CGFloat y = (rect.size.height - rect.size.height * n) / 2;
    CGFloat width = rect.size.width * n;
    CGFloat height = rect.size.height * n;
    return CGRectMake(x, y, width, height);
}



@interface RXMenuItemView ()

@property (nonatomic, strong) UIImageView *ivContent;

@end

@implementation RXMenuItemView


#pragma mark - Touch Action
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = YES;
    [self.delegate rxMenuItemViewTouchesBegan:self];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint location = [[touches anyObject] locationInView:self];
    if (!CGRectContainsPoint(ScaleRect(self.bounds, 2.0f), location)) {
        self.highlighted = NO;
    }
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.highlighted = NO;
    CGPoint location = [[touches anyObject] locationInView:self];
    if (CGRectContainsPoint(ScaleRect(self.bounds, 2.0f), location)) {
        [self.delegate rxMenuItemViewTouchesEnd:self];
    }
}

#pragma mark - Override
- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    self.ivContent.highlighted = highlighted;
}


#pragma mark - Constructor And Destructor
- (id)initWithImage:(UIImage *)image highlightedImage:(UIImage *)highlightedImage contentImage:(UIImage *)contentImage highlightedContentImage:(UIImage *)highlightedContentImage
{
    if (self = [super init]) {
        self.image = image;
        self.highlightedImage = self.highlightedImage;
        self.userInteractionEnabled = YES;
        self.ivContent = [[UIImageView alloc] initWithImage:contentImage];
        self.ivContent.highlightedImage = highlightedContentImage;
        [self addSubview:self.ivContent];
        
        CGFloat bgWidth = image.size.width;
        CGFloat bgHeight = image.size.height;
        CGFloat cWidth = contentImage.size.width;
        CGFloat cHeight = contentImage.size.height;
        CGFloat cX = (bgWidth - cWidth) / 2.0f;
        CGFloat cY = (bgHeight - cHeight) / 2.0f;
        self.frame = CGRectMake(0, 0, bgWidth, bgHeight);
        self.ivContent.frame = CGRectMake(cX, cY, cWidth, cHeight);
        
    }
    return self;
}




@end
