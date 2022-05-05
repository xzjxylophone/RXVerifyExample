//
//  RXARCPrintMemoryAddressObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/17.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCPrintMemoryAddressObject.h"

@implementation RXARCPrintMemoryAddressObject
- (void)test
{
    NSObject *obj = [NSObject new];
    NSLog(@"指针指向的地址:%p", obj);
    NSLog(@"指针所在的地址:%p", &obj);
    NSLog(@"指针所在的地址:%x", (unsigned int)&obj);
    NSLog(@"obj end");
    
    NSObject *obj2 = self;
    NSLog(@"指针指向的地址:%p", self);
    NSLog(@"指针指向的地址:%p", obj2);
    NSLog(@"指针所在的地址:%p", &obj2);
    NSLog(@"指针所在的地址:%x", (unsigned int)&obj2);
    NSLog(@"obj2 end");
    
    int a = 10;
    NSLog(@"指针所在的地址:%p", &a);
}
@end
