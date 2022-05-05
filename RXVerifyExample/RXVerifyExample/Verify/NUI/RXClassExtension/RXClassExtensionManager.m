//
//  RXClassExtensionManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/4/1.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXClassExtensionManager.h"
#import "RXClassExtObject.h"
#import "RXClassExtObject+Private.h"
@implementation RXClassExtensionManager

- (void)test {
    RXClassExtObject *tmp = [RXClassExtObject new];
    tmp.str1 = @"123";
    tmp.str2 = @"456";
    [tmp print1];
    [tmp print2];
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
