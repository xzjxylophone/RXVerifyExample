//
//  RXMasonryCase2ViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/24.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase2ViewController.h"
#import <Masonry/Masonry.h>

#define IMAGE_SIZE  40
#define IMAGE_OFFSET 0

@interface RXMasonryCase2ViewController ()


@property (strong, nonatomic) UIView *containerView;
@property (strong, nonatomic) NSMutableArray *imageViews;
@property (strong, nonatomic) NSMutableArray *widthConstraints;
@property (strong, nonatomic) NSArray *imageViewBgColors;

@end

@implementation RXMasonryCase2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    _imageViews = [NSMutableArray new];
    _widthConstraints = [NSMutableArray new];
    _imageViewBgColors = @[[UIColor redColor], [UIColor greenColor], [UIColor blueColor], [UIColor yellowColor]];
    _containerView = [UIView new];
    [self.view addSubview:_containerView];

    _containerView.backgroundColor = [UIColor grayColor];

    [_containerView mas_makeConstraints:^(MASConstraintMaker *make) {
        //只设置高度，宽度由子View决定
        make.height.equalTo(@(IMAGE_SIZE));
        //水平居中
        make.centerX.equalTo(self.view.mas_centerX);
        //距离父View顶部200点
        make.top.equalTo(self.view.mas_top).offset(300);
    }];
    
    
    //循环创建、添加imageView
    for (NSUInteger i = 0; i < 4; i++) {
        UIImageView *imageView = [UIImageView new];
        imageView.backgroundColor = _imageViewBgColors[i];
        [_imageViews addObject:imageView];
        [_containerView addSubview:imageView];
    }

    //设定大小
    CGSize imageViewSize = CGSizeMake(IMAGE_SIZE, IMAGE_SIZE);

    //分别设置每个imageView的宽高、左边、垂直中心约束，注意约束的对象
    //每个View的左边约束和左边的View的右边相等=。=，有点绕口...
    
    UIView __block *lastView = nil;
    MASConstraint __block *widthConstraint = nil;
    NSUInteger arrayCount = _imageViews.count;
    [_imageViews enumerateObjectsUsingBlock:^(UIView *view, NSUInteger idx, BOOL *stop) {
        [view mas_makeConstraints:^(MASConstraintMaker *make) {
            //宽高固定
            widthConstraint = make.width.equalTo(@(imageViewSize.width));
            make.height.equalTo(@(imageViewSize.height));
            //左边约束
            if (lastView == nil) {
                make.left.equalTo(view.superview.mas_left);
            } else {
                make.left.equalTo(lastView.mas_right).offset(8);
            }
            //垂直中心对齐
            make.centerY.equalTo(view.superview.mas_centerY);
            //设置最右边的imageView的右边与父view的最有对齐
            if (idx == arrayCount - 1) {
                make.right.equalTo(view.superview.mas_right);
            }
            [_widthConstraints addObject:widthConstraint];
            lastView = view;
        }];
    }];
}

#pragma mark - Action
- (IBAction)switchValueChanged:(UISwitch *)sender {
    NSUInteger index = (NSUInteger) sender.tag;
    MASConstraint *width = _widthConstraints[index];

    if (sender.on) {
        width.equalTo(@(IMAGE_SIZE));
    } else {
        width.equalTo(@0);
    }
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
