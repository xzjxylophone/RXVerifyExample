//
//  RXMasonryCase6ItemView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/25.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase6ItemView.h"

#import <Masonry/Masonry.h>

@interface RXMasonryCase6ItemView ()
@property (strong, nonatomic) NSString *text;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIImage *image;
@end
@implementation RXMasonryCase6ItemView

+ (instancetype)itemWithImage:(UIImage *)image text:(NSString *)text {
    RXMasonryCase6ItemView *item = [RXMasonryCase6ItemView new];
    item.text = text;
    item.image = image;
    [item initView];
    
    return item;
}

#pragma mark - Private methods

- (void)initView {
    self.backgroundColor = [UIColor lightGrayColor];

    // ImageView
    UIImageView *imageView = [UIImageView new];
    imageView.image = self.image;
//    imageView.backgroundColor = [UIColor redColor];
    self.imageView = imageView;

    // Label
    UILabel *label = [UILabel new];
    label.numberOfLines = 0;
    label.text = _text;
    label.textColor = [UIColor whiteColor];

    [self addSubview:imageView];
    [self addSubview:label];

    // ImageView
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).with.offset(4);
        make.top.equalTo(self.mas_top).with.offset(4);
        make.right.equalTo(self.mas_right).with.offset(-4);
    }];
    [imageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
    [imageView setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];

    // Label
    [label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(imageView.mas_width);
        make.left.equalTo(imageView.mas_left);
        make.top.equalTo(imageView.mas_bottom).with.offset(4);
        make.bottom.equalTo(self.mas_bottom).with.offset(-4);
    }];
    [label setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}

#pragma mark - Override

// 返回自定义的baseline的view
- (UIView *)viewForBaselineLayout {
    return self.imageView;
}


@end
