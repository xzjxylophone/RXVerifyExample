//
//  RXSelfSuperClassB.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/2/28.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXSelfSuperClassB.h"

@implementation RXSelfSuperClassB

- (void)test {
    [self _test1];
    
    [self _test2];
    
    [self _test3];
    
}

- (void)_test1 {
    NSLog(@"selfClass:%@, superClass:%@", [self class], [super class]);
    
    NSLog(@"1111%@2222", NSFullUserName());
}
- (void)_test2 {
    RXSelfSuperClassA *cA = [[RXSelfSuperClassA alloc] init];
    NSLog(@"selfClass: %@, superClass: %@", [self class], [cA class]);
}
- (void)_test3 {
    RXSelfSuperClassA *cB = [[RXSelfSuperClassB alloc] init];
    NSLog(@"selfClass: %@, superClass: %@", [self class], [cB class]);
}
@end
