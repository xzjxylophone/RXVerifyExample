//
//  RVWebViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/7/28.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVWebViewController.h"
#import <WebKit/WebKit.h>

#define RX_WebLastURL   @"RX_WebLastURL"

@interface RVWebViewController () <WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *wkWebView;


@end

@implementation RVWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.wkWebView];
    // Do any additional setup after loading the view from its nib.
    self.wkWebView.navigationDelegate = self;
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:RX_WebLastURL];
    if (str.length == 0) {
        str = @"https://www.9txs.cc/book/290750/1613199.html";
    }
    NSURL *url = [NSURL URLWithString:str];
    NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
    [self.wkWebView loadRequest:urlRequest];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - WKNavigationDelegate
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation {
    NSLog(@"111");
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
    NSLog(@"111");
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
    NSLog(@"111");
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSURL *url = navigationAction.request.URL;
    NSString * urlStr = url.absoluteString;
    
    if ([urlStr containsString:@"9txs.cc"]) {
        decisionHandler(WKNavigationActionPolicyCancel);
        NSString *newURL = [urlStr stringByReplacingOccurrencesOfString:@"9txs.cc" withString:@"9txs.org"];
        [[NSUserDefaults standardUserDefaults] setValue:newURL forKey:RX_WebLastURL];
        [[NSUserDefaults standardUserDefaults] synchronize];
        [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:newURL]]];
    } else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
    
}

@end
