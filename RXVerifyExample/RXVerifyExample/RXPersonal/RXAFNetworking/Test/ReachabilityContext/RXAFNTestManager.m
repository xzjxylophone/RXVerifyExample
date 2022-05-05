//
//  RXAFNTestManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/27.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNTestManager.h"
#import "RXAFNetworkReachabilityManager.h"

/**** 先废弃 start *****/
//typedef struct {
//    CFIndex        version;
//    void *        __nullable info;
//    const void    * __nonnull (* __nullable retain)(const void *info);
//    void        (* __nullable release)(const void *info);
//    CFStringRef    __nonnull (* __nullable copyDescription)(const void *info);
//} SCNetworkReachabilityContext;

typedef NS_ENUM(NSInteger, RXAFNStatus) {
    RXAFNStatus_Value1,
    RXAFNStatus_Value2
};

NSString *NSStringFromRXAFNStatus(RXAFNStatus status) {
    switch (status) {
        case RXAFNStatus_Value1:
        return @"RXAFN状态1";
        case RXAFNStatus_Value2:
        return @"RXAFN状态2";
        default:
        return @"未知";
    }
}

typedef void (^RXAFNStatusBlock)(RXAFNStatus status);



typedef struct {
    CFIndex version;
    void * __nullable info;
    const void    * __nonnull (* __nullable retain)(const void *info);
    void        (* __nullable release)(const void *info);
    CFStringRef    __nonnull (* __nullable copyDescription)(const void *info);
}RXAFNContext;
/**** 先废弃 end *****/




@interface RXAFNTestManager()
@property (nonatomic, strong) RXAFNetworkReachabilityManager *manager;
@end

@implementation RXAFNTestManager


- (void)test
{
    self.manager = [RXAFNetworkReachabilityManager manager];
    
    void (^block)(RXAFNetworkReachabilityStatus) = ^(RXAFNetworkReachabilityStatus status) {
        NSLog(@"status:%zd", status);
    };
    
    [self.manager setReachabilityStatusChangeBlock:block];
    
    [self.manager startMonitoring];
}

@end
