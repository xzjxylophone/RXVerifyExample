

//
//  RVTransformViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/11.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RVTransformViewController.h"

@interface RVTransformViewController ()

@end

@implementation RVTransformViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
    
    UIView *parent1View = [[UIView alloc] initWithFrame:CGRectMake(20, 20, 200, 200)];
    parent1View.backgroundColor = [UIColor redColor];

    
    UIView *parent2View = [[UIView alloc] initWithFrame:CGRectMake(20, 240, 200, 200)];
    parent2View.backgroundColor = [UIColor redColor];
    
    
    
    
    
    
    
    
    UIView *test1View = [[UIView alloc] initWithFrame:CGRectMake(40, 40, 40, 40)];
    test1View.backgroundColor = [UIColor greenColor];
    
    
    UIView *test2View = [[UIView alloc] initWithFrame:CGRectMake(40, 40, 40, 40)];
    test2View.backgroundColor = [UIColor greenColor];
    
    
    
    
    [parent1View addSubview:test1View];
    [parent2View addSubview:test2View];
    
    
    
    
    
    test2View.transform = CGAffineTransformMakeScale(0.5f, 0.5f);
    test2View.transform = CGAffineTransformTranslate(test2View.transform, 40, 40);
    test2View.transform = CGAffineTransformRotate(test2View.transform, M_PI / 4);
    
    
    test2View.transform = CGAffineTransformIdentity;
    
    
    
    [self.view addSubview:parent1View];
    [self.view addSubview:parent2View];
    
    
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
