//
//  RXViewHolderViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/11.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXViewHolderViewController.h"
#import <Masonry/Masonry.h>
#import "RXViewHolder1Cell.h"
#import "RXViewHolder2Cell.h"
#import "RXViewHolder3Cell.h"
#import "RXViewHolder4Cell.h"
#import "RXViewHolderGradientLayerView.h"

@interface RXViewHolderViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) RXViewHolderGradientLayerView *gradientView;
@property (nonatomic, strong) UILabel *desLabel;

@end

@implementation RXViewHolderViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // 如果是背景色，那么第二种方法是无法显示出文字的
    self.view.backgroundColor = [UIColor whiteColor];
    self.view.backgroundColor = [UIColor greenColor];
    
//    [self test1SignlaView];

    [self test2SignlaView];
    
}



- (void)test1SignlaView {
    [self.view addSubview:self.gradientView];
    [self.gradientView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@200);
        make.left.right.equalTo(@0);
        make.height.equalTo(@(40));
    }];
    
    [self.view addSubview:self.desLabel];
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@220);
        make.left.right.equalTo(@0);
        make.height.equalTo(@(20));
    }];
    self.desLabel.text = @"跟gradientView 同级view";
}

- (void)test2SignlaView {
    [self.view addSubview:self.gradientView];
    [self.gradientView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@200);
        make.left.right.equalTo(@0);
        make.height.equalTo(@(40));
    }];
    [self.gradientView addSubview:self.desLabel];
    [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(@0);
        make.left.right.equalTo(@0);
        make.height.equalTo(@(20));
    }];
    self.desLabel.text = @"是gradientView 的子view";
}


- (void)testWithTableView {
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.tableView.superview).insets(UIEdgeInsetsZero);
    }];
    [self.tableView reloadData];
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 40;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSInteger index = indexPath.row % 4;
    NSString *clsStr = [NSString stringWithFormat:@"RXViewHolder%zdCell", (long)(index + 1)];
    Class cls = NSClassFromString(clsStr);
    RXViewHolderBaseCell *cell = [tableView dequeueReusableCellWithIdentifier:clsStr];
    if (cell == nil) {
        cell = [[cls alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:clsStr];
    }
    [cell refreshViewWithIndex:indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

#pragma mark - UI Getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [UITableView new];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (UILabel *)desLabel {
    if (!_desLabel) {
        _desLabel = [UILabel new];
        _desLabel.textColor = [UIColor whiteColor];
        _desLabel.numberOfLines = 1;
        _desLabel.font = [UIFont systemFontOfSize:14];
    }
    return _desLabel;
}
- (RXViewHolderGradientLayerView *)gradientView {
    if (!_gradientView) {
        _gradientView = [RXViewHolderGradientLayerView new];
    }
    return _gradientView;
}
@end
