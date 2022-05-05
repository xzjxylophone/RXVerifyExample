//
//  RXOCKWKindofViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/7/16.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXOCKWKindofViewController.h"

// https://blog.csdn.net/gang544043963/article/details/60880063
// https://happyteamlabs.com/blog/how-to-use-__kindof-in-objective-c/
@interface RXOCKWKindofViewController ()

@property (nonatomic, copy) NSArray *array1;
// 泛型
@property (nonatomic, copy) NSArray <UIView *> *array2;
@property (nonatomic, copy) NSArray <__kindof UIView *> *array3;


@property (nonatomic, copy) NSMutableArray <UIView *> *mutArray1;
@end

@implementation RXOCKWKindofViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.array1 = @[@(1), @"a", [UIView new]];
    
    self.array2 = @[[UIView new], [UIView new]];
    // 以前会警告,现在已经不警告了~!
    self.array2 = @[[UIView new], [UIButton new], [UITableView new]];
    
    self.array3 = @[[UIView new], [UIButton new], [UITableView new]];
    
    
    self.mutArray1 = [NSMutableArray new];
    [self.mutArray1 addObject:[UIView new]];
    [self.mutArray1 addObject:[UIButton new]];
    [self.mutArray1 addObject:[UITableView new]];
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
