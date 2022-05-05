//
//  RXARCOwnershipQualifiedObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/21.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCOwnershipQualifiedObject.h"
#import "RXMRCUtil.h"
#import "RXARCTmpObject.h"
@implementation RXARCOwnershipQualifiedObject
- (void)test
{
//    [self _test_variablee];
    
    [self _test_protocol];
    
    
    
}
- (void)_test_variablee
{
    NSLog(@"before _test_variablee");
    RXARCTmpObject *object = [RXARCTmpObject new];
    NSLog(@"count after new:%zd", [RXMRCUtil objectRetainCount:object]);
    
    NSObject *value = object;
    NSLog(@"count after value:%zd", [RXMRCUtil objectRetainCount:value]);
    
    __strong NSObject *strong_value = object;
    NSLog(@"count after strong_value:%zd", [RXMRCUtil objectRetainCount:strong_value]);
    
    __weak NSObject *weak_value = object;
    NSLog(@"count after weak_value:%zd", [RXMRCUtil objectRetainCount:weak_value]);
    
    __unsafe_unretained NSObject *unsafe_unretained_value = object;
    NSLog(@"count after unsafe_unretained_value:%zd", [RXMRCUtil objectRetainCount:unsafe_unretained_value]);
    
    NSLog(@"end _test_variablee");
}
- (void)_test_protocol
{
    NSLog(@"before _test_protocol");
    RXARCTmpObject *object = [RXARCTmpObject new];
    NSLog(@"count after new:%zd", [RXMRCUtil objectRetainCount:object]);
    
    id<NSCopying> id_value = (id<NSCopying>)object;
    NSLog(@"count after id_value:%zd", [RXMRCUtil objectRetainCount:id_value]);
    
    __strong id<NSCopying> strong_id_value = (id<NSCopying>)object;
    NSLog(@"count after strong_id_value:%zd", [RXMRCUtil objectRetainCount:strong_id_value]);
    
    __weak id<NSCopying> weak_id_value = (id<NSCopying>)object;
    NSLog(@"count after weak_id_value:%zd", [RXMRCUtil objectRetainCount:weak_id_value]);
    
    __unsafe_unretained id<NSCopying> unsafe_unretained_id_valuee = (id<NSCopying>)object;
    NSLog(@"count after unsafe_unretained_id_valuee:%zd", [RXMRCUtil objectRetainCount:unsafe_unretained_id_valuee]);
    
    NSLog(@"end _test_protocol");
}
@end
