//
//  RXUncaughtExceptionHandlerViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/9/6.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXUncaughtExceptionHandlerViewController.h"
#import "JLRoutes.h"
@interface RXUncaughtExceptionHandlerViewController ()

@end

@implementation RXUncaughtExceptionHandlerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(100, 200, 100, 100);
    [button setTitle:@"Test" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [self.view addSubview:button];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animate {
    [super viewDidAppear:animate];
//    __weak __typeof(self) weakSelf = self;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
//        [weakSelf test];
//    });
//    NSURL *viewUserURL = [NSURL URLWithString:@"myapp://user/view/joeldev"];
//    [JLRoutes routeURL:viewUserURL];
    
}

- (void)test {
    NSString *str;
    NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithCapacity:0];
    
    [dic setObject:str forKey:@"ddd"];
    NSLog(@"%@---%@",dic[@"ddd"],dic[@"dddddd"]);
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
