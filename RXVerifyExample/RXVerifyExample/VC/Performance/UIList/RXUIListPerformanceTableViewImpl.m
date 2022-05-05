//
//  RXUIListPerformanceTableViewImpl.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/6/20.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXUIListPerformanceTableViewImpl.h"
#import "RXUIListSheelViewController.h"


#import "RXCornerRadiusTableViewImpl.h"


@interface RXUIListPerformanceTableViewImpl()
@property (nonatomic, strong) NSArray *implArray;
@end

@implementation RXUIListPerformanceTableViewImpl
- (id)init
{
    if (self = [super init]) {
        NSArray *array = @[@"RXCornerRadius"];
        self.implArray = @[[RXCornerRadiusTableViewImpl new]];
        self.itemArray = [NSMutableArray arrayWithArray:array];
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.itemArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"abc123";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = self.itemArray[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    UIViewController *vc = [tableView rx_viewController];
    
    
    RXUIListSheelViewController *sheelVC = [RXUIListSheelViewController new];
    sheelVC.tableViewImpl = self.implArray[indexPath.row];
    
    [vc.navigationController pushViewController:sheelVC animated:YES];
}

#pragma mark - Private
- (void)gotoExampleVCWithName:(NSString *)name nc:(UINavigationController *)nc
{
    NSString *clsString = [NSString stringWithFormat:@"rxpage://%@ViewController", name];
    [RXVCMediator pushInNavigationController:nc withString:clsString query:nil animate:YES];
    
}
@end
