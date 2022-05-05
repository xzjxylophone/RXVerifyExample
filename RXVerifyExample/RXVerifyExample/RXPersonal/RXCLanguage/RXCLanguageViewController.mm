//
//  RXCLanguageViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/5.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXCLanguageViewController.h"
#import "rx-objc-runtime-new.h"
@interface RXCLanguageViewController ()

@end

@implementation RXCLanguageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self test_rx_bucket_t];
    
    UIView *view;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)test_rx_bucket_t
{
    struct rx_bucket_t bucket;
    bucket.set(10, 20);
    NSLog(@"%zd", bucket.a());
    
    struct rx_bucket_t *bucket2 = NULL;
    NSObject *obj = nil;
    NSObject *obj2 = Nil;
    NSLog(@"%zd", bucket.a());
    
    
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
