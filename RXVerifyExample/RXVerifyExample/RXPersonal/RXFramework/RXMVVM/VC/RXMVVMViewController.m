//
//  RXMVVMViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/26.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXMVVMViewController.h"
#import "RXMVVMView.h"
@interface RXMVVMViewController ()

@end

@implementation RXMVVMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    RXMVVMView *view = [RXMVVMView new];
    
    
    [self.view addSubview:view];
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
