//
//  RXMasonryCase14ViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/26.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase14ViewController.h"
#import "RXMasonryCase14StairView.h"
#import "RXMasonryCase14Cell.h"
@interface RXMasonryCase14ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet RXMasonryCase14StairView *stairView;
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *titles;
@end

@implementation RXMasonryCase14ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 自动决定高度
    [_stairView setStairTitles:@[@"Masonry is a light-weight", @"layout framework which wraps", @"AutoLayout with a nicer syntax."]];
    _stairView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.1];
    
    // 数据
    _titles = @[@"AutoLayout AutoLayout AutoLayout", @"dynamically", @"calculates", @"the", @"size", @"and", @"position",
                @"of", @"all", @"the", @"views", @"in", @"your", @"view", @"hierarchy", @"based",
                @"on", @"constraints", @"placed", @"on", @"those", @"views"];
    
    // TableView
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 80;
    [_tableView registerClass:[RXMasonryCase14Cell class] forCellReuseIdentifier:@"cell"];
    [_tableView reloadData];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    // UITableViewAutomaticDimension不会自动在外部frame变化时刷新，所以手动reload下
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RXMasonryCase14Cell *cell = (RXMasonryCase14Cell *)[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell.stairView setStairTitles:[_titles subarrayWithRange:NSMakeRange(0, indexPath.row % 4 + 1)]];
    return cell;
}
@end
