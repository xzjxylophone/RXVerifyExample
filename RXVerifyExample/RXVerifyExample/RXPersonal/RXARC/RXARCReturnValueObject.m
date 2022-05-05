//
//  RXARCReturnValueObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/2/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCReturnValueObject.h"
#import "RXARCTmpObject.h"
#import "RXMRCUtil.h"
#import "RXExternUtil.h"
#import "RXRuntimeFishHookUtil.h"
@interface RXARCReturnValueObject()
@property (nonatomic, strong) id recordObject;
@property (nonatomic, weak) id weakObject1;
@property (nonatomic, weak) id weakObject2;
@end
@implementation RXARCReturnValueObject

- (id)_foo_return_value
{
    RXARCTmpObject *tmp = [[RXARCTmpObject alloc] init];
    id object = [NSString stringWithFormat:@"%@", tmp];
    // count=2
    // stringWithFormat 产生一次
    // object = 也产生一次
    NSLog(@"count after product:%zd", [RXMRCUtil objectRetainCount:object]);
    
    self.recordObject = object;
    // count=3
    // self.recordObject =  也产生一次
    NSLog(@"count after =:%zd", [RXMRCUtil objectRetainCount:object]);
    return object;
}
- (void)_test_return_value
{
    
    id object = [self _foo_return_value];
    // count = 3, 不会产生
    NSLog(@"count after call method:%zd", [RXMRCUtil objectRetainCount:object]);
    
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        NSLog(@"count after 3 seconds:%zd", [RXMRCUtil objectRetainCount:weakSelf.recordObject]);
    });
}

- (void)test
{
    [RXRuntimeFishHookUtil hook];
    

    [self _test_return_value];
//    NSLog(@"-------------------------------\n");
//    __weak typeof(self) weakSelf = self;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        
//        [RXRuntimeFishHookUtil hook];
//        
//        [weakSelf _test_return_value];
//        
//    });
}
@end
