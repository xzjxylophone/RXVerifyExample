//
//  NSArray+RXVerifyExample.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/9/3.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "NSArray+RXVerifyExample.h"

@implementation NSArray (RXVerifyExample)
+ (void)load
{
    // 会调用父类的load(NSObject)
    [super load];
    NSArray *ary = @[@(1)];
    NSLog(@"%@, ary:%@", [self class], ary);
    
    BOOL k = 5;
    if (k == YES) {
        NSLog(@"111");
    }
}
@end
