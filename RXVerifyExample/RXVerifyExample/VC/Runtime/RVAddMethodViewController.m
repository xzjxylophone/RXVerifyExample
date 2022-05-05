//
//  RVAddMethodViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/9.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RVAddMethodViewController.h"
#import <objc/runtime.h>

void test() {
    NSLog(@"1111");
}

@interface RVAddMethodViewController ()

@end

@implementation RVAddMethodViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self performSelector:NSSelectorFromString(@"abcc") withObject:nil afterDelay:0];
    [self performSelector:NSSelectorFromString(@"dddd") withObject:nil afterDelay:0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (BOOL)resolveInstanceMethod:(SEL)sel {
    class_addMethod([self class], sel, (IMP)test, "v@");
    return YES;
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
