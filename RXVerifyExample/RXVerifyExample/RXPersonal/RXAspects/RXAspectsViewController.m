//
//  RXAspectsViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/2.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAspectsViewController.h"
#import "RXAspectsTestObject.h"
@interface RXAspectsViewController ()

@end

@implementation RXAspectsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self test1];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test1 {
    RXAspectsTestObject *obj = [RXAspectsTestObject new];
    [obj test];
    
    [RXAspectsTestObject test];
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
