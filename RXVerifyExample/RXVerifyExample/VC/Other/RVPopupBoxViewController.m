//
//  RVPopupBoxViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/19.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RVPopupBoxViewController.h"
#import "RXPopView.h"
@interface RVPopupBoxViewController ()

@end

@implementation RVPopupBoxViewController


#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    CGFloat borderWidth = 0.5;
    CGFloat cornerRadius = 10;
    

    RXPopView *pv = [[RXPopView alloc] initWithFrame:CGRectMake(30, 0, 100, 150)];
    pv.borderWidth = borderWidth;
    pv.borderColor = [UIColor grayColor];
    pv.trianglePoint = CGPointMake(4, 7);
    pv.cornerRadius = 5;
    pv.e_RXPopViewStyle = kE_RXPopViewStyle_TopCenter;
    pv.e_RXPopViewStyle = kE_RXPopViewStyle_LeftCenter;
    pv.e_RXPopViewStyle = kE_RXPopViewStyle_BottomCenter;
    pv.e_RXPopViewStyle = kE_RXPopViewStyle_RightCenter;
    
    

    pv.topTrianglePoint = CGPointMake(5, 10);
    pv.leftTrianglePoint = CGPointMake(10, 5);
    pv.bottomTrianglePoint = CGPointMake(5, 10);
    pv.rightTrianglePoint = CGPointMake(10, 5);
    pv.edgeInsets = UIEdgeInsetsMake(50, 75, 50, 75);
    pv.e_RXPopViewStyle = kE_RXPopViewStyle_Top | kE_RXPopViewStyle_Left;
    pv.e_RXPopViewStyle = kE_RXPopViewStyle_Right | kE_RXPopViewStyle_Bottom;
    pv.e_RXPopViewStyle = kE_RXPopViewStyle_Right | kE_RXPopViewStyle_Bottom | kE_RXPopViewStyle_Top | kE_RXPopViewStyle_Left;
    
    

    pv.backgroundView.backgroundColor = [UIColor blackColor];
    

    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(30, 150 + 20, 100, 150)];
    view.layer.borderWidth = borderWidth;
    view.layer.borderColor = [UIColor grayColor].CGColor;
    view.backgroundColor = [UIColor redColor];
    view.layer.cornerRadius = cornerRadius;
    
    [self.view addSubview:pv];
    [self.view addSubview:view];
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
