//
//  RXParentViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/8/14.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXParentViewController.h"
#import "RXChild1ViewController.h"
#import "RXChild2ViewController.h"
#import "RXChild3ViewController.h"
#import "RXChild4ViewController.h"

@interface RXParentViewController ()

@property (nonatomic, strong) RXChild1ViewController *child1VC;
@property (nonatomic, strong) RXChild2ViewController *child2VC;
@property (nonatomic, strong) RXChild3ViewController *child3VC;
@property (nonatomic, strong) RXChild4ViewController *child4VC;

@property (nonatomic, strong) UIView *tmpView;

@end

@implementation RXParentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.tmpView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    // 会崩溃
//    self.tmpView = [[UIWindow alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    
//    [UIApplication sharedApplication].windows
    
    self.child1VC = [RXChild1ViewController new];
    self.child2VC = [RXChild2ViewController new];
    self.child3VC = [RXChild3ViewController new];
    self.child4VC = [RXChild4ViewController new];
    
    [self addChildViewController:self.child3VC];
    [self addChildViewController:self.child1VC];
    [self addChildViewController:self.child2VC];
    [self addChildViewController:self.child4VC];
    
    
    [self.view addSubview:self.child1VC.view];
    [self.view addSubview:self.child3VC.view];
    [self.view addSubview:self.child2VC.view];
//    [self.view addSubview:self.child4VC.view];
    
//    self.child4VC.view;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.view addSubview:self.child4VC.view];
        
//        self.child4VC.view.hidden = YES;
//        [self.tmpView addSubview:self.child4VC.view];
        
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self.child4VC.view removeFromSuperview];
//        });
    });
}

- (void)viewDidAppear:(BOOL)animated {
    NSLog(@"parent didAppear superview:%@", self.view.superview);
    [super viewDidAppear:animated];
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
}
- (void)viewDidDisappear:(BOOL)animated {
    
    NSLog(@"parent didDisappear superview:%@", self.view.superview);
    [super viewDidDisappear:animated];
    NSLog(@"%@ %@", NSStringFromClass([self class]), NSStringFromSelector(_cmd));
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
