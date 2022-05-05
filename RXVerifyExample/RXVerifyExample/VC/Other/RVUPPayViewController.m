//
//  RVUPPayViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 16/1/13.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVUPPayViewController.h"
#import "UPPaymentControl.h"
@interface RVUPPayViewController ()<NSURLConnectionDelegate>


@property (nonatomic, strong) NSMutableData *responseData;

@end

@implementation RVUPPayViewController
- (IBAction)sampleButtonTouchUpInside:(id)sender
{
    
    NSURL * url = nil;
    url = [NSURL URLWithString:@"http://101.231.204.84:8091/sim/getacptn"]; // 银联demo地址
    url = [NSURL URLWithString:@"http://test.api.yiyizuche.cn/service/v2/3/buildUnionpaySDK.do"]; // 壹壹租车demo逻辑
    NSURLRequest *urlRequest=[NSURLRequest requestWithURL:url];
    NSURLConnection *urlConn = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    [urlConn start];
    
}



#pragma mark - NSURLConnectionDelegate
- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse*)response
{
    NSHTTPURLResponse* rsp = (NSHTTPURLResponse*)response;
    NSInteger code = [rsp statusCode];
    if (code != 200) {
        [connection cancel];
    } else {
        self.responseData = [[NSMutableData alloc] init];
    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    [self.responseData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // 壹壹租车的逻辑
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:self.responseData options:NSJSONReadingMutableLeaves error:nil];
    NSString *returnContent = dic[@"returnContent"];
    if (returnContent.length > 0) {
        NSLog(@"returnContent=%@",returnContent);
        [[UPPaymentControl defaultControl] startPay:returnContent fromScheme:@"UPPayDemo" mode:@"01" viewController:self];
        
    }
    
//    // 银联Demo的逻辑
//    NSString *tn = [[NSMutableString alloc] initWithData:self.responseData encoding:NSUTF8StringEncoding];
//    if (tn.length > 0) {
//        NSLog(@"tn=%@",tn);
//        [[UPPaymentControl defaultControl] startPay:tn fromScheme:@"UPPayDemo" mode:@"01" viewController:self];
//        
//    }
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
}

#pragma mark UPPayPluginResult
- (void)UPPayPluginResult:(NSString *)result
{
    NSString* msg = [NSString stringWithFormat:@"支付结果：%@", result];
    NSLog(@"%@", msg);
}

#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
}
- (void)initializeAction
{
    
}


#pragma mark - View Life Cycle


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initializeUIAndData];
    [self initializeAction];
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
