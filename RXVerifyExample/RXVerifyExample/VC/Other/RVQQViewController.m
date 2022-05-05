//
//  RVQQViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/12/22.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVQQViewController.h"
#import <TencentOpenAPI/TencentOAuth.h>
//#import <RX3_TencentLiteSDK/TencentOpenAPI/TencentOAuth.h>
//#import <RX3_XGPush/>
//#import "TencentOAuth.h"
@interface RVQQViewController () <TencentSessionDelegate>

@property (nonatomic, strong) TencentOAuth *tencentOAuth;

@end

@implementation RVQQViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self test];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)test
{
    
    self.tencentOAuth = [[TencentOAuth alloc] initWithAppId:@"101344593" andDelegate:self];
    //4，设置需要的权限列表，此处尽量使用什么取什么。
    NSArray *permissions = [NSArray arrayWithObjects:@"get_user_info",@"get_simple_userinfo",@"add_t",nil];
    
    //    4，登陆
    [self.tencentOAuth authorize:permissions inSafari:NO];
}

#pragma mark - TencentSessionDelegate
//登陆完成调用
- (void)tencentDidLogin
{
    NSLog(@"tencentDidLogin");
//    resultLable.text =@"登录完成";
//    
//    if (tencentOAuth.accessToken &&0 != [tencentOAuth.accessTokenlength])
//    {
//        //  记录登录用户的OpenID、Token以及过期时间
//        tokenLable.text =tencentOAuth.accessToken;
//    }
//    else
//    {
//        tokenLable.text =@"登录不成功没有获取accesstoken";
//    }
}

//非网络错误导致登录失败：
-(void)tencentDidNotLogin:(BOOL)cancelled
{
    NSLog(@"tencentDidNotLogin");
//    if (cancelled)
//    {
//        resultLable.text =@"用户取消登录";
//    }else{
//        resultLable.text =@"登录失败";
//    }
}
// 网络错误导致登录失败：
-(void)tencentDidNotNetWork
{
    NSLog(@"tencentDidNotNetWork");
//    resultLable.text =@"无网络连接，请设置网络";
}



//以上方法基本上就实现了登陆，下来我们得考虑登陆成功之后如何获取用户信息
//其实方法很简单我们在登陆成功的方法里面调用
//
//[tencentOAuth getUserInfo];
//
//然后系统会调用一个方法（我们需要提前实现）
-(void)getUserInfoResponse:(APIResponse *)response
{
    NSLog(@"respons:%@",response.jsonResponse);
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
