//
//  RXUIListPerformanceViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/6/20.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXUIListPerformanceViewController.h"
#import "RXUIListPerformanceTableViewImpl.h"
@interface RXUIListPerformanceViewController ()
@property (nonatomic, strong) RXUIListPerformanceTableViewImpl *tableViewImpl;
@end

@implementation RXUIListPerformanceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tableViewImpl = [RXUIListPerformanceTableViewImpl new];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.tableViewImpl addToView:self.view];
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
