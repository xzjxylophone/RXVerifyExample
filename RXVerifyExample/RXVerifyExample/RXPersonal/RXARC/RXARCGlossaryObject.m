//
//  RXARCGlossaryObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/22.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCGlossaryObject.h"

/*
 1. function
 2. method
 3. retainable object pointer (retainable pointer)
 4. retainable object pointer type
 5. non-retainable pointer type
 6. object point type : id & Class
 5. callee和caller
 10. Class extensions
 11. Categories
 
 */

// 非Objective-C类中的任何function,叫做 function(函数)
void printString(NSString *string) {
    NSLog(@"%@", string);
}

@interface RXARCGlossaryObject()
// 以下的三种都是 retainable object pointer
@property (nonatomic, copy) void(^block)(void);
@property (nonatomic, strong) NSObject *object;
@property (nonatomic, strong) __attribute__((NSObject)) CFStringRef stringRef;
@end

@implementation RXARCGlossaryObject
// Objective-C类中的instance method 或者 class method 叫做 method(方法)
+ (void)classMethodTest
{
}
- (void)instanceTest
{
    int a = 0;
    void *b = &a;
    id c = (__bridge id)b;
    void *d = (__bridge void *)c;
    int *e = (int *)d;
    NSLog(@"%ld", (long)*e);
}



- (void)test
{
}



// caller:调用者
// callee:被调用者
- (void)_caller
{
    [self _callee];
}
- (void)_callee
{
}

@end
