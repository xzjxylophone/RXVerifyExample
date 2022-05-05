//
//  RVCopyViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/9/4.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVCopyViewController.h"
#import "RXCObject.h"

@interface RVCopyViewController ()

@end

@implementation RVCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    RXCObject *tmp = [[RXCObject alloc] init];
    tmp.m_a = 1;
    tmp.m_b = 2;
    tmp.m_c = 3;
    
    RXCObject *copyTmp = [tmp copy];
    
    NSLog(@"copyTmp:%zd, %zd, %zd", copyTmp.m_a, copyTmp.m_b, copyTmp.m_c);
    
    
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
