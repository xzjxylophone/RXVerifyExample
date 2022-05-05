//
//  RXParentManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/8/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXParentManager.h"

@implementation RXParentManager
- (void)test {
    NSLog(@"%@", NSStringFromClass([self class]));
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
