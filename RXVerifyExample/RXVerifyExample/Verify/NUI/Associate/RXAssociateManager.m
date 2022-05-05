//
//  RXAssociateManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/11/16.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXAssociateManager.h"
#import "RXAssociateObject+Associate.h"

@implementation RXAssociateManager

- (void)test {
    
    @autoreleasepool {
        RXAssociateObject *obj = [[RXAssociateObject alloc] init];
        NSLog(@"obj:%@", obj);
        [obj rxAssociate_doSomething];
    }
    [NSThread sleepForTimeInterval:1];
    @autoreleasepool {
        NSLog(@"obj after sleepForTimeInterval");
    }
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
