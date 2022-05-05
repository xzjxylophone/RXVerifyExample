//
//  RXClassMetaClassOverrideObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/7.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXClassMetaClassOverrideObject.h"

@implementation RXClassMetaClassOverrideObject
+ (id)class
{
    NSLog(@"+ class");
    return nil;
}
- (id)class
{
    NSLog(@"- class");
    return nil;
}
@end
