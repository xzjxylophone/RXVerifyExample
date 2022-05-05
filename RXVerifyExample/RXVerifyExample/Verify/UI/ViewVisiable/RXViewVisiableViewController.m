//
//  RXViewVisiableViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/18.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXViewVisiableViewController.h"
#import "UIView+RXVerify.h"
#import <Masonry/Masonry.h>
#import "RXViewVisiableCell.h"

@interface RXViewVisiableViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;


@end

@implementation RXViewVisiableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.tableView.superview).insets(UIEdgeInsetsZero);
    }];
    [self.tableView reloadData];
}





#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *clsStr = [NSString stringWithFormat:@"RXViewHolder%zdCell", (long)(1 + 1)];
    RXViewVisiableCell *cell = (RXViewVisiableCell *)[tableView dequeueReusableCellWithIdentifier:clsStr];
    if (cell == nil) {
        cell = [[RXViewVisiableCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:clsStr];
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

@end
