//
//  RXLockTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/9.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXLockTestObject.h"
#import "RXSynchronizedLockObject.h"

@interface RXLockTestObject ()
@property (nonatomic, strong) RXSynchronizedLockObject *rxSynchronizedLockObject;
@end


@implementation RXLockTestObject
- (id)init
{
    if (self = [super init]) {
        self.rxSynchronizedLockObject = [RXSynchronizedLockObject new];
    }
    return self;
}
- (void)mainTest
{
    [self.rxSynchronizedLockObject push:@(1)];
}
@end
