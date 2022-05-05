//
//  RVEventResponseListViewController.m
//  RXVerifyExample
//
//  Created by Zhijun Xu on 22/12/2017.
//  Copyright © 2017 Rush.D.Xzj. All rights reserved.
//

#import "RVEventResponseListViewController.h"

@interface RVEventResponseListViewController ()


@property (nonatomic, strong) UIView *bottomView;
@property (nonatomic, strong) UIView *redView;


@end

@implementation RVEventResponseListViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    CGFloat width = RX_Window_Width;
    CGFloat height = RX_Window_Height;
    CGFloat bottomViewHeight = 50;
    CGFloat bottomViewY = height - bottomViewHeight - 64;
    
    self.bottomView = [[UIView alloc] initWithFrame:CGRectMake(0, bottomViewY, RX_Window_Width, bottomViewHeight)];
    self.bottomView.backgroundColor = [UIColor greenColor];
    
    CGFloat redViewHeight = 100;
    CGFloat redViewY = bottomViewHeight - redViewHeight;
    CGFloat redViewX = (width - redViewHeight) / 2.0f;
    self.redView = [[UIView alloc] initWithFrame:CGRectMake(redViewX, redViewY, redViewHeight, redViewHeight)];
    [self.redView rx_makeRound];
    self.redView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:self.bottomView];
    [self.bottomView addSubview:self.redView];
    
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
