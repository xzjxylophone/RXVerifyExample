//
//  RXThreadMemoryManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/8.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXThreadMemoryManager.h"
#import "RXTMIntToIdObject.h"
#import "RXTMImpCachingObject.h"
#import "RXTMImpCachingInstanceObject.h"
#import "RXTMImpCachingInstance2Object.h"
#import "RXTMImpCachingInstance3Object.h"
#import "RXTMOwnershipObject.h"
@implementation RXThreadMemoryManager


- (void)test {
//    [[RXTMIntToIdObject new] test];
    
//    [[RXTMImpCachingObject new] test];

//    [[RXTMImpCachingInstanceObject new] test];
    
//    [[RXTMImpCachingInstance2Object new] test];
    
//    [[RXTMImpCachingInstance3Object new] test];
    
    [[RXTMOwnershipObject new] test];
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
