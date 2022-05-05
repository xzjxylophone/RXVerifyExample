//
//  RVArrayCopyViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/9.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RVArrayCopyViewController.h"

@interface RVArrayCopyViewController ()

@end

@implementation RVArrayCopyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test {
    NSArray *ary1 = @[@(1), @(2)];
    id ary2 = [ary1 copy];
    id ary3 = [ary1 mutableCopy];
    
    printf("\n==========NSArray==========\n");
    printf("ary1 class:%s, address:%p\n", [NSStringFromClass([ary1 class]) UTF8String], ary1);
    printf("ary2 class:%s, address:%p\n", [NSStringFromClass([ary2 class]) UTF8String], ary2);
    printf("ary3 class:%s, address:%p\n", [NSStringFromClass([ary3 class]) UTF8String], ary3);
    
    NSMutableArray *ary4 = [NSMutableArray arrayWithArray:@[@(1), @(2)]];
    id ary5 = [ary4 copy];
    id ary6 = [ary4 mutableCopy];
    printf("\n==========NSMutableArray==========\n");
    printf("ary4 class:%s, address:%p\n", [NSStringFromClass([ary4 class]) UTF8String], ary4);
    printf("ary5 class:%s, address:%p\n", [NSStringFromClass([ary5 class]) UTF8String], ary5);
    printf("ary6 class:%s, address:%p\n", [NSStringFromClass([ary6 class]) UTF8String], ary6);
    
    NSArray *ary7 = [NSMutableArray arrayWithArray:@[@(1), @(2)]];
    id ary8 = [ary7 copy];
    id ary9 = [ary7 mutableCopy];
    printf("\n==========Pretend NSArray==========\n");
    printf("ary7 class:%s, address:%p\n", [NSStringFromClass([ary7 class]) UTF8String], ary7);
    printf("ary8 class:%s, address:%p\n", [NSStringFromClass([ary8 class]) UTF8String], ary8);
    printf("ary9 class:%s, address:%p\n", [NSStringFromClass([ary9 class]) UTF8String], ary9);
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
