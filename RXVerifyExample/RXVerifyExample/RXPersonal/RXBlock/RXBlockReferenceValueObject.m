//
//  RXBlockReferenceValueObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/14.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBlockReferenceValueObject.h"


#import "RXBlockTmpObject.h"

static void _s_test_name(NSString *prefix, RXBlockTmpObject *tmpObject)
{
    NSLog(@"%@, %@", prefix, tmpObject);
}

@interface RXBlockReferenceValueObject()

@property (nonatomic, strong) RXBlockTmpObject *tmpObject;
@property (nonatomic, strong) NSMutableArray *mutableArray;

@end
@implementation RXBlockReferenceValueObject
- (void)test
{
//    [self _test_normal];
//    [self _test_normal_mut];
    
//    [self _test_self_instance_variable];
    
//    [self _test_weakself_strongself_instance_variable];
    
//    dispatch_apply(10, nil, ^(size_t index) {
//        
//    });
    
//    int (^block1)(int) = ^(int m) {
//        return m + 1;
//    };
//    
//    id (^block4)(int) = (id)^(int m) {
//        return [NSObject new];
//    };
}

- (void)_test_normal
{
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"1"];
    NSLog(@"1 address in object:%@", self.tmpObject);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"2"];
    NSLog(@"2 address in object:%@", self.tmpObject);
    
    // 代码1: 2秒后执行一个任务
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 2), queue, ^{
//        _s_test_name(@"instance variable", _tmpObject);
//    });
    
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"3"];
    NSLog(@"3 address in object:%@", self.tmpObject);
    
    id value = _tmpObject;
    NSLog(@"value address in object:%@", value);
    
    // 代码2: 3秒后执行一个任务
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 3), queue, ^{
        _s_test_name(@"local variable", value);
    });
    
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"4"];
    NSLog(@"4 address in object:%@", self.tmpObject);
}



- (void)_test_normal_mut
{
    self.mutableArray = [NSMutableArray new];
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"1"];
    [self.mutableArray addObject:self.tmpObject];
    NSLog(@"1 address in object:%@", self.tmpObject);
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"2"];
    [self.mutableArray addObject:self.tmpObject];
    NSLog(@"2 address in object:%@", self.tmpObject);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 2), queue, ^{
        _s_test_name(@"instance variable", _tmpObject);
    });
    
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"3"];
    [self.mutableArray addObject:self.tmpObject];
    NSLog(@"3 address in object:%@", self.tmpObject);
    
    id value = _tmpObject;
    NSLog(@"value address in object:%@", value);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 3), queue, ^{
        _s_test_name(@"local variable", value);
    });
    
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"4"];
    [self.mutableArray addObject:self.tmpObject];
    NSLog(@"4 address in object:%@", self.tmpObject);
}

- (void)_test_self_instance_variable
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"4"];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 2), queue, ^{
        _s_test_name(@"instance variable", self->_tmpObject);
    });
}


- (void)_test_weakself_instance_variable
{
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"4"];
//    __weak typeof(self) weakSelf = self;
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 2), queue, ^{
//        // Error: Dereferencing a __weak pointer is not allowed due to possible null value cased by race condition, assign it to strong variable first
//        _s_test_name(@"instance variable", weakSelf->_tmpObject);
//    });
}
- (void)_test_weakself_strongself_instance_variable
{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    self.tmpObject = [RXBlockTmpObject tmpObjectWithName:@"4"];
    __weak typeof(self) weakSelf = self;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, NSEC_PER_SEC * 2), queue, ^{
        __strong typeof(self) strongSelf = weakSelf;
        // 崩溃的概率极高
        _s_test_name(@"instance variable", strongSelf->_tmpObject);
    });
}

- (void)dealloc
{
    NSLog(@"RXBlockReferenceValueObject dealloc");
}


@end
