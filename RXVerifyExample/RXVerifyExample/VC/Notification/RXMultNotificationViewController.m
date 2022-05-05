//
//  RXMultNotificationViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/6/13.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXMultNotificationViewController.h"
#define NKey_RXMultNotificationViewController_Demo     @"NKey_RXMultNotificationViewController_Demo"
@interface RXMultNotificationViewController ()

@end

@implementation RXMultNotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(nkey_RXMultNotificationViewController_Demo:) name:NKey_RXMultNotificationViewController_Demo object:nil];
    
    
    
    // 各种设计测试用例,调试
    // 开发功能
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)__private_kkk
{
    
}

- (void)nkey_RXMultNotificationViewController_Demo:(id)sender
{
    
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
