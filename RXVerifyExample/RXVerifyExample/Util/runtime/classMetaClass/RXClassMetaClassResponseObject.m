//
//  RXClassMetaClassResponseObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/7.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXClassMetaClassResponseObject.h"

@implementation RXClassMetaClassResponseObject

//+ (BOOL)respondsToSelector:(SEL)aSelector
//{
//    NSLog(@"class");
//    return [super respondsToSelector:aSelector];
//}


- (void)print_test_response
{
    
}
- (BOOL)respondsToSelector:(SEL)aSelector
{
    NSLog(@"instance");
    return [super respondsToSelector:aSelector];
}
@end
