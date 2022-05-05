//
//  RXARCObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/22.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCObject.h"

#import "RXMRCUtil.h"
#import "RXARCTmpObject.h"

@interface RXARCObject ()

@property (nonatomic, strong) id tmpObject;

@end

@implementation RXARCObject
- (void)_foo:(id)x
{
    NSUInteger count = [RXMRCUtil objectRetainCount:x];
    NSLog(@"start count _foo_not_attribute:%zd", count);
    
    
    count = [RXMRCUtil objectRetainCount:x];
    NSLog(@"end count in _foo_not_attribute:%zd", count);
}
- (void)_test_method_argument
{
    RXARCTmpObject *object = [[RXARCTmpObject alloc] init];
    
    NSUInteger count = [RXMRCUtil objectRetainCount:object];
    NSLog(@"start count outside method:%zd", count);
    
    [self _foo:object];
    
    count = [RXMRCUtil objectRetainCount:object];
    NSLog(@"end count outside method:%zd", count);
}
- (void)_test_variable
{
    RXARCTmpObject *object = [[RXARCTmpObject alloc] init];
    NSLog(@"count after alloc init:%zd", [RXMRCUtil objectRetainCount:object]);
    id value = object;
    NSLog(@"count after variable:%zd", [RXMRCUtil objectRetainCount:value]);
}
- (void)test
{
    [self _test_method_argument];
//    [self _test_variable];
}
@end
