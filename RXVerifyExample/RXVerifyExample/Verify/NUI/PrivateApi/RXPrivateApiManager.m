//
//  RXPrivateApiManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/11/20.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXPrivateApiManager.h"
#import "LSApplicationWorkspace+RXVerify.h"
#import "RXRuntimeUtil.h"
@implementation RXPrivateApiManager

- (void)getAppList
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
//    id space = [NSClassFromString(@"LSApplicationWorkspace") performSelector:@selector(defaultWorkspace)];
//    NSArray *plugins = [space performSelector:@selector(installedPlugins)];
//    NSMutableSet *list = [[NSMutableSet alloc] init];
//    for (id plugin in plugins) {
//        id bundle = [plugin performSelector:@selector(containingBundle)];
//        if (bundle)
//            [list addObject:bundle];
//    }
//    int a = 1;
//    for (id plugin in list) {
//        NSLog(@"? %d--",a);
//        a++;
//        NSLog(@"bundleIdentifier =%@", [plugin performSelector:@selector(bundleIdentifier)]);//bundleID
//
////        NSLog(@"applicationDSID =%@", [plugin performSelector:@selector(applicationDSID)]);
////        NSLog(@"applicationIdentifier =%@", [plugin performSelector:@selector(applicationIdentifier)]);
////        NSLog(@"applicationType =%@", [plugin performSelector:@selector(applicationType)]);
////        NSLog(@"dynamicDiskUsage =%@", [plugin performSelector:@selector(dynamicDiskUsage)]);
////
////        NSLog(@"itemID =%@", [plugin performSelector:@selector(itemID)]);
////        NSLog(@"itemName =%@", [plugin performSelector:@selector(itemName)]);
////        NSLog(@"minimumSystemVersion =%@", [plugin performSelector:@selector(minimumSystemVersion)]);
////
////        NSLog(@"requiredDeviceCapabilities =%@", [plugin performSelector:@selector(requiredDeviceCapabilities)]);
////        NSLog(@"sdkVersion =%@", [plugin performSelector:@selector(sdkVersion)]);
////        NSLog(@"shortVersionString =%@", [plugin performSelector:@selector(shortVersionString)]);
////
////        NSLog(@"sourceAppIdentifier =%@", [plugin performSelector:@selector(sourceAppIdentifier)]);
////        NSLog(@"staticDiskUsage =%@", [plugin performSelector:@selector(staticDiskUsage)]);
////        NSLog(@"teamID =%@", [plugin performSelector:@selector(teamID)]);
////        NSLog(@"vendorName =%@", [plugin performSelector:@selector(vendorName)]);
//    }
#pragma clang diagnostic pop

}


- (void)getAppList2
{
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
    id space = [NSClassFromString(@"LSApplicationWorkspace") performSelector:@selector(defaultWorkspace)];
//    id space = [LSApplicationWorkspace defaultWorkspace];
    NSArray *plugins = [space performSelector:@selector(installedPlugins)];
    NSMutableSet *list = [[NSMutableSet alloc] init];
    for (id plugin in plugins) {
        id bundle = [plugin performSelector:@selector(containingBundle)];
        if (bundle)
            [list addObject:bundle];
    }
    int a = 1;
    for (id plugin in list) {
        NSLog(@"? %d--",a);
        a++;
        NSLog(@"bundleIdentifier =%@", [plugin performSelector:@selector(bundleIdentifier)]);//bundleID
        
//        NSLog(@"applicationDSID =%@", [plugin performSelector:@selector(applicationDSID)]);
//        NSLog(@"applicationIdentifier =%@", [plugin performSelector:@selector(applicationIdentifier)]);
//        NSLog(@"applicationType =%@", [plugin performSelector:@selector(applicationType)]);
//        NSLog(@"dynamicDiskUsage =%@", [plugin performSelector:@selector(dynamicDiskUsage)]);
//
//        NSLog(@"itemID =%@", [plugin performSelector:@selector(itemID)]);
//        NSLog(@"itemName =%@", [plugin performSelector:@selector(itemName)]);
//        NSLog(@"minimumSystemVersion =%@", [plugin performSelector:@selector(minimumSystemVersion)]);
//
//        NSLog(@"requiredDeviceCapabilities =%@", [plugin performSelector:@selector(requiredDeviceCapabilities)]);
//        NSLog(@"sdkVersion =%@", [plugin performSelector:@selector(sdkVersion)]);
//        NSLog(@"shortVersionString =%@", [plugin performSelector:@selector(shortVersionString)]);
//
//        NSLog(@"sourceAppIdentifier =%@", [plugin performSelector:@selector(sourceAppIdentifier)]);
//        NSLog(@"staticDiskUsage =%@", [plugin performSelector:@selector(staticDiskUsage)]);
//        NSLog(@"teamID =%@", [plugin performSelector:@selector(teamID)]);
//        NSLog(@"vendorName =%@", [plugin performSelector:@selector(vendorName)]);
    }
#pragma clang diagnostic pop

}


- (void)testCSJ {
    Class cls = NSClassFromString(@"SecGuard");
    
//    + (void)printPropertyListWithClass:(Class)cls;
//    + (void)printMethodListWithClass:(Class)cls;
    
    [RXRuntimeUtil printMethodListWithClass:cls];
}

- (void)test {
//
//    [self getAppList];
    
//    Class cls = NSClassFromString(@"LSApplicationWorkspace");
//    [cls aspect_hookSelector:@selector(defaultWorkspace) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info, BOOL animation) {
//        NSLog(@"defaultWorkspace after:%@", info.instance);
//    } error:NULL];
    
//    Class cls = NSClassFromString(@"LSPlugInKitProxy");
//
//    [cls aspect_hookSelector:@selector(containingBundle) withOptions:AspectPositionAfter usingBlock:^(id<AspectInfo> info) {
//        NSLog(@"containingBundle after:%@", info.instance);
//    } error:NULL];
    
    
    [self testCSJ];
    
//    [self getAppList2];
}
#pragma mark - Signal
- (id)init {
    if (self = [super init]) {
        
    }
    return self;
}
+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
@end
