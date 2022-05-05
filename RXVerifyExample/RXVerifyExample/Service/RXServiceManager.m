//
//  RXServiceManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/9/12.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXServiceManager.h"
#import <objc/runtime.h>

@interface RXServiceItem : NSObject
@property (nonatomic, copy) NSString *serviceName;
// 方便以后的扩展
@property (nonatomic, assign) BOOL enable;
@property (nonatomic, assign) BOOL async;
@end

@implementation RXServiceItem

@end



@interface RXServiceManager()
@property (nonatomic, strong) NSMutableArray *serviceArray;
@property (nonatomic, strong) NSMutableDictionary *serviceDic;
@property (nonatomic, strong) dispatch_queue_t executeQueue;
@end


@implementation RXServiceManager





#pragma mark - Public
+ (void)addServiceName:(NSString *)serviceName enable:(BOOL)enable async:(BOOL)async
{
    if (!enable) {
        return;
    }
    RXServiceManager *manager = [RXServiceManager sharedInstance];
    for (RXServiceItem *item in manager.serviceArray) {
        if ([item.serviceName isEqualToString:serviceName]) {
            return;
        }
    }
    RXServiceItem *item = [RXServiceItem new];
    item.serviceName = serviceName;
    item.enable = enable;
    item.async = async;
    [manager.serviceArray addObject:item];
}
+ (BOOL)application:(UIApplication *)application willFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSArray *paramArray = @[application,
                            launchOptions ? launchOptions: [NSNull null]];
    [self executeSelector:_cmd paramArray:paramArray canAsync:NO];
    return YES;
}
+ (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    NSArray *paramArray = @[application,
                            launchOptions ? launchOptions: [NSNull null]];
    [self executeSelector:_cmd paramArray:paramArray canAsync:YES];
    return YES;
}
+ (void)executeSelector:(SEL)selector paramArray:(NSArray *)paramArray
{
    [self executeSelector:selector paramArray:paramArray canAsync:NO];
}
+ (BOOL)boolReturnExecuteSelector:(SEL)selector paramArray:(NSArray *)paramArray
{
    RXServiceManager *manager = [RXServiceManager sharedInstance];
    for (RXServiceItem *item in manager.serviceArray) {
        NSString *serviceName = item.serviceName;
        id<UIApplicationDelegate> delegate = [manager instanceWithServiceName:serviceName];
        if ([delegate respondsToSelector:selector]) {
            BOOL value = [RXServiceManager boolReturnExecuteTarget:delegate selector:selector paramArray:paramArray];
            // 执行成功就忽略其他的service
            if (value) {
                return value;
            }
        }
    }
    return YES;
}

+ (UIInterfaceOrientationMask)application:(UIApplication *)application supportedInterfaceOrientationsForWindow:(UIWindow *)window
{
    NSArray *paramArray = @[application,
                            window ? window : [NSNull class]];
    int value = [self intReturnExecuteSelector:_cmd paramArray:paramArray];
    if (value == 0) {
        return UIInterfaceOrientationMaskPortrait;
    }
    return value;
}



#pragma mark - Private
- (id<UIApplicationDelegate>)instanceWithServiceName:(NSString *)serviceName
{
    id<UIApplicationDelegate> delegate = self.serviceDic[serviceName];
    if (delegate == nil) {
        Class cls = NSClassFromString(serviceName);
        if (cls == nil) {
            NSLog(@"Does not have this service:%@", serviceName);
            return nil;
        }
        delegate = [cls new];
        self.serviceDic[serviceName] = delegate;
    }
    return delegate;
}

+ (void)executeSelector:(SEL)selector paramArray:(NSArray *)paramArray canAsync:(BOOL)canAsync
{
    RXServiceManager *manager = [RXServiceManager sharedInstance];
    for (RXServiceItem *item in manager.serviceArray) {
        NSString *serviceName = item.serviceName;
        id<UIApplicationDelegate> delegate = [manager instanceWithServiceName:serviceName];
        if ([delegate respondsToSelector:selector]) {
            if (canAsync && item.async) {
                dispatch_async(manager.executeQueue, ^{
                    [RXServiceManager executeTarget:delegate selector:selector paramArray:paramArray];
                });
            } else {
                [RXServiceManager executeTarget:delegate selector:selector paramArray:paramArray];
            }
        }
    }
}

+ (NSInvocation *)executeTarget:(id)target selector:(SEL)selector paramArray:(NSArray *)paramArray
{
    NSMethodSignature *signature = [target methodSignatureForSelector:selector];
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:signature];
    invocation.target = target;
    invocation.selector = selector;
    [paramArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[NSNull class]]) {
            obj = nil;
        }
        [invocation setArgument:&obj atIndex:idx + 2];
    }];
    [invocation invoke];
    return invocation;
}

+ (BOOL)boolReturnExecuteTarget:(id)target selector:(SEL)selector paramArray:(NSArray *)paramArray
{
    return [self intReturnExecuteTarget:self selector:selector paramArray:paramArray] != 0;
}
+ (int)intReturnExecuteTarget:(id)target selector:(SEL)selector paramArray:(NSArray *)paramArray
{
    NSInvocation *invocation = [self executeTarget:target selector:selector paramArray:paramArray];
    int result = 0;
    [invocation getReturnValue:&result];
    return result;
}
+ (int)intReturnExecuteSelector:(SEL)selector paramArray:(NSArray *)paramArray
{
    RXServiceManager *manager = [RXServiceManager sharedInstance];
    for (RXServiceItem *item in manager.serviceArray) {
        NSString *serviceName = item.serviceName;
        id<UIApplicationDelegate> delegate = [manager instanceWithServiceName:serviceName];
        if ([delegate respondsToSelector:selector]) {
            int value = [RXServiceManager intReturnExecuteTarget:delegate selector:selector paramArray:paramArray];
            // 执行成功就忽略其他的service
            if (value != 0) {
                return value;
            }
        }
    }
    return 0;
}


#pragma mark - Singleton Model
+ (RXServiceManager *)sharedInstance
{
    static RXServiceManager *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

#pragma mark - Constructor And Destructor
- (id)init
{
    if (self = [super init]) {
        self.serviceArray = [NSMutableArray new];
        self.serviceDic = [NSMutableDictionary new];
        self.executeQueue = dispatch_queue_create("com.rxservice.manager.label", DISPATCH_QUEUE_SERIAL);
    }
    return self;
}
- (void)dealloc
{
    
}


@end
