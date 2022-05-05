//
//  RXARCTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCTestObject.h"
#import "RXARCCallObject.h"
#import "RXARCCategoryMethodSubObject.h"
#import "RXRuntimeUtil.h"
#import "RXARCPrintMemoryAddressObject.h"
#import "RXARCNSConsumedObject.h"
#import "RXMRCObject.h"
#import "RXARCNSReturnsRetainedObject.h"
#import "RXARCNSReturnsRetainedObject.h"
#import "RXMRCReturnValueObject.h"
#import "RXARCBridgeCastObject.h"
#import "RXARCOwnershipQualifiedObject.h"
#import "RXARCObject.h"
#import "RXARCClangAttributeObject.h"
#import "RXARCAttributeNSObjectObject.h"
#import "RXARCAutoreleasingObject.h"
#import "RXARCUndefinedBehaviorObject.h"
#import "RXARCReturnValueObject.h"
#import "RXARCHasAttributeObject.h"
@interface RXARCTestObject()
@property (nonatomic, strong) RXARCCallObject *rxARCCallObject;


@property (nonatomic, strong) id tmpObject;
@end

@implementation RXARCTestObject

- (void)mainTest 
{
//#if __has_attribute(objc_externally_retained)
//    // Use externally retained...
//    NSLog(@"1234");
//#else
//    NSLog(@"1234");
//#endif
//    
//#if __has_attribute(objc_method_family)
//    // Use externally retained...
//    NSLog(@"121222234");
//#else
//    NSLog(@"1234");
//#endif
//    
//#if __has_attribute(ns_returns_retained)
//    // Use externally retained...
//    NSLog(@"4333434");
//#else
//    NSLog(@"1234");
//#endif
//    
//#if __has_attribute(ns_returns_retained1)
//    // Use externally retained...
//    NSLog(@"4333434");
//#else
//    NSLog(@"1234");
//#endif
//    
////    __weak typeof(self) weakSelf = nil;
////
////    weakSelf = self;
////
////    weakSelf = [RXARCTestObject new];
//    
//    
//#if __has_feature(arc_cf_code_audited)
//    NSLog(@"arc_cf_code_audited");
//#else
//    NSLog(@"not arc_cf_code_audited");
//    
//# endif
//    
//    
//    //条件满足ARC
//#if __has_feature(objc_arc)
//    //    否则执行MAC
//    NSLog(@"ARC");
//#else
//    NSLog(@"MRC");
//
//# endif
    
//    CGPoint point;
//    point.x = 4;
//    point.y = 5;
    
//    void * p = (void *)(&point);
//    id q = (__bridge id)p;
//    self.rxARCCallObject = q;

    
    
    
//    self.rxARCCallObject = [RXARCCallObject new];
//    [self.rxARCCallObject test];
//    [self.rxARCCallObject test2];
    
//    [self _test_category_method];
    
//    [self _test_print_memory_address];
    
//    [self _test_ns_consumed];
    
//    [self _test_ns_returns_retained];
    
//    [self _test_mrc_object];
    [self _test_arc_object];
    
//    [self _test_mrc_return_value_object];
//    [self _test_arc_return_value_object];
    
//    [self _test_bridge_cast];
    
//    [self _test_ownership_qualified];
    
//    [self _test_clang_attribute];
    
//    [self _test_attribute_nsobject];
    
//    [self _test_autoreleasing];
    
//    [self _test_undefinedBehavior];
}

- (void)_test_category_method
{
    [RXRuntimeUtil printMethodListWithClass:[RXARCCategoryMethodParentObject class]];
    [RXRuntimeUtil printMethodListWithClass:[RXARCCategoryMethodSubObject class]];
}
- (void)_test_print_memory_address
{
    RXARCPrintMemoryAddressObject *tmp = [RXARCPrintMemoryAddressObject new];
    [tmp test];
}
- (void)_test_ns_consumed
{
    RXARCNSConsumedObject *tmp = [RXARCNSConsumedObject new];
    [tmp test];
}
- (void)_test_ns_returns_retained
{
    RXARCNSReturnsRetainedObject *tmp = [RXARCNSReturnsRetainedObject new];
    [tmp test];
}
- (void)_test_mrc_object
{
    RXMRCObject *tmp = [RXMRCObject new];
    [tmp test];
}
- (void)_test_arc_object
{
    RXARCObject *tmp = [RXARCObject new];
    [tmp test];
}
- (void)_test_mrc_return_value_object
{
    RXMRCReturnValueObject *tmp = [RXMRCReturnValueObject new];
    [tmp test];
}
- (void)_test_arc_return_value_object
{
    RXARCReturnValueObject *tmp = [RXARCReturnValueObject new];
    // 防止提前释放
    self.tmpObject = tmp;
    [tmp test];
}
- (void)_test_bridge_cast
{
    RXARCBridgeCastObject *tmp = [RXARCBridgeCastObject new];
    [tmp test];
}
- (void)_test_ownership_qualified
{
    RXARCOwnershipQualifiedObject *tmp = [RXARCOwnershipQualifiedObject new];
    [tmp test];
}
- (void)_test_clang_attribute
{
    RXARCClangAttributeObject *tmp = [RXARCClangAttributeObject new];
    [tmp test];
    
//    __weak typeof(self) weakSelf = self;
    // ERROR: Cannot assign to variable 'weakSelf' with const-qualified type 'XXXX *const __weak'
//    weakSelf = self;
    
//    __weak typeof(NSObject *) weakSelf2 = self;
//    weakSelf2 = self;
    
}
- (void)_test_attribute_nsobject
{
    RXARCAttributeNSObjectObject *tmp = [RXARCAttributeNSObjectObject new];
    [tmp test];
}
- (void)_test_autoreleasing
{
    RXARCAutoreleasingObject *tmp = [RXARCAutoreleasingObject new];
    [tmp test];
}
- (void)_test_undefinedBehavior
{
    RXARCUndefinedBehaviorObject *tmp = [RXARCUndefinedBehaviorObject new];
    [tmp test];
}

- (void)_test_has_attribute_object
{
    RXARCHasAttributeObject *tmp = [RXARCHasAttributeObject new];
    [tmp test];
}
@end
