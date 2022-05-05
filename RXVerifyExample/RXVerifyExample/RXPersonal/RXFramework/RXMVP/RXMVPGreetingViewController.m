//
//  RXMVPGreetingViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/14.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXMVPGreetingViewController.h"

@interface RXMVPGreetingViewController ()
@property (nonatomic, strong) UILabel *label;
@end
@implementation RXMVPGreetingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tgrAction:(id)sender
{
    [self.greetingPresenter showGreeting];
}

- (void)setGreeting:(NSString *)greeting
{
    self.label.text = greeting;
}

@end
