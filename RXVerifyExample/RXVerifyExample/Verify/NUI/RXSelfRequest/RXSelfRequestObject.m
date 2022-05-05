//
//  RXSelfRequestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/4.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXSelfRequestObject.h"

@implementation RXSelfRequestObject
- (void)start {
    NSLog(@"0");
    [self.delegate requesetFinished:self];
    // 不可预知的行为
    if (self.completionBlock) {
        NSLog(@"1");
        self.completionBlock(self);
        NSLog(@"2");
        self.completionBlock = nil;
        NSLog(@"3");
    } else {
        NSLog(@"3.1");
    }
    NSLog(@"4");
}
@end
