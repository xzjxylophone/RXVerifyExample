//
//  RVMsgForwardViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/9.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RVMsgForwardViewController.h"
#import "RVMsgForward.h"
@interface RVMsgForwardViewController ()

@end

@implementation RVMsgForwardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)test {
//    [[RVMsgForward new] performSelector:NSSelectorFromString(@"test") withObject:nil afterDelay:0];
    
    
    [RVMsgForward performSelector:NSSelectorFromString(@"testClass") withObject:nil afterDelay:0];
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
