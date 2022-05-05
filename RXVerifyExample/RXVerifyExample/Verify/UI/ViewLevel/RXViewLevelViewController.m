//
//  RXViewLevelViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/6.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXViewLevelViewController.h"
#import "VKRaptorView.h"
#import <Masonry/Masonry.h>
@interface RXViewLevelViewController ()
@property (nonatomic, strong) VKRaptorView *raptorView;
@end

@implementation RXViewLevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.raptorView = [[VKRaptorView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.raptorView];
    [self.raptorView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(0);
        make.left.equalTo(self.view).offset(0);
        make.right.equalTo(self.view).offset(0);
        make.bottom.equalTo(self.view).offset(0);
    }];
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
