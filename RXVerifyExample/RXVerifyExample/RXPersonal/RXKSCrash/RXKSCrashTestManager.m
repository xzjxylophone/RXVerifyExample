//
//  RXKSCrashTestManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/23.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXKSCrashTestManager.h"
#import "RXKSSizeofTestObject.h"
@implementation RXKSCrashTestManager
+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


- (void)test {
    RXKSSizeofTestObject *tmp = [RXKSSizeofTestObject new];
    [tmp test];
}
@end
