//
//  RXMasonryCase9ViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/25.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase9ViewController.h"
#import <Masonry/Masonry.h>

static const CGFloat ITEM_SIZE = 32;
static const NSUInteger ITEM_COUNT = 4;

@interface RXMasonryCase9ViewController ()

@property (weak, nonatomic) IBOutlet UIView *containerView1;
@property (weak, nonatomic) IBOutlet UIView *containerView2;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *container1WidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *container2WidthConstraint;
@property (assign, nonatomic) CGFloat maxWidth;
@end

@implementation RXMasonryCase9ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    _maxWidth = _container1WidthConstraint.constant;
    
    [self initContainer1];
    
    [self initContainer2];
}


# pragma mark - Actions

- (IBAction)changeContainerViewWidth:(UISlider *)sender {
    _container1WidthConstraint.constant = sender.value * _maxWidth;
    _container2WidthConstraint.constant = sender.value * _maxWidth;
}

#pragma mark - Private methods

// 利用透明等宽度的SpaceView实现等间距
- (void)initContainer1 {
    UIView *lastSpaceView = [UIView new];
    lastSpaceView.backgroundColor = [UIColor greenColor];
    [_containerView1 addSubview:lastSpaceView];
    
    [lastSpaceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.top.and.bottom.equalTo(_containerView1);
    }];
    
    for (NSUInteger i = 0; i < ITEM_COUNT; i++) {
        UIView *itemView = [self getItemViewWithIndex:i];
        [_containerView1 addSubview:itemView];
        
        [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.and.width.equalTo(@(ITEM_SIZE));
            make.left.equalTo(lastSpaceView.mas_right);
            make.centerY.equalTo(_containerView1.mas_centerY);
        }];
        
        UIView *spaceView = [UIView new];
        spaceView.backgroundColor = [UIColor greenColor];
        [_containerView1 addSubview:spaceView];
        
        [spaceView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(itemView.mas_right).with.priorityHigh(); // 降低优先级，防止宽度不够出现约束冲突
            make.top.and.bottom.equalTo(_containerView1);
            make.width.equalTo(lastSpaceView.mas_width);
        }];
        
        lastSpaceView = spaceView;
    }
    
    [lastSpaceView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(_containerView1.mas_right);
    }];
}

// 直接设置multiplier实现等间距
- (void)initContainer2 {
    for (NSUInteger i = 0; i < ITEM_COUNT; i++) {
        UIView *itemView = [self getItemViewWithIndex:i];
        [_containerView2 addSubview:itemView];

        [itemView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.width.and.height.equalTo(@(ITEM_SIZE));
            make.centerY.equalTo(_containerView2.mas_centerY);
            make.centerX.equalTo(_containerView2.mas_right).multipliedBy(((CGFloat)i + 1) / ((CGFloat)ITEM_COUNT + 1));
        }];
    }
}

- (UIView *)getItemViewWithIndex:(NSUInteger)index {
    UILabel *label = [UILabel new];
//    imageView.contentMode = UIViewContentModeScaleAspectFit;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = [NSString stringWithFormat:@"%zd", (long)index];
    label.backgroundColor = [UIColor redColor];
    return label;
}
@end
