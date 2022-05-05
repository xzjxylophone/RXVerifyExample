//
//  RXAFNTest3Object.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/14.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNTest3Object.h"

static NSInteger s_Value = 0;

@implementation RXAFNTest3Object

+ (NSInteger)value
{
    return s_Value;
}
+ (void)setValue:(NSInteger)value
{
    s_Value = value;
}

@end
