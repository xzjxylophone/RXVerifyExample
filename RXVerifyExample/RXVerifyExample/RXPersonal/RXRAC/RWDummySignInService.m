//
//  RWDummySignInService.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/7/16.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//


#import "RWDummySignInService.h"


@implementation RWDummySignInService


- (void)signInWithUsername:(NSString *)username password:(NSString *)password complete:(RWSignInResponse)completeBlock {
    
    double delayInSeconds = 2.0;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        BOOL success = [username isEqualToString:@"user"] && [password isEqualToString:@"123456"];
        completeBlock(success);
    });
}


@end
