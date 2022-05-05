//
//  RXVolumeViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/4/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXVolumeViewController.h"
#import "RXVolumeTestManager.h"
@interface RXVolumeViewController ()
@property (nonatomic, strong) RXVolumeTestManager *manager;
@end

@implementation RXVolumeViewController


- (IBAction)playTouchUpInside:(id)sender {
    [self.manager play];
}


#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.manager = [RXVolumeTestManager sharedInstance];
    [self.manager printInfo];
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//
//        [manager changeSystemVolume:0.9];
//    });
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(10 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [manager printInfo];
//    });
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
