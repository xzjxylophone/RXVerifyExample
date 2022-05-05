//
//  RXBSDK.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBSDK.h"
#import "RXBHomeViewController.h"
#import "RXComponentRoute.h"

@implementation RXBSDK
+ (void)registerIntoRoute {
    [RXComponentRoute registerViewController:@"bsdk://BHomeVC" block:^id(NSDictionary *params) {
        RXBHomeViewController *vc = [[RXBHomeViewController alloc] initWithParams:params];
        return vc;
    }];
}
@end
