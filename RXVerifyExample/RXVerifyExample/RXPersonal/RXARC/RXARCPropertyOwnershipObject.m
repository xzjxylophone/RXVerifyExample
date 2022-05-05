//
//  RXARCPropertyOwnershipObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/21.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCPropertyOwnershipObject.h"

@interface RXARCPropertyOwnershipObject() {
    __strong NSObject *_strongObject;
//    // 默认的是__strong
//    NSObject *_strong2Object;
    __strong NSObject *_tmpCopyObject;
    __weak NSObject *_weakObject;
    NSInteger _a;
    // WARNING: 'objc_ownership' only applies to Objective-C object or block pointer types; type here is 'NSInteger' (aka 'long')
//    __unsafe_unretained NSInteger _b;
    __unsafe_unretained NSObject *_unsafeUnretainedObject;
    // ERROR: instance variable cannot have __autoreleasing ownership
//    __autoreleasing NSObject *_autoreleasingObject;
}

// 如果改成了其他的(assign,weak,unsafe_unretained),那么在__strong NSObject *_strongObject;会出现:
// Exisiting instance variable '_strongObject' for property 'strongObject' with assign attribute must be _unsafe_unretained
@property (nonatomic, strong) NSObject *strongObject;
//@property (nonatomic) NSObject *strongObject;

@property (nonatomic, copy) NSObject *tmpCopyObject;


@property (nonatomic, weak) NSObject *weakObject;
@property (nonatomic, unsafe_unretained) NSObject *unsafeUnretainedObject;

@property (nonatomic, assign) NSInteger a;
@property (nonatomic, unsafe_unretained) NSInteger b;
@end

@implementation RXARCPropertyOwnershipObject
//- (id)init
//{
//    return [NSString stringWithFormat:@"123"];
//}
- (void)test
{
//    __strong NSObject *a = _strongObject;
}
@end
