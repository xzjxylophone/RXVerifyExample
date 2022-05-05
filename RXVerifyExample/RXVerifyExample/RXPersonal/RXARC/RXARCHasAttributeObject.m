//
//  RXARCHasAttributeObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/2/16.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCHasAttributeObject.h"

@implementation RXARCHasAttributeObject

- (void)test
{
#if __has_attribute(ns_consumed)
    NSLog(@"ns_consumed");
#else
    NSLog(@"ns_consumed not");
#endif
}
@end
