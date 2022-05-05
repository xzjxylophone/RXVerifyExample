//
//  RVRefreshViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/10.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RVRefreshViewController.h"
#import "RXRefreshView.h"
@interface RVRefreshViewController () <UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;


@property (nonatomic, strong) RXRefreshView *rxRefreshView;

@end

@implementation RVRefreshViewController

#pragma mark - Action
- (void)refreshAction:(id)sender
{
    [self performSelector:@selector(finishRefreshControl) withObject:nil afterDelay:3 inModes:@[NSRunLoopCommonModes]];
}



- (void)finishRefreshControl
{
    [self.rxRefreshView finishingLoading];
}


#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self.rxRefreshView scrollViewDidScroll];
}
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self.rxRefreshView scrollViewDidEndDragging];
}
#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"kkkkkk";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.backgroundColor = [UIColor clearColor];
    }
    cell.textLabel.text = @"测试测试";
    return cell;
}

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView.backgroundColor = [UIColor redColor];
    self.tableView.tableFooterView = [UIView new];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.rxRefreshView = [RXRefreshView attachToScrollView:self.tableView target:self action:@selector(refreshAction:)];
    
    
    NSLog(@"offset:%@, inset:%@", NSStringFromCGPoint(self.tableView.contentOffset), NSStringFromUIEdgeInsets(self.tableView.contentInset));

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Override
#ifdef __IPHONE_7_0
- (UIRectEdge)edgesForExtendedLayout {
    return UIRectEdgeNone;
}
#endif

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
