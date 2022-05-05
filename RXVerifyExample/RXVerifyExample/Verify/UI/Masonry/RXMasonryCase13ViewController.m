//
//  RXMasonryCase13ViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/26.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase13ViewController.h"
#import "RXMasonryCase13Cell.h"

@interface RXMasonryCase13ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSMutableArray <NSArray <NSString *> *> *data;

@end

@implementation RXMasonryCase13ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // tableView
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    _tableView.estimatedRowHeight = 80;
    [_tableView registerClass:[RXMasonryCase13Cell class] forCellReuseIdentifier:NSStringFromClass([RXMasonryCase13Cell class])];
    
    // 生成数据
    NSString *string = @"Masonry is a light-weight layout framework which wraps AutoLayout with a nicer syntax.";
    _data = [NSMutableArray new];
    
    for (NSInteger i = 0; i < 20; i++) {
        NSMutableArray *cellTexts = [NSMutableArray new];
        for (NSInteger j = 0; j < 3; j++) {
            [cellTexts addObject:[string substringToIndex:arc4random_uniform((uint32_t)string.length)]];
        }
        [_data addObject:cellTexts];
    }
    
    // 刷新
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _data.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RXMasonryCase13Cell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RXMasonryCase13Cell class]) forIndexPath:indexPath];
    [cell configWithTexts:_data[indexPath.row]];
    return cell;
}


@end
