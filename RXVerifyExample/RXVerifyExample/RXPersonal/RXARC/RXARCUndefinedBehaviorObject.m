//
//  RXARCUndefinedBehaviorObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/2/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCUndefinedBehaviorObject.h"

@implementation RXARCUndefinedBehaviorObject
- (void)test
{
    [self _test_invalid_pointer];
}
- (void)_test_invalid_pointer
{
    int a = 0;
    void *b = &a;
    id c = (__bridge id)b;
    NSLog(@"%@", c);
}
@end
