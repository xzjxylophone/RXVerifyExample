//
//  RVScrollViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/10.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RVScrollViewController.h"

@interface RVScrollViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIScrollView *scrollView;

@end

@implementation RVScrollViewController

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"offset:%@, inset:%@", NSStringFromCGPoint(scrollView.contentOffset), NSStringFromUIEdgeInsets(scrollView.contentInset));
}


#pragma mark - View Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(20, 20, 320, 480)];
    self.scrollView.contentSize = CGSizeMake(320, 960);
    self.scrollView.delegate = self;
    self.scrollView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    self.scrollView.backgroundColor = [UIColor redColor];
    [self.view addSubview:self.scrollView];
    
    
    UIView *v = [[UIView alloc] initWithFrame:CGRectMake(0, -100, 320, 100)];
    v.backgroundColor = [UIColor greenColor];
    [self.scrollView addSubview:v];
    
    
    self.scrollView.contentOffset = CGPointMake(0, -100);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    NSLog(@"offset:%@, inset:%@", NSStringFromCGPoint(self.scrollView.contentOffset), NSStringFromUIEdgeInsets(self.scrollView.contentInset));
    
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
