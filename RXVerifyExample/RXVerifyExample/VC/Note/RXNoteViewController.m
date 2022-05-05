//
//  RXNoteViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2021/12/9.
//  Copyright © 2021 Rush.D.Xzj. All rights reserved.
//

#import "RXNoteViewController.h"

@interface RXNoteViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *functionItems;
@property (nonatomic, strong) NSArray *functionItemURLAddress;
@end

@implementation RXNoteViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    
    self.functionItems = @[
        @"星门",
        @"大奉打更人"
    ];
    self.functionItemURLAddress = @[
        @"https://www.9txs.org/book/290750",
        @"https://www.9txs.org/book/181796/"
    ];
    
    
    
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.functionItems.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"abc123";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = self.functionItems[indexPath.row];
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *tmp = self.functionItems[indexPath.row];
    [self gotoExampleVCWithName:tmp];
}

#pragma mark - Private
- (void)gotoExampleVCWithName:(NSString *)name
{
    NSString *clsString = @"rxpage://RXNoteWebViewController";
    NSInteger index = [self.functionItems indexOfObject:name];
    NSString *value = [self.functionItemURLAddress objectAtIndex:index];
    [RXVCMediator pushInNavigationController:self.navigationController withString:clsString query:@{@"address": value} animate:YES];
}


@end
