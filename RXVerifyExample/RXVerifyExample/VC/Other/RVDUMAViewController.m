//
//  RVDUMAViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/7/11.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVDUMAViewController.h"
#import "RVDUMAView.h"


@interface RVDUMAViewController () <UIScrollViewDelegate>

@property (nonatomic, strong) UIView *contentView;

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) RVDUMAView *rvDUMAView;
@end

@implementation RVDUMAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.view.backgroundColor = [UIColor redColor];
    
    self.rvDUMAView = [RVDUMAView rxView];
    
    
    self.contentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.rvDUMAView.width, self.rvDUMAView.height)];
    
    
    self.scrollView = [[UIScrollView alloc] initWithFrame:self.contentView.frame];
    self.scrollView.delegate = self;
    self.scrollView.maximumZoomScale = 5;
    self.scrollView.minimumZoomScale = 5;
    self.scrollView.showsVerticalScrollIndicator = NO;
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.contentSize = self.scrollView.frame.size;
    
    
    [self.contentView addSubview:self.rvDUMAView];
    [self.view addSubview:self.contentView];
    
    
//    [self.scrollView addSubview:self.rvDUMAView];
//    [self.view addSubview:self.scrollView];
}

#pragma mark - UIScrollViewDelegate
- (nullable UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return self.rvDUMAView;
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
