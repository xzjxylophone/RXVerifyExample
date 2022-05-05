//
//  RXMasonryCase3ViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/25.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase3ViewController.h"
#import <Masonry/Masonry.h>

@interface RXMasonryCase3ViewController ()


@property (weak, nonatomic) IBOutlet UIView *containerView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *containerViewWidthConstraint;
@property (assign, nonatomic) CGFloat maxWidth;

@end

@implementation RXMasonryCase3ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //保存最大宽度
    _maxWidth = _containerViewWidthConstraint.constant;
    
    UIView *subView = [UIView new];
    subView.backgroundColor = [UIColor redColor];
    
    [_containerView addSubview:subView];
    
    [subView mas_makeConstraints:^(MASConstraintMaker *make) {
        //上下左贴边
        make.left.equalTo(_containerView.mas_left);
        make.top.equalTo(_containerView.mas_top);
        make.bottom.equalTo(_containerView.mas_bottom);
        //宽度为父view的宽度的一半
        make.width.equalTo(_containerView.mas_width).multipliedBy(0.5);
    }];
    
    
}

# pragma mark - Actions

- (IBAction)sliderValueChanged:(UISlider *)sender {
    if (sender.value) {
        //改变containerView的宽度
        _containerViewWidthConstraint.constant = sender.value * _maxWidth;
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
