//
//  RXEncryptDecryptTestManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/20.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXEncryptDecryptTestManager.h"
#import "RXRSATheoryObject.h"
@implementation RXEncryptDecryptTestManager
+ (instancetype)sharedInstance
{
    static RXEncryptDecryptTestManager *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}


- (void)test {
    RXRSATheoryObject *tmp = [RXRSATheoryObject new];
    [tmp test];
}
@end
