//
//  RXKSViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/8/12.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXKSViewController.h"
#import "KSAdInsertScreenViewController.h"

@interface RXKSViewController ()

@end

@implementation RXKSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self addChildViewController:[KSAdInsertScreenViewController new]];
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
