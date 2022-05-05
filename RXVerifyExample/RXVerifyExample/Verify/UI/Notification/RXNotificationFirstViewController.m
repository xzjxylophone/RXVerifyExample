//
//  RXNotificationFirstViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/13.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXNotificationFirstViewController.h"
#import "RXNotificationSecondViewController.h"

@interface RXNotificationFirstViewController ()

@end

@implementation RXNotificationFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 100, 200, 44);
    [button setTitle:@"click me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)buttonTouchUpInside:(id)sender {
    [self method3];
    
//    [self method4];
}


- (void)method1 {
    RXNotificationSecondViewController *vc = [RXNotificationSecondViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    NSDictionary *userInfo = @{
        @"name":@"Notification",
        @"age":@"18",
        @"height":@"188cm"
    };
    [[NSNotificationCenter defaultCenter] postNotificationName:@"kFirstToSecondNotification" object:nil userInfo:userInfo];
}

- (void)method2 {
    RXNotificationSecondViewController *vc = [RXNotificationSecondViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        NSDictionary *userInfo = @{
            @"name":@"Notification",
            @"age":@"18",
            @"height":@"188cm"
        };
        [[NSNotificationCenter defaultCenter] postNotificationName:@"kFirstToSecondNotification" object:nil userInfo:userInfo];
    }];
}


- (void)method3 {
    RXNotificationSecondViewController *vc = [RXNotificationSecondViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSDictionary *userInfo = @{
            @"name":@"Notification",
            @"age":@"18",
            @"height":@"188cm"
        };
        [[NSNotificationCenter defaultCenter] postNotificationName:@"kFirstToSecondNotification" object:nil userInfo:userInfo];
    });
}

- (void)method4 {
    RXNotificationSecondViewController *vc = [RXNotificationSecondViewController new];
    [self.navigationController pushViewController:vc animated:YES];
    dispatch_async(dispatch_get_main_queue(), ^{
        NSDictionary *userInfo = @{
            @"name":@"Notification",
            @"age":@"18",
            @"height":@"188cm"
        };
        [[NSNotificationCenter defaultCenter] postNotificationName:@"kFirstToSecondNotification" object:nil userInfo:userInfo];
    });
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
