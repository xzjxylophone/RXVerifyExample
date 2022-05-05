//
//  RXVRCViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/9/12.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXVRCViewController.h"

#import "RXVRCView.h"

@interface RXVRCViewController ()

@property (nonatomic, strong) RXVRCView *vrcView;

@end

@implementation RXVRCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.vrcView = [RXVRCView new];
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [self.vrcView addSubview:v1];
    NSLog(@"v1:%@", v1);
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.vrcView];
    
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
