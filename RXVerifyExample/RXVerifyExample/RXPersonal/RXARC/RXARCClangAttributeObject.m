//
//  RXARCClangAttributeObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/22.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCClangAttributeObject.h"

@implementation RXARCClangAttributeObject
- (void)test
{
    [self _test_c_consumed];
    [self _test_objective_c_consumed];
    [self _test_objective_cpp_consumed];
}
- (void)_test_c_consumed
{
#if __has_attribute(cf_consumed)
    NSLog(@"cf_consumed");
#else
    NSLog(@"cf_consumed not");
#endif
    
#if __has_attribute(cf_returns_not_retained)
    NSLog(@"cf_returns_not_retained");
#else
    NSLog(@"cf_returns_not_retained not");
#endif
    
#if __has_attribute(cf_returns_retained)
    NSLog(@"cf_returns_retained");
#else
    NSLog(@"cf_returns_retained not");
#endif
    
}

// 无论是否是ARC还是MRC都是有这些attribute的
- (void)_test_objective_c_consumed
{
#if __has_attribute(ns_consumed)
    NSLog(@"ns_consumed");
#else
    NSLog(@"ns_consumed not");
#endif
    
#if __has_attribute(ns_consumes_self)
    NSLog(@"ns_consumes_self");
#else
    NSLog(@"ns_consumes_self not");
#endif
    
#if __has_attribute(ns_returns_autoreleased)
    NSLog(@"ns_returns_autoreleased");
#else
    NSLog(@"ns_returns_autoreleased not");
#endif
    
#if __has_attribute(ns_returns_autoreleased)
    NSLog(@"ns_returns_autoreleased");
#else
    NSLog(@"ns_returns_autoreleased not");
#endif
    
#if __has_attribute(ns_returns_not_retained)
    NSLog(@"ns_returns_not_retained");
#else
    NSLog(@"ns_consumes_self not");
#endif
}
- (void)_test_objective_cpp_consumed
{
#if __has_attribute(os_consumed)
    NSLog(@"os_consumed");
#else
    NSLog(@"os_consumed not");
#endif
    
#if __has_attribute(os_consumes_this)
    NSLog(@"os_consumes_this");
#else
    NSLog(@"os_consumes_this not");
#endif
    
#if __has_attribute(os_returns_not_retained)
    NSLog(@"os_returns_not_retained");
#else
    NSLog(@"os_returns_not_retained not");
#endif
    
#if __has_attribute(os_returns_retained)
    NSLog(@"os_returns_retained");
#else
    NSLog(@"os_returns_retained not");
#endif
    
#if __has_attribute(os_returns_retained_on_non_zero)
    NSLog(@"os_returns_retained_on_non_zero");
#else
    NSLog(@"os_returns_retained_on_non_zero not");
#endif
    
#if __has_attribute(os_returns_retained_on_zero)
    NSLog(@"os_returns_retained_on_zero");
#else
    NSLog(@"os_returns_retained_on_zero not");
#endif
    
    
}

@end
