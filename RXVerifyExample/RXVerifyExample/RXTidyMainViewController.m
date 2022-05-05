//
//  RXTidyMainViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/12.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXTidyMainViewController.h"

@interface RXTidyMainViewController ()

@end

@implementation RXTidyMainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Tidy Main";
    
    NSAutoreleasePool *pool = [NSAutoreleasePool new];
    SEL sel = NSSelectorFromString(@"showPools");
//    [pool performSelector:sel];
    
    [NSAutoreleasePool performSelector:sel];
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
