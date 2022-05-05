//
//  RVWYViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/19.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RVWYViewController.h"
#import "RXLimitView.h"
#import "RXInfiniteView.h"
#import "RXLabelView.h"

@interface RVWYViewController ()<UITableViewDataSource, UITableViewDelegate, RXInfiniteViewDataSource>


@property (nonatomic, strong) RXLabelView *infiniteTopView;
@property (nonatomic, strong) RXInfiniteView *rxInfiniteView;


@property (nonatomic, strong) UIView *topView;

@end

@implementation RVWYViewController

#pragma mark - Private
- (UIView *)viewWithInRXInfiniteView:(RXInfiniteView *)infiniteView data:(id)data reuseView:(UIView *)reuseView
{
    UITableView *tableView = nil;
    if (reuseView == nil) {
        
        tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, infiniteView.width, infiniteView.height)];
        tableView.delegate = self;
        tableView.dataSource = self;
    } else {
        tableView = (UITableView *)reuseView;
    }
    tableView.tag = [data integerValue] + 1000;
    [tableView reloadData];
    return tableView;
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    NSLog(@"scrollViewDidEndDecelerating:scrollView:%@", scrollView);
    
//    if (scrollView.contentOffset.y < 0) {
//        CGFloat offset = fabs(scrollView.contentOffset.y);
//        if (offset > 80) {
//            scrollView.contentInset = UIEdgeInsetsMake(self.topView.height, 0, 0, 0);
//        }
//    }

}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
}

#pragma mark - RXInfiniteViewDataSource
- (UIView *)curViewInRXInfiniteView:(RXInfiniteView *)infiniteView reuseView:(UIView *)reuseView
{
    id curData = infiniteView.curData;
    UIView *view = [self viewWithInRXInfiniteView:infiniteView data:curData reuseView:reuseView];
    [view addSubview:self.topView];
    return view;
}
- (UIView *)preViewInRXInfiniteView:(RXInfiniteView *)infiniteView reuseView:(UIView *)reuseView
{
    id preData = [self preDataInRXInfiniteView:infiniteView];
    return [self viewWithInRXInfiniteView:infiniteView data:preData reuseView:reuseView];
}
- (UIView *)nextViewInRXInfiniteView:(RXInfiniteView *)infiniteView reuseView:(UIView *)reuseView
{
    id nextData = [self nextDataInRXInfiniteView:infiniteView];
    return [self viewWithInRXInfiniteView:infiniteView data:nextData reuseView:reuseView];
}

- (id)preDataInRXInfiniteView:(RXInfiniteView *)infiniteView
{
    NSInteger cur = [infiniteView.curData integerValue];
    return @(cur - 1);
}
- (id)nextDataInRXInfiniteView:(RXInfiniteView *)infiniteView
{
    NSInteger cur = [infiniteView.curData integerValue];
    return @(cur + 1);
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 30;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"klsjglksgj";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%zd", tableView.tag];
    return cell;
}


#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat height = [UIScreen mainScreen].bounds.size.height;
    
    CGFloat topViewHeight = 30;

    self.infiniteTopView = [[RXLabelView alloc] initWithFrame:CGRectMake(0, 0, width, topViewHeight)];
    [self.infiniteTopView updateConstraintsWithLeft:10];
    self.infiniteTopView.label.text = @"无限的";
    self.infiniteTopView.backgroundColor = [UIColor greenColor];
    
    
    
    CGFloat inHeight = height - topViewHeight - 64;
    CGFloat inY = topViewHeight;
    
    
    
    self.topView = [[UIView alloc] initWithFrame:CGRectMake(0, -inHeight, width, inHeight)];
    self.topView.backgroundColor = [UIColor redColor];
    
    self.rxInfiniteView = [[RXInfiniteView alloc] initWithFrame:CGRectMake(0, inY, width, inHeight)];
    self.rxInfiniteView.dataSource = self;
    self.rxInfiniteView.curData = @(100);
    [self.rxInfiniteView reloadData];
    
    
    
    
    [self.view addSubview:self.infiniteTopView];
    [self.view addSubview:self.rxInfiniteView];
}
- (void)initializeAction
{
    
}


#pragma mark - View Life Cycle


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initializeUIAndData];
    [self initializeAction];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
