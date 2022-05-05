//
//  RXARCCallObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCCallObject.h"
#import "RXMRCUtil.h"
@implementation RXARCCallObject

- (void)test
{
    
    
    self.requestObject = [RXARCRequestObject new];
    NSLog(@"1111 count:%zd", [RXMRCUtil objectRetainCount:self.requestObject]);
    self.requestObject.delegate = self;
//    [self.requestObject start];
    
    [_requestObject start];
}

- (void)test2
{
    self.requestObject = [RXARCRequestObject new];
    self.requestObject.delegate = self;
    
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), queue, ^{
        NSLog(@"dispatch_after");
        self.requestObject = nil;
    });
    [self.requestObject start2];
}
#pragma mark RXARCRequestObjectDelegate
- (void)requestFinished:(RXARCRequestObject *)object
{
    NSLog(@"begin requestFinished");
    self.requestObject = nil;
    NSLog(@"end requestFinished");
}
@end
