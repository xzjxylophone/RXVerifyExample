//
//  RXARCNSConsumedObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/19.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCNSConsumedObject.h"
#import "RXMRCUtil.h"
#import "RXARCTmpObject.h"
@implementation RXARCNSConsumedObject

- (void)_foo_have_attribute:(id) __attribute((ns_consumed))x {
    NSLog(@"start count in _foo_have_attribute:%zd", [RXMRCUtil objectRetainCount:x]);
    NSLog(@"Do something");
    NSLog(@"end count in _foo_have_attribute:%zd", [RXMRCUtil objectRetainCount:x]);
}

- (void)_foo:(id)x {
    NSLog(@"start count _foo_not_attribute:%zd", [RXMRCUtil objectRetainCount:x]);
    NSLog(@"Do something");
    NSLog(@"end count in _foo_not_attribute:%zd", [RXMRCUtil objectRetainCount:x]);
}

- (void)test {
    RXARCTmpObject *object = [[RXARCTmpObject alloc] init];
    NSLog(@"start count outside method:%zd", [RXMRCUtil objectRetainCount:object]);
    
    [self _foo_have_attribute:object];
//    [self _foo:object];

    NSLog(@"end count outside method:%zd", [RXMRCUtil objectRetainCount:object]);
}
@end
