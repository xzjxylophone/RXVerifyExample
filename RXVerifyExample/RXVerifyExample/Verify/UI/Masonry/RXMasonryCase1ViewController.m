//
//  RXMasonryCase1ViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/24.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase1ViewController.h"
#import <Masonry/Masonry.h>

@interface RXMasonryCase1ViewController ()

@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UILabel *label2;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@end

@implementation RXMasonryCase1ViewController

// https://www.jianshu.com/p/63e9765feb3f
// http://tutuge.me/2015/05/23/autolayout-example-with-masonry/


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _label1 = [UILabel new];
    _label1.backgroundColor = [UIColor yellowColor];
    _label1.text = @"label1,";

    _label2 = [UILabel new];
    _label2.backgroundColor = [UIColor greenColor];
    _label2.text = @"label2,";
    
    [self test1];
    
//    [self test2];
    
//    [self test3];
    
}
#pragma mark - Test
- (void)test1 {
    NSString *text =
    @"并排两个label，宽度随内容增长(不会铺满superView)。\n"
    @"整体靠左边\n"
    @"label2使用lessThanOrEqualTo";
    _titleLabel.text = text;
    [_contentView addSubview:_label1];
    [_contentView addSubview:_label2];
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.centerY.equalTo(_label1.superview.mas_centerY);
        make.left.equalTo(@2);
    }];
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.centerY.equalTo(_label2.superview.mas_centerY);
       //左边贴着label1
       make.left.equalTo(_label1.mas_right).with.offset(2);
       //右边的间隔保持大于等于2，注意是lessThanOrEqual
       //这里的“lessThanOrEqualTo”放在从左往右的X轴上考虑会更好理解。
       //即：label2的右边界的X坐标值“小于等于”containView的右边界的X坐标值。
       make.right.lessThanOrEqualTo(@-2);
    }];
}


- (void)test2 {
    NSString *text =
    @"并排两个label，宽度随内容增长(会铺满superView)”。\n"
    @"在superView的宽度足够的情况下，整体靠左\n"
    @"使用抗拉伸优先级";
    _titleLabel.text = text;
    [_contentView addSubview:_label1];
    [_contentView addSubview:_label2];

    // label1: 位于左边
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.centerY.equalTo(_label1.superview.mas_centerY);
        make.left.equalTo(@2);
    }];

    // label2: 位于右边
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.centerY.equalTo(_label2.superview.mas_centerY);
       //左边贴着label1
       make.left.equalTo(_label1.mas_right).with.offset(2);
       //右边的间隔保持大于等于2，注意是lessThanOrEqual
       //这里的“lessThanOrEqualTo”放在从左往右的X轴上考虑会更好理解。
       //即：label2的右边界的X坐标值“小于等于”containView的右边界的X坐标值。
       make.right.equalTo(@-2);
    }];
    
    // 使用了抗拉伸优先级，优先拉伸label2
    [_label1 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_label2 setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
}


- (void)test3 {
    NSString *text =
    @"并排两个label，宽度随内容增长(会铺满superView)\n"
    @"在superView的宽度不够的情况下,优先显示label2\n"
    @"在superView的宽度够的情况下,整体靠左\n"
    @"label1的抗拉伸优先级高。\n"
    @"lable2的抗压缩优先级高。\n"
    @"使用抗拉伸优先级和抗压缩优先级";
    _titleLabel.text = text;
    [_contentView addSubview:_label1];
    [_contentView addSubview:_label2];

    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.centerY.equalTo(_label1.superview.mas_centerY);
        make.left.equalTo(@2);
    }];

    // label2: 位于右边
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.centerY.equalTo(_label2.superview.mas_centerY);
       //左边贴着label1
       make.left.equalTo(_label1.mas_right).with.offset(2);
       //右边的间隔保持大于等于2，注意是lessThanOrEqual
       //这里的“lessThanOrEqualTo”放在从左往右的X轴上考虑会更好理解。
       //即：label2的右边界的X坐标值“小于等于”containView的右边界的X坐标值。
       make.right.equalTo(@-2);
    }];
    
    // 使用了抗拉伸优先级，优先拉伸label2
    [_label1 setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    [_label2 setContentHuggingPriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    
    // 使用抗压缩优先级，优先压缩label1
    [_label1 setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [_label2 setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
}

#pragma mark - Actions
- (IBAction)stepperValueChanged:(UIStepper *)sender {
    switch (sender.tag) {
        case 0:
            _label1.text = [self getLabelContentWithCount:(NSUInteger)sender.value appendText:@"label1"];
            break;
        case 1:
            _label2.text = [self getLabelContentWithCount:(NSUInteger)sender.value appendText:@"label2"];
            break;
        default:
            break;
    }
}
#pragma mark - Private
- (NSString *)getLabelContentWithCount:(NSUInteger)count appendText:(NSString *)appendText {
    NSMutableString *ret = [NSMutableString new];
    for (NSUInteger i = 0; i <= count; i++) {
        [ret appendString:appendText];
    }
    return ret.copy;
}


@end
