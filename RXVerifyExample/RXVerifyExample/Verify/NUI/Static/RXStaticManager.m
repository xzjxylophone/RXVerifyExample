//
//  RXStaticManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/7/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXStaticManager.h"
#import "RXMethodStaticObject.h"
@implementation RXStaticManager

- (void)test {
    [self test_staticInMethod];
}
- (void)test_staticInMethod {
    RXMethodStaticObject *obj = [RXMethodStaticObject new];
    [obj test];
    [obj test];
    [obj test];
    
    RXMethodStaticObject *obj2 = [RXMethodStaticObject new];
    [obj2 test];
    [obj2 test];
    [obj2 test];
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
