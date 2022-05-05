//
//  RXJSViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2020/7/7.
//  Copyright © 2020 Rush.D.Xzj. All rights reserved.
//

#import "RXJSViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

// https://www.jianshu.com/p/ac534f508fb0
@interface RXJSViewController ()

@end

@implementation RXJSViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *resourcePath = [[NSBundle mainBundle] pathForResource:@"rxtest" ofType:@".js"];
    NSString *str = [NSString stringWithContentsOfFile:resourcePath encoding:NSUTF8StringEncoding error:nil];
    JSContext *context = [JSContext new];
    [context evaluateScript:str];
    
    context[@"mul4"] = ^(NSInteger a, NSInteger b) {
        return a + b;
    };
    context[@"mul5"] = ^(NSDictionary *params) {
        NSString *v1 = params[@"abc"];
        return @{@"def": v1};
    };
    
    [self testWithContext:context];
    [self test3WithContext:context];
    [self test5WithContext:context];
   
}

- (void)testWithContext:(JSContext *)context {
    JSValue *value = [context evaluateScript:@"mul(2, 3)"];
    NSLog(@"test value：%@", value);
}

- (void)test3WithContext:(JSContext *)context {
    JSValue *value = [context evaluateScript:@"mul3(2, 3)"];
    NSLog(@"test3 value：%@", value);
}
- (void)test5WithContext:(JSContext *)context {
    NSDictionary *dic = @{@"abc": @"abcdefgh"};
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:nil];
    NSString *jsonString = [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
    NSString *js = [NSString stringWithFormat:@"mul5(%@)", jsonString];
    JSValue *value = [context evaluateScript:js];
    NSDictionary *resultDic = [value toObject];
    NSLog(@"test5 value：%@", resultDic);
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
