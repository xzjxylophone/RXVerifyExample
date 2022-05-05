//
//  RXMRCObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/19.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMRCObject.h"
#import "RXMRCUtil.h"
#import "RXARCTmpObject.h"

@implementation RXMRCObject

- (void)_foo:(id)x
{
    NSUInteger count = [x retainCount];
    NSLog(@"count in foo method:%zd", count);
}
- (void)_test_method_argument
{
    RXARCTmpObject *object = [[RXARCTmpObject alloc] init];
    
    NSUInteger count = [object retainCount];
    NSLog(@"count after alloc init:%zd", count);
    
    [self _foo:object];
    
    count = [object retainCount];
    NSLog(@"count before release:%zd", count);
    [object release];
}
- (void)_test_variable
{
    RXARCTmpObject *object = [[RXARCTmpObject alloc] init];
    NSLog(@"count after alloc init:%zd", [object retainCount]);
    id value = object;
    NSLog(@"count after variable:%zd", [value retainCount]);
    [object release];
}
- (void)test
{
    
//    [self _test_method_argument];
    
    [self _test_variable];
}




@end
