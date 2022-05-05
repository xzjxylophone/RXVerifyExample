//
//  RXMasonryCase6ViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/25.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase6ViewController.h"
#import <Masonry/Masonry.h>
#import "RXMasonryCase6ItemView.h"

@interface RXMasonryCase6ViewController ()

@end

@implementation RXMasonryCase6ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"自定义base line";
    
    
//    [self testCustomBaseLineView];
    
    [self testButtonBaseLineView];
}


#pragma mark - Private methods
- (void)testButtonBaseLineView {
    UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeCustom];
    btn1.backgroundColor = [UIColor redColor];
    [btn1 setTitle:@"BTN1" forState:UIControlStateNormal];
    UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn2 setTitle:@"BTN2" forState:UIControlStateNormal];
    btn2.backgroundColor = [UIColor redColor];
    UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn3 setTitle:@"BTN3" forState:UIControlStateNormal];
    btn3.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:btn1];
    [self.view addSubview:btn2];
    [self.view addSubview:btn3];
    
    
    [btn1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).with.offset(8);
        make.top.mas_equalTo(self.view.mas_top).with.offset(200);
        make.width.height.equalTo(@44);
    }];

    // 跟第一个item的baseline对其
    [btn2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(btn1.mas_right).with.offset(10);
        make.baseline.mas_equalTo(btn1.mas_baseline);
        make.width.height.equalTo(@66);
    }];

    // 跟第一个item的baseline对其
    [btn3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(btn2.mas_right).with.offset(10);
        make.baseline.mas_equalTo(btn1.mas_baseline);
        make.width.height.equalTo(@88);
    }];
}

- (void)testCustomBaseLineView {
    // 初始化图片资源
    
    NSArray *images = @[[UIImage imageNamed:@"dog_small"], [UIImage imageNamed:@"dog_middle"], [UIImage imageNamed:@"dog_big"]];
    // 创建3个item
    UIView *item1 = [RXMasonryCase6ItemView itemWithImage:images[0] text:@"Auto layout is a system"];
    UIView *item2 = [RXMasonryCase6ItemView itemWithImage:images[1] text:@"Auto Layout is a system that lets you lay out"];
    UIView *item3 = [RXMasonryCase6ItemView itemWithImage:images[2] text:@"Auto Layout is a system that lets you lay out your app’s user interface"];
    [self.view addSubview:item1];
    [self.view addSubview:item2];
    [self.view addSubview:item3];

    [item1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.view.mas_left).with.offset(8);
        make.top.mas_equalTo(self.view.mas_top).with.offset(200);
    }];

    // 跟第一个item的baseline对其
    [item2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(item1.mas_right).with.offset(10);
        make.baseline.mas_equalTo(item1.mas_baseline);
    }];

    // 跟第一个item的baseline对其
    [item3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(item2.mas_right).with.offset(10);
        make.baseline.mas_equalTo(item1.mas_baseline);
    }];
}

@end
