//
//  RXLayoutViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/2/13.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXLayoutViewController.h"
#import "RXLayoutView.h"
#import "RXExternUtil.h"

@interface RXLayoutViewController ()

@end

@implementation RXLayoutViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
//    [self _test_layoutSubviews_zeroFrame];
    
    [self _test_layoutSubviews_noneZeroFrame];
    
//    [self _test_layoutSubviews_noneZeroFrame_changeFrame];
    
//    [self _test_layoutSubviews_noneZeroFrame_layoutIfNeeded];
    
//    [self _test_layoutSubviews_noneZeroFrame_changeFrame_layoutIfNeeded];
    
//    [self _test_layoutSubviews_noneZeroFrame_setNeedsLayout];
    
//    [self _test_layoutSubviews_noneZeroFrame_changeFrame_setNeedsLayout];
    
//    _objc_autoreleasePoolPrint();
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)_test_layoutSubviews_zeroFrame
{
    RXLayoutView *view = [[RXLayoutView alloc] init];
    printf("after alloc init\n");
    [self.view addSubview:view];
    printf("after add\n");
}
- (void)_test_layoutSubviews_noneZeroFrame
{
    RXLayoutView *view = [[RXLayoutView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    printf("after alloc initWithFrame\n");
    [self.view addSubview:view];
    
    printf("after add\n");
}

- (void)_test_layoutSubviews_noneZeroFrame_changeFrame
{
    RXLayoutView *view = [[RXLayoutView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    printf("after alloc initWithFrame\n");
    [self.view addSubview:view];
    printf("after add\n");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            printf("before change frame\n");
            view.frame = CGRectMake(50, 200, 100, 200);
            printf("after change frame\n");
        });
    });
}

- (void)_test_layoutSubviews_noneZeroFrame_layoutIfNeeded
{
    RXLayoutView *view = [[RXLayoutView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    printf("after alloc initWithFrame\n");
    [self.view addSubview:view];
    printf("after add\n");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            printf("before layoutIfNeeded\n");
            [view layoutIfNeeded];
            printf("after layoutIfNeeded\n");
        });
    });
}

- (void)_test_layoutSubviews_noneZeroFrame_changeFrame_layoutIfNeeded
{
    RXLayoutView *view = [[RXLayoutView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    printf("after alloc initWithFrame\n");
    [self.view addSubview:view];
    printf("after add\n");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            printf("before change frame and layoutIfNeeded\n");
            view.frame = CGRectMake(100, 200, 200, 200);
            [view layoutIfNeeded];
            printf("after change frame and layoutIfNeeded\n");
        });
    });
}

- (void)_test_layoutSubviews_noneZeroFrame_setNeedsLayout
{
    RXLayoutView *view = [[RXLayoutView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    printf("after alloc initWithFrame\n");
    [self.view addSubview:view];
    printf("after add\n");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            printf("before setNeedsLayout\n");
            [view setNeedsLayout];
            printf("after setNeedsLayout\n");
        });
    });
}


- (void)_test_layoutSubviews_noneZeroFrame_changeFrame_setNeedsLayout
{
    RXLayoutView *view = [[RXLayoutView alloc] initWithFrame:CGRectMake(100, 200, 100, 100)];
    printf("after alloc initWithFrame\n");
    [self.view addSubview:view];
    printf("after add\n");
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            printf("before change frame and setNeedsLayout\n");
            view.frame = CGRectMake(100, 200, 200, 200);
            printf("after change frame and before setNeedsLayout\n");
            [view setNeedsLayout];
            printf("after change frame and setNeedsLayout\n");
        });
    });
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
