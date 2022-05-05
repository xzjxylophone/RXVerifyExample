//
//  RXObserveTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXObserveTestObject.h"
#import "RXObserverObject.h"
#import "RXObservedObject.h"

@interface RXObserveTestObject()
@property (nonatomic, strong) RXObservedObject *observedObject;
@end

@implementation RXObserveTestObject
- (void)test_notSameObject
{
    RXObserverObject *observerObject = [RXObserverObject new];
    RXObservedObject *tmpObservedObject = [RXObservedObject new];
    
    [tmpObservedObject addObserver:observerObject forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
    
    tmpObservedObject.value = 10;
    
    
    RXObservedObject *tmpObservedObject2 = [RXObservedObject new];
    
    
    tmpObservedObject2.value = 20;
}


- (void)test_remove_notExist
{
    
    RXObserverObject *observerObject = [RXObserverObject new];
    self.observedObject = [RXObservedObject new];
    
    [self.observedObject addObserver:observerObject forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
    
    self.observedObject.value = 10;
    
    // 这里self并不是观察者,所以移除也是会跑出异常的
    [self.observedObject removeObserver:self forKeyPath:@"value"];
}

- (void)test_remove_multiple
{
    
    RXObserverObject *observerObject = [RXObserverObject new];
    self.observedObject = [RXObservedObject new];
    
    [self.observedObject addObserver:observerObject forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
    
    self.observedObject.value = 10;
    
    [self.observedObject removeObserver:observerObject forKeyPath:@"value"];
    // 多次移除会报错
    [self.observedObject removeObserver:observerObject forKeyPath:@"value"];
    [self.observedObject removeObserver:observerObject forKeyPath:@"value"];
}
- (void)test
{
    RXObserverObject *observerObject = [RXObserverObject new];
    self.observedObject = [RXObservedObject new];
    
    [self.observedObject addObserver:observerObject forKeyPath:@"value" options:NSKeyValueObservingOptionNew context:nil];
    
    self.observedObject.value = 10;
    
//    [RXObserveTestObject methodForSelector:@selector(kkk:)];
}

- (void)test_after_call_test
{
    
    [self test];
    
    UIView *view = [UIView new];
    NSDate *date = [NSDate new];
    NSLog(@"mess memory:%@ %@", view, date);
    // 这里会崩溃,因为观察者对象已经被释放了
    self.observedObject.value = 20;
}
@end
