//
//  RXCSJViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2021/9/14.
//  Copyright © 2021 Rush.D.Xzj. All rights reserved.
//

#import "RXCSJViewController.h"
#import "RXCSJView.h"
#import "RXExpressAdView.h"

@interface RXCSJViewController ()
@property (nonatomic, strong) RXExpressAdView *expressAdView;
@end

@implementation RXCSJViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self testView];
//    [self testVC];
}

- (void)dealloc {
//    for (UIView *ttAdView in self.AdView.subViews) {
//        [ttAdView removeObserver:self forKeyPath:@"frame"];
//    }
}

//- (void)testVC {
//    RXExpressAdView *expressAdView = [[RXExpressAdView alloc] initWithFrame:CGRectMake(0, 100, 50, 50)];
//    self.expressAdView = expressAdView;
//
//    RXCSJNextViewController *vc = [RXCSJNextViewController new];
//
//    [self.navigationController pushViewController:vc animated:YES];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [vc.view addSubview:expressAdView];
//    });
//
//
//    [expressAdView addObserver:vc forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
//
//    [expressAdView changeFrameAfter3Second];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.navigationController popViewControllerAnimated:YES];
//    });
//}


// 2. 1秒钟之后
- (void)testView {
    // 1. 创建广告View
    RXExpressAdView *expressAdView = [[RXExpressAdView alloc] initWithFrame:CGRectMake(0, 0, 50, 50)];
    self.expressAdView = expressAdView;
    
    // 2. 创建一个临时的View
    RXCSJView *csjView = [[RXCSJView alloc] initWithFrame:CGRectMake(0, 100, 200, 200)];
    [csjView addSubview:expressAdView];
    [self.view addSubview:csjView];
    
    // 3. 给广告View添加一个frame的观察者(csjView)
    [expressAdView addObserver:csjView forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:nil];
    
    // 4. 广告view 3秒后 更新frame
    [expressAdView changeFrameAfter3Second];
    
    // 5 csjView 对象销毁
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [csjView removeFromSuperview];
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
