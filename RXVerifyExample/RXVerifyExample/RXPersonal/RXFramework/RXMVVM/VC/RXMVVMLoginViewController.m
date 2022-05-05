//
//  RXMVVMLoginViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/6/27.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXMVVMLoginViewController.h"
#import "RXMVVMLoginViewModel.h"
@interface RXMVVMLoginViewController ()

@property (nonatomic, strong) RXMVVMLoginViewModel *loginViewModel;

@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *pwdTextField;
@property (nonatomic, strong) UIButton *loginButton;

@end

@implementation RXMVVMLoginViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    self.loginViewModel = [RXMVVMLoginViewModel new];
    
    CGFloat width = 200;
    CGFloat height = 44;
    
    CGFloat x = 20;
    CGFloat yOffset = 20;
    CGFloat nameTextFieldY = 100;
    CGFloat pwdTextFieldY = nameTextFieldY + height + yOffset;
    CGFloat loginButtonY = pwdTextFieldY + height + yOffset;
    
    self.nameTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, nameTextFieldY, width, height)];
    self.nameTextField.placeholder = @"输入用户名";
    
    self.pwdTextField = [[UITextField alloc] initWithFrame:CGRectMake(x, pwdTextFieldY, width, height)];
    self.pwdTextField.placeholder = @"输入密码";
    
    self.loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    self.loginButton.frame = CGRectMake(x, loginButtonY, width, height);
    [self.loginButton setTitle:@"登录" forState:UIControlStateNormal];
    [self.loginButton addTarget:self action:@selector(loginButtonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [self.loginButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    
    [self.view addSubview:self.nameTextField];
    [self.view addSubview:self.pwdTextField];
    [self.view addSubview:self.loginButton];
    
    [self rx_tapAnywhereToHideKeyboard];
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Action
- (void)loginButtonTouchUpInside:(id)sender
{
    
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
