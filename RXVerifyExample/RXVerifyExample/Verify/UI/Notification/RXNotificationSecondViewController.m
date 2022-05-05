//
//  RXNotificationSecondViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/13.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXNotificationSecondViewController.h"

@interface RXNotificationSecondViewController ()

@end

@implementation RXNotificationSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(lookupTheInfo:) name:@"kFirstToSecondNotification" object:nil];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}

- (void)lookupTheInfo:(NSNotification *)noti
{
    NSDictionary *userInfo = noti.userInfo;
    NSLog(@"UserInfo:%@",userInfo);
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
