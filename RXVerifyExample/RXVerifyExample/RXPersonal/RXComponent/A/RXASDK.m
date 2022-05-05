//
//  RXASDK.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXASDK.h"
#import "RXComponentRoute.h"
#import "RXAHomeViewController.h"
@implementation RXASDK

+ (void)registerIntoRoute {
    [RXComponentRoute registerViewController:@"asdk://AHomeVC" block:^id(NSDictionary *params) {
        RXAHomeViewController *vc = [[RXAHomeViewController alloc] initWithParams:params];
        return vc;
    }];
    
    [RXComponentRoute registerSyncData:@"asdk://syncData" block:^id(NSDictionary *params) {
        NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:params];
        dic[@"otherKey"] = @"asglksgjslkd";
        return dic;
    }];
    
    
    [RXComponentRoute registerAsyncData:@"asdk://asyncData" block:^void(NSDictionary *params) {
        void(^completion)(NSDictionary *) = params[kRXComponetRouteAsyncDataCompletionKey];
        if (completion == nil) {
            return;
        }
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
            NSMutableDictionary *dic = [NSMutableDictionary dictionaryWithDictionary:params];
            dic[@"otherKey"] = @"otherKey_async_data";
            [dic removeObjectForKey:kRXComponetRouteAsyncDataCompletionKey];
            completion(dic);
        });
    }];
    
    
    
}
@end
