//
//  RVRectViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/10.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RVRectViewController.h"

@interface RVRectViewController ()

@property (nonatomic, strong) UIView *vTestParent;

@property (nonatomic, strong) UIView *vTest;

@end

@implementation RVRectViewController

#pragma mark - Private




- (void)printViewInfoWithView:(UIView *)view
{
    NSLog(@"Real:bounds:%@,frame:%@,center:%@\r\n\n", NSStringFromCGRect(view.bounds), NSStringFromCGRect(view.frame), NSStringFromCGPoint(view.center));
}


- (void)testChangeToNewBounds:(CGRect)newBounds view:(UIView *)view
{
    CGRect oldBounds = view.bounds;
    CGRect oldFrame = view.frame;
    CGPoint oldCenter = view.center;
    NSLog(@"Olde:bounds:%@,frame:%@,center:%@", NSStringFromCGRect(oldBounds), NSStringFromCGRect(oldFrame), NSStringFromCGPoint(oldCenter));
    // 推测的算法:
    // 改变bounds的时候,不改变center
    CGPoint newCenter = oldCenter;
    // 改变bounds的时候,frame也会变化的
    CGRect newFrame = oldFrame;
    newFrame.size.width = newBounds.size.width;
    newFrame.size.height = newBounds.size.height;
    newFrame.origin.x = newCenter.x - newFrame.size.width / 2.0f;
    newFrame.origin.y = newCenter.y - newFrame.size.height / 2.0f;
    NSLog(@"gues:bounds:%@,frame:%@,center:%@", NSStringFromCGRect(newBounds), NSStringFromCGRect(newFrame), NSStringFromCGPoint(newCenter));
    // 实际的:
    view.bounds = newBounds;
    [self printViewInfoWithView:view];
    
}


- (void)testChangeToNewFrame:(CGRect)newFrame view:(UIView *)view
{
    CGRect oldBounds = view.bounds;
    CGRect oldFrame = view.frame;
    CGPoint oldCenter = view.center;
    NSLog(@"Olde:bounds:%@,frame:%@,center:%@", NSStringFromCGRect(oldBounds), NSStringFromCGRect(oldFrame), NSStringFromCGPoint(oldCenter));
    // 推测的算法:
    // 改frame的时候,bounds会变化
    CGRect newBounds = oldBounds;
    newBounds.size.width = newFrame.size.width;
    newBounds.size.height = newFrame.size.height;
    // 当frame变化的时候,center是重新变化,变化的规则是:
    // center.x = frame.origin.x + frame.size.width / 2.0f
    // center.y = frame.origin.y + frame.size.height / 2.0f;
    CGPoint newCenter;
    newCenter.x = newFrame.origin.x + newFrame.size.width / 2.0f;
    newCenter.y = newFrame.origin.y + newFrame.size.height / 2.0f;
    NSLog(@"gues:bounds:%@,frame:%@,center:%@", NSStringFromCGRect(newBounds), NSStringFromCGRect(newFrame), NSStringFromCGPoint(newCenter));
    // 实际的:
    view.frame = newFrame;
    [self printViewInfoWithView:view];
}
- (void)testChangeToNewCenter:(CGPoint)newCenter view:(UIView *)view
{
    CGRect oldBounds = view.bounds;
    CGRect oldFrame = view.frame;
    CGPoint oldCenter = view.center;
    NSLog(@"Olde:bounds:%@,frame:%@,center:%@", NSStringFromCGRect(oldBounds), NSStringFromCGRect(oldFrame), NSStringFromCGPoint(oldCenter));
    // 推测的算法:
    // 改变center 的时候, bounds 是不变的
    CGRect newBounds = oldBounds;
    // 改变center 的时候, 只会改变frame的x,y
    CGRect newFrame = oldFrame;
    newFrame.origin.x = newCenter.x - newFrame.size.width / 2.0f;
    newFrame.origin.y = newCenter.y - newFrame.size.height / 2.0f;
    NSLog(@"gues:bounds:%@,frame:%@,center:%@", NSStringFromCGRect(newBounds), NSStringFromCGRect(newFrame), NSStringFromCGPoint(newCenter));
    // 实际的:
    view.center = newCenter;
    [self printViewInfoWithView:view];
}




#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    // 修改frame的x,y的时候会修改center, 修改frame的width,height会修改bounds的width,height和center
    // 修改center的时候,会修改frame的x,y
    // 修改bounds的x,y的时候,不会做任何修改,修改bounds的width,height会修改frame的x,y,width,heigh,但不会修改center(会根据center来修改)
    
    
    
    
    self.vTest = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    self.vTest.backgroundColor = [UIColor redColor];
    
    // 第一次输出
    [self printViewInfoWithView:self.vTest];
    
    
    // 更改frame
    CGRect newFrame = CGRectMake(20, 20, 100, 100);
    [self testChangeToNewFrame:newFrame view:self.vTest];
    
    
    CGPoint newCenter = CGPointMake(90, 90);
    [self testChangeToNewCenter:newCenter view:self.vTest];
    
    CGRect newBounds = CGRectMake(100, 100, 100, 100);
    [self testChangeToNewBounds:newBounds view:self.vTest];
    
    
    
    newFrame = CGRectMake(20, 20, 20, 20);
    [self testChangeToNewFrame:newFrame view:self.vTest];
    
    
    newBounds = CGRectMake(100, 100, 100, 100);
    [self testChangeToNewBounds:newBounds view:self.vTest];
    
    
    
    newBounds = CGRectMake(0, 0, 30, 30);
    [self testChangeToNewBounds:newBounds view:self.vTest];
    
    
    self.vTestParent = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 240, 240)];
    self.vTestParent.backgroundColor = [UIColor greenColor];
    
    [self.vTestParent addSubview:self.vTest];
    [self.view addSubview:self.vTestParent];
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
