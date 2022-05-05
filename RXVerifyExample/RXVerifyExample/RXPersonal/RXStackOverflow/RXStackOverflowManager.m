//
//  RXStackOverflowManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/28.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXStackOverflowManager.h"
#import "RXUrlDealObject.h"
@implementation RXStackOverflowManager

- (void)test {
    
    [[RXUrlDealObject new] test];
    

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
