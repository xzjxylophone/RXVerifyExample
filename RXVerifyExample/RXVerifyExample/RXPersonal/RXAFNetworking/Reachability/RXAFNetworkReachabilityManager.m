//
//  RXAFNetworkReachabilityManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/14.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNetworkReachabilityManager.h"
#if !TARGET_OS_WATCH
#import <netinet/in.h>
#import <netinet6/in6.h>
#import <arpa/inet.h>
#import <ifaddrs.h>
#import <netdb.h>


NSString * const RXAFNetworkingReachabilityDidChangeNotification = @"com.alamofire.networking.reachability.change.rx";
NSString * const RXAFNetworkingReachabilityNotificationStatusItem = @"RXAFNetworkingReachabilityNotificationStatusItem";

typedef void (^RXAFNetworkReachabilityStatusBlock)(RXAFNetworkReachabilityStatus status);

NSString * RXAFStringFromNetworkReachabilityStatus(RXAFNetworkReachabilityStatus status) {
    switch (status) {
        case RXAFNetworkReachabilityStatusNotReachable:
            // TODOAFN_M_2_K_2
            // https://blog.csdn.net/playddt/article/details/46332547
            return NSLocalizedStringFromTable(@"Not Reachable", @"RXAFNetworking", nil);
        case RXAFNetworkReachabilityStatusReachableViaWWAN:
            return NSLocalizedStringFromTable(@"Reachable via WWAN", @"RXAFNetworking", nil);
        case RXAFNetworkReachabilityStatusReachableViaWiFi:
            return NSLocalizedStringFromTable(@"Reachable via WiFi", @"RXAFNetworking", nil);
        case RXAFNetworkReachabilityStatusUnknown:
        default:
            return NSLocalizedStringFromTable(@"Unknown", @"RXAFNetworking", nil);
    }
}


// TODOAFN_M_2_K_3  与TODOAFN_M_2_K_0相关
// 各种状态名字解释与相互之间的关联
static RXAFNetworkReachabilityStatus RXAFNetworkReachabilityStatusForFlags(SCNetworkReachabilityFlags flags) {
    BOOL isReachable = ((flags & kSCNetworkReachabilityFlagsReachable) != 0);
    BOOL needsConnection = ((flags & kSCNetworkReachabilityFlagsConnectionRequired) != 0);
    BOOL canConnectionAutomatically = (((flags & kSCNetworkReachabilityFlagsConnectionOnDemand ) != 0) || ((flags & kSCNetworkReachabilityFlagsConnectionOnTraffic) != 0));
    BOOL canConnectWithoutUserInteraction = (canConnectionAutomatically && (flags & kSCNetworkReachabilityFlagsInterventionRequired) == 0);
    BOOL isNetworkReachable = (isReachable && (!needsConnection || canConnectWithoutUserInteraction));
    
    RXAFNetworkReachabilityStatus status = RXAFNetworkReachabilityStatusUnknown;
    if (isNetworkReachable == NO) {
        status = RXAFNetworkReachabilityStatusNotReachable;
    }
#if    TARGET_OS_IPHONE
    else if ((flags & kSCNetworkReachabilityFlagsIsWWAN) != 0) {
        status = RXAFNetworkReachabilityStatusReachableViaWWAN;
    }
#endif
    else {
        status = RXAFNetworkReachabilityStatusReachableViaWiFi;
    }
    
    return status;
}


/**
 * Queue a status change notification for the main thread.
 *
 * This is done to ensure that the notifications are received in the same order
 * as they are sent. If notifications are sent directly, it is possible that
 * a queued notification (for an earlier status condition) is processed after
 * the later update, resulting in the listener being left in the wrong state.
 */
// TODOAFN_M_2_K_4    main_queue  dispath_async  main_queue, 异步不一定会创建新的线程
static void RXAFPostReachabilityStatusChange(SCNetworkReachabilityFlags flags, RXAFNetworkReachabilityStatusBlock block) {
    RXAFNetworkReachabilityStatus status = RXAFNetworkReachabilityStatusForFlags(flags);
    dispatch_async(dispatch_get_main_queue(), ^{
        if (block) {
            block(status);
        }
        NSNotificationCenter *notificationCenter = [NSNotificationCenter defaultCenter];
        NSDictionary *userInfo = @{ RXAFNetworkingReachabilityNotificationStatusItem: @(status) };
        [notificationCenter postNotificationName:RXAFNetworkingReachabilityDidChangeNotification object:nil userInfo:userInfo];
    });
}

static void RXAFNetworkReachabilityCallback(SCNetworkReachabilityRef __unused target, SCNetworkReachabilityFlags flags, void *info) {
    NSLog(@"我的网络从无连接到有连接,或者从有连接到无连接");
    RXAFPostReachabilityStatusChange(flags, (__bridge RXAFNetworkReachabilityStatusBlock)info);
}


static const void * RXAFNetworkReachabilityRetainCallback(const void *info) {
    return Block_copy(info);
}

static void RXAFNetworkReachabilityReleaseCallback(const void *info) {
    if (info) {
        Block_release(info);
    }
}


@interface RXAFNetworkReachabilityManager()

// TODOAFN_M_2_K_5 readonly和assign
@property (readonly, nonatomic, assign) SCNetworkReachabilityRef networkReachability;
@property (readwrite, nonatomic, assign) RXAFNetworkReachabilityStatus networkReachabilityStatus;
@property (readwrite, nonatomic, copy) RXAFNetworkReachabilityStatusBlock networkReachabilityStatusBlock;
@end



@implementation RXAFNetworkReachabilityManager

#pragma mark - Init And Signal
+ (instancetype)sharedManager {
    static RXAFNetworkReachabilityManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [self manager];
    });
    
    return _sharedManager;
}

+ (instancetype)managerForDomain:(NSString *)domain {
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithName(kCFAllocatorDefault, [domain UTF8String]);
    
    RXAFNetworkReachabilityManager *manager = [[self alloc] initWithReachability:reachability];
    
    CFRelease(reachability);
    
    return manager;
}

+ (instancetype)managerForAddress:(const void *)address {
    SCNetworkReachabilityRef reachability = SCNetworkReachabilityCreateWithAddress(kCFAllocatorDefault, (const struct sockaddr *)address);
    RXAFNetworkReachabilityManager *manager = [[self alloc] initWithReachability:reachability];
    
    CFRelease(reachability);
    
    return manager;
}

+ (instancetype)manager
{
    // TODOAFN_M_2_K_5 宏定义要大概知道是什么意思
#if (defined(__IPHONE_OS_VERSION_MIN_REQUIRED) && __IPHONE_OS_VERSION_MIN_REQUIRED >= 90000) || (defined(__MAC_OS_X_VERSION_MIN_REQUIRED) && __MAC_OS_X_VERSION_MIN_REQUIRED >= 101100)
    struct sockaddr_in6 address;
    bzero(&address, sizeof(address));
    address.sin6_len = sizeof(address);
    address.sin6_family = AF_INET6;
#else
    
    // TODOAFN_M_2_K_6 需要好好的研究研究一下
    struct sockaddr_in address;
    bzero(&address, sizeof(address));
    address.sin_len = sizeof(address);
    address.sin_family = AF_INET;
#endif
    return [self managerForAddress:&address];
}

- (instancetype)initWithReachability:(SCNetworkReachabilityRef)reachability {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _networkReachability = CFRetain(reachability);
    self.networkReachabilityStatus = RXAFNetworkReachabilityStatusUnknown;
    
    return self;
}

- (instancetype)init
{
    // TODOAFN_M_2_K_7 抛出异常点
    @throw [NSException exceptionWithName:NSGenericException
                                   reason:@"`-init` unavailable. Use `-initWithReachability:` instead"
                                 userInfo:nil];
    return nil;
}

- (void)dealloc {
    [self stopMonitoring];
    
    if (_networkReachability != NULL) {
        CFRelease(_networkReachability);
    }
}


#pragma mark - ReadOnly Property

- (BOOL)isReachable {
    return [self isReachableViaWWAN] || [self isReachableViaWiFi];
}

- (BOOL)isReachableViaWWAN {
    return self.networkReachabilityStatus == RXAFNetworkReachabilityStatusReachableViaWWAN;
}

- (BOOL)isReachableViaWiFi {
    return self.networkReachabilityStatus == RXAFNetworkReachabilityStatusReachableViaWiFi;
}


#pragma mark - start & stop Monitoring
- (void)startMonitoring {
    [self stopMonitoring];
    
    if (!self.networkReachability) {
        return;
    }
    
    
    __weak __typeof(self)weakSelf = self;
    RXAFNetworkReachabilityStatusBlock callback = ^(RXAFNetworkReachabilityStatus status) {
        __strong __typeof(weakSelf)strongSelf = weakSelf;
        NSLog(@"触发callback");
        strongSelf.networkReachabilityStatus = status;
        if (strongSelf.networkReachabilityStatusBlock) {
            strongSelf.networkReachabilityStatusBlock(status);
        }
        
    };
    
    // TODOAFN_M_2_K_7_11 设计一套类似于这个context
    SCNetworkReachabilityContext context = {0, (__bridge void *)callback, RXAFNetworkReachabilityRetainCallback, RXAFNetworkReachabilityReleaseCallback, NULL};
    
    // 当有网络变成无网络或者从无网络变成有网络的时候会触发这个回调
    // 这个是监听网络通的时候从wifi到蜂窝网络变化或者蜂窝网络到wifi变化
    SCNetworkReachabilitySetCallback(self.networkReachability, RXAFNetworkReachabilityCallback, &context);
//    SCNetworkReachabilitySetCallback(self.networkReachability, NULL, &context);
    
    // TODOAFN_M_2_K_8 知识点
    SCNetworkReachabilityScheduleWithRunLoop(self.networkReachability, CFRunLoopGetMain(), kCFRunLoopCommonModes);
    //
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),^{
        // 这一段代码怎么只有在start的时候才会调用一次,其中无论是怎么切换wifi啊,切换4G啊,切换飞行模式都不会触发这个函数
        // 难道这个是需要在
        // 1. 连接一个ip地址
        // 2. 此ip地址是好的,然后突然坏掉了这种情况?
        // 才会触发这里面的调用吗?????
        SCNetworkReachabilityFlags flags;
        // 这个是监听网络通的时候从wifi到蜂窝网络变化或者蜂窝网络到wifi变化???
        // 这个作用有可能是在连接状态下,一些其他状态变化导致的,需要一个特定的wifi
        if (SCNetworkReachabilityGetFlags(self.networkReachability, &flags)) {
            NSLog(@"111111,我的网络状态变化了");
            RXAFPostReachabilityStatusChange(flags, callback);
        } else {
            NSLog(@"111111,我的网络状态没有变化了??");
        }
    });
}

- (void)stopMonitoring {
    if (!self.networkReachability) {
        return;
    }
    // TODOAFN_M_2_K_8 知识点
    SCNetworkReachabilityUnscheduleFromRunLoop(self.networkReachability, CFRunLoopGetMain(), kCFRunLoopCommonModes);
}


#pragma mark - Public method

- (NSString *)localizedNetworkReachabilityStatusString {
    return RXAFStringFromNetworkReachabilityStatus(self.networkReachabilityStatus);
}

- (void)setReachabilityStatusChangeBlock:(void (^)(RXAFNetworkReachabilityStatus status))block {
    self.networkReachabilityStatusBlock = block;
}

#pragma mark - NSKeyValueObserving
// 一个影响多个
+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
    if ([key isEqualToString:@"reachable"] || [key isEqualToString:@"reachableViaWWAN"] || [key isEqualToString:@"reachableViaWiFi"]) {
        return [NSSet setWithObject:@"networkReachabilityStatus"];
    }
    return [super keyPathsForValuesAffectingValueForKey:key];
}

@end



#endif
