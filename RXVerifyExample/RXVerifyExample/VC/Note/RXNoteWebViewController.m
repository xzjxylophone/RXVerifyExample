//
//  RXNoteWebViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2021/12/9.
//  Copyright © 2021 Rush.D.Xzj. All rights reserved.
//

#import "RXNoteWebViewController.h"
#import <WebKit/WebKit.h>


@interface RXNoteWebViewController ()<WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *wkWebView;

@property (nonatomic, copy) NSString *urlAddress;

@end

@implementation RXNoteWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.urlAddress = self.rx_query[@"address"];
    self.wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    [self.view addSubview:self.wkWebView];
    // Do any additional setup after loading the view from its nib.
    self.wkWebView.navigationDelegate = self;
    NSString *str = [[NSUserDefaults standardUserDefaults] objectForKey:self.urlAddress];
    if (str.length == 0) {
        str = self.urlAddress;
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
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(null_unspecified WKNavigation *)navigation withError:(NSError *)error {
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation {
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation {
    NSString *urlStr = webView.URL.absoluteString;
    if ([urlStr containsString:@"9txs.org"]) {
        [[NSUserDefaults standardUserDefaults] setValue:urlStr forKey:self.urlAddress];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler {
    
    NSURL *url = navigationAction.request.URL;
    NSString *urlStr = url.absoluteString;
    
    if ([urlStr containsString:@"9txs.cc"]) {
        decisionHandler(WKNavigationActionPolicyCancel);
        NSString *newURL = [urlStr stringByReplacingOccurrencesOfString:@"9txs.cc" withString:@"9txs.org"];
        [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:newURL]]];
    } else {
        decisionHandler(WKNavigationActionPolicyAllow);
    }
    
}


@end
