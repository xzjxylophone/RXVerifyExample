//
//  NSObject+RXExt.m
//  RXVerifyExample
//
//  Created by ceshi on 16/5/27.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "NSObject+RXExt.h"






@implementation NSObject (RXRunTime)



+ (void)load
{
    NSArray *ary = @[@(2)];
    NSLog(@"%@, ary:%@", [self class], ary);
}




@end



@implementation NSObject (RXRunLoop)

@end


@implementation NSObject (RXDispatch)

@end





