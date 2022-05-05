//
//  RXAnimationViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/2/20.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXAnimationViewController.h"
#import "RXAnimationTestObject.h"
@interface RXAnimationViewController ()



@property (nonatomic, strong) UIView *parentView;

@property (nonatomic, strong) UIView *animationView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *line2View;
@property (nonatomic, strong) UIView *line3View;
@property (nonatomic, strong) UIView *line4View;
@property (nonatomic, strong) UIView *line5View;

@end

@implementation RXAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.parentView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 320, 1000)];
    self.parentView.backgroundColor = [UIColor whiteColor];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    
    
    CGFloat startY = 100;
    CGFloat viewWidth = 200;

    self.animationView = [[UIView alloc] initWithFrame:CGRectMake(100, startY, viewWidth, viewWidth)];
    self.animationView.backgroundColor = [UIColor redColor];
    
    self.lineView = [[UIView alloc] initWithFrame:CGRectMake(0, startY + viewWidth / 2.0f, width, 1)];
    self.lineView.backgroundColor = [UIColor redColor];
    
    self.line2View = [[UIView alloc] initWithFrame:CGRectMake(0, startY + viewWidth, width, 1)];
    self.line2View.backgroundColor = [UIColor redColor];
    
    
    self.line3View = [[UIView alloc] initWithFrame:CGRectMake(0, startY, width, 1)];
    self.line3View.backgroundColor = [UIColor redColor];
    
    
    
    
    [self.view addSubview:self.parentView];
    
    [self.parentView addSubview:self.animationView];
    [self.parentView addSubview:self.lineView];
    [self.parentView addSubview:self.line2View];
    [self.parentView addSubview:self.line3View];
    [self.parentView addSubview:self.line4View];
    [self.parentView addSubview:self.line5View];
    
    
    
//    [self test];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        // 坐标也是不正确的
//        [self test];
//    });
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (void)test {
    RXAnimationTestObject *tmp = [RXAnimationTestObject new];
    [tmp testWithView:self.animationView];
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
