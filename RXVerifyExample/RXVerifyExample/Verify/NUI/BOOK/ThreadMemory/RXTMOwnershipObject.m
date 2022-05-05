//
//  RXTMOwnershipObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/13.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXTMOwnershipObject.h"
#import "RXExternUtil.h"
@implementation RXTMOwnershipObject
- (void)test {
//    [self test_weak_ownership];
    
    [self test_weak_ownership2];
    
//    [self test_unsafe_unretained_ownership];
    
//    [self test_autoreleasing_ownership];
    
//    [self test_autoreleasing_ownership_2];
    
}
- (void)test_weak_ownership {
    id obj1 = [NSObject new];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-unsafe-retained-assign"
    // 这里会有警告, 用上面的会消除警告
    __weak id obj2 = [NSObject new];
    // obj1 输出正确的结果,obj2输出nil
    NSLog(@"obj1:%@, obj2:%@", obj1, obj2);
#pragma clang diagnostic pop
}
- (void)test_weak_ownership2 {
    id obj1 = [NSObject new];
    __weak id obj2 = obj1;
    NSLog(@"obj2:%@", obj2); // 一切正常
}
- (void)test_unsafe_unretained_ownership {
    id obj1 = [NSObject new];
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-unsafe-retained-assign"
    // 这里会有警告, 用上面的会消除警告
    __unsafe_unretained id obj2 = [NSObject new];
    // obj2 野指针,极大概率会崩溃
    NSLog(@"obj1:%@, obj2:%@", obj1, obj2);
#pragma clang diagnostic pop
}
- (void)test_unsafe_unretained_ownership2 {
    id obj1 = [NSObject new];
    // 这里会有警告, 用上面的会消除警告
    __unsafe_unretained id obj2 = obj1;
    NSLog(@"obj2:%@", obj2); // 一切正常
}




- (void)test_autoreleasing_ownership {
    id obj1 = [NSObject new];
    __autoreleasing id obj2 = [RXTMOwnershipObject new]; // 会加入到自动autoreleasePool中
    _objc_autoreleasePoolPrint();
    id obj3 = [RXTMOwnershipObject new]; // 不会加入到自动autoreleasePool中
    _objc_autoreleasePoolPrint();
    NSLog(@"obj1:%@, obj2:%@, obj3:%@", obj1, obj2, obj3);
}

- (void)test_autoreleasing_ownership_2 {
    id obj1 = [NSObject new];
    __autoreleasing id obj2 = obj1;
    NSLog(@"obj1:%@, obj2:%@", obj1, obj2);
    
//    NSError **pErrorNone = nil; // error : Pointer to non-const type 'NSError *' with no explicit ownership
    
//    NSError *error = nil;
//    NSError **pError = &error; // error : Pointer to non-const type 'NSError *' with no explicit ownership
    
//    __autoreleasing NSError *errorAutoreleasing = nil;
    //    NSError **pErrorAutoreleasing = &errorAutoreleasing; // error: Initializing 'NSError *__strong *' with an expression of type 'NSError *__autoreleasing *' changes retain/release properties of pointer
    
    __autoreleasing NSError *errorAutoreleasing2 = nil;
    __autoreleasing NSError **pErrorAutoreleasing2 = &errorAutoreleasing2; // OK
    [self testWithError:pErrorAutoreleasing2];
    
    NSError *errorStrong = nil;
    __strong NSError **pErrorStrong = &errorStrong; // OK
//    [self testWithError:pErrorStrong]; // error
    
    __weak NSError *errorWeak = nil;
    __weak NSError **pErrorWeak = &errorWeak; // OK
//    [self testWithError:errorWeak]; // error
    
    __unsafe_unretained NSError *errorUnsafeUnretained = nil;
    __unsafe_unretained NSError **pErrorUnsafeUnretained = &errorUnsafeUnretained; // OK
//    [self testWithError:pErrorUnsafeUnretained]; // error
    
}
- (void)testWithError:(NSError **)error {
    
}


@end
