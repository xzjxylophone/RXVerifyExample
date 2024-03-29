//
//  RXMasonryCase7ViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/25.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase7ViewController.h"
#import <Masonry/Masonry.h>

static CGFloat ParallaxHeaderHeight = 235;
static NSString *CellIdentifier = @"Cell";

@interface RXMasonryCase7ViewController () <UITableViewDataSource, UITableViewDelegate, UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (strong, nonatomic) UIImageView *parallaxHeaderView;
@property (strong, nonatomic) MASConstraint *parallaxHeaderHeightConstraint;

@end

@implementation RXMasonryCase7ViewController



- (void)dealloc {
    [_tableView removeObserver:self forKeyPath:@"contentOffset"];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tableView.backgroundColor = [UIColor clearColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.contentInset = UIEdgeInsetsMake(ParallaxHeaderHeight, 0, 0, 0);
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:CellIdentifier];
    
    
    [self initView];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = @(indexPath.row).stringValue;
    return cell;
}

// *************************
// 两种方法监听contentOffset
// *************************

// 方法1：直接在scrollViewDidScroll:刷新
#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    if (_parallaxHeaderHeightConstraint == nil) {
        return;
    }
    if (scrollView.contentOffset.y < 0) {
        _parallaxHeaderHeightConstraint.equalTo(@(ParallaxHeaderHeight - scrollView.contentOffset.y));
    } else {
        _parallaxHeaderHeightConstraint.equalTo(@(ParallaxHeaderHeight));
    }
}

// 方法2：利用KVO
//- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context {
//    if ([keyPath isEqualToString:@"contentOffset"]) {
//        CGPoint contentOffset = ((NSValue *)change[NSKeyValueChangeNewKey]).CGPointValue;
//        if (contentOffset.y < -ParallaxHeaderHeight) {
//            _parallaxHeaderHeightConstraint.equalTo(@(-contentOffset.y));
//        }
//    }
//}

#pragma mark - Private methods



- (void)initView {
    _parallaxHeaderView = [UIImageView new];
    [self.view insertSubview:_parallaxHeaderView belowSubview:_tableView];
    _parallaxHeaderView.contentMode = UIViewContentModeScaleAspectFill;
    _parallaxHeaderView.image = [UIImage imageNamed:@"parallax_header_back"];

    [_parallaxHeaderView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.view);
        make.top.equalTo(self.mas_topLayoutGuideBottom);
        _parallaxHeaderHeightConstraint = make.height.equalTo(@(ParallaxHeaderHeight));
    }];
    
    // Add KVO
//    [_tableView addObserver:self forKeyPath:@"contentOffset" options:NSKeyValueObservingOptionNew context:nil];
}

@end
