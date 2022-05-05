//
//  RXStrangeBViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXStrangeBViewController.h"

@interface RXStrangeBViewController ()
@property (nonatomic, strong) UIView *strangeView;

@end

@implementation RXStrangeBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.strangeView];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (id)initWithView:(UIView *)view {
    if (self = [self initWithNibName:nil bundle:nil]) {
        self.strangeView = view;
    }
    return self;
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
