//
//  RXSignalManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/8/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXSignalManager.h"
#import "RXChild1Manager.h"
#import "RXChild2Manager.h"

@implementation RXSignalManager

- (void)test {
    
    [[RXChild1Manager sharedInstance] test];
    // 动态语言，如果是这个顺序使用child1，child2，会导致testChild2崩溃
//    [[RXChild2Manager sharedInstance] testChild2];
    [[RXParentManager sharedInstance] test];
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
