//
//  RXSelfRequestManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/4.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXSelfRequestManager.h"
#import "RXSelfRequestObject.h"
@interface RXSelfRequestManager() <RXSelfRequestObjectDelegate>
@property (nonatomic, strong) RXSelfRequestObject *request;
@end
@implementation RXSelfRequestManager

- (void)test {
    self.request = [RXSelfRequestObject new];
    self.request.delegate = self;
    self.request.completionBlock = ^(RXSelfRequestObject * _Nonnull request) {
        NSLog(@"1111");
    };
//    [self.request start];
    [_request start];
}

#pragma mark - RXSelfRequestObjectDelegate
- (void)requesetFinished:(RXSelfRequestObject *)request {
    self.request = nil;
}

#pragma mark - Signal
- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}
+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
@end
