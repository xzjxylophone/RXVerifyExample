//
//  RXMasonryCase5ViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/25.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase5ViewController.h"
#import <Masonry/Masonry.h>

// 注释掉这个宏定义，就直接使用length值做约束，否则的话，使用新的mas_topLayoutGuide和mas_bottomLayoutGuide
//#define NEW_FEATURE


@interface RXMasonryCase5ViewController ()

@property (strong, nonatomic) UIView *topView;
@property (strong, nonatomic) UIView *bottomView;

@end

@implementation RXMasonryCase5ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    

        self.title = @"top(bottom)LayoutGuide";

        [self initView];
        
        NSLog(@"[viewDidLoad] top: %g", self.topLayoutGuide.length);
    //    NSLog(@"[viewDidLoad] top: %@", NSStringFromClass([self.topLayoutGuide class]));
        
        self.navigationController.toolbar.backgroundColor = [UIColor redColor];
}
#pragma mark - Action

- (IBAction)showOrHideTopBarTouchUpInside:(id)sender {
    [self.navigationController setNavigationBarHidden:!self.navigationController.navigationBarHidden animated:NO];
    // 隐藏、显示了NavigationBar以后，要手动触发updateViewConstraints，更新约束
    [self updateViewConstraints];
}

- (IBAction)showOrHideBottomBarTouchUpInside:(id)sender {
    [self.navigationController setToolbarHidden:!self.navigationController.toolbarHidden animated:NO];
    // 手动触发updateViewConstraints
    [self updateViewConstraints];
    
}

- (IBAction)backTouchUpInside:(id)sender {
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Private

- (void)initView {
    _topView = [UIView new];
    _topView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:_topView];
    [_topView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.left.and.right.equalTo(self.view);
        
#ifdef NEW_FEATURE
        make.top.equalTo(self.mas_topLayoutGuide);
#endif
        
    }];

    _bottomView = [UIView new];
    _bottomView.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:_bottomView];
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.left.and.right.equalTo(self.view);
        
#ifdef NEW_FEATURE
        make.bottom.equalTo(self.mas_bottomLayoutGuide);
#endif
    }];
}

#pragma mark - Override

- (void)updateViewConstraints {
    
#ifndef NEW_FEATURE
    // 根据新的length值更新约束
    [_topView mas_updateConstraints:^(MASConstraintMaker *make) {
        // 直接利用其length属性，避免iOS、SDK版本升级后topLayoutGuide不再是UIView
        make.top.equalTo(self.view.mas_top).with.offset(self.topLayoutGuide.length);
    }];

    // 根据新的length值更新约束
    [_bottomView mas_updateConstraints:^(MASConstraintMaker *make) {
        // 直接利用其length属性，避免iOS、SDK版本升级后topLayoutGuide不再是UIView
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-(self.bottomLayoutGuide.length));
    }];
#endif
    
    [super updateViewConstraints];
}

@end
