//
//  RXAFNSerializationTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/3.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNSerializationTestObject.h"
#import "RXAFURLRequestSerialization.h"
@implementation RXAFNSerializationTestObject
- (void)test1
{
    NSString *v1 = RXAFPercentEscapedStringFromString(@"abc");
    NSLog(@"v1:%@", v1);
    
    v1 = RXAFPercentEscapedStringFromString(@"我们");
    NSLog(@"v1:%@", v1);
    
    v1 = RXAFPercentEscapedStringFromString(@"我们=kk&abc=一切ok");
    NSLog(@"v1:%@", v1);
    
    v1 = RXAFPercentEscapedStringFromString(@"?我们=kk&abc=一切ok");
    NSLog(@"v1:%@", v1);
}

- (void)test2
{
    NSDictionary *dic1 = @{@"abc": @"abc",
                           @"123": @(123)
                           };
    NSString *v1 = RXAFQueryStringFromParameters(dic1);
    NSLog(@"v1:%@", v1);
    
    NSArray *ary1 = RXAFQueryStringPairsFromKeyAndValue(nil, dic1);
    NSLog(@"ary1:%@", ary1);
    
    // 当 value是 array/set/其他  的时候, key是nil是有问题的
    // 只有当value 是dic的时候,key才能为nil
    ary1 = RXAFQueryStringPairsFromKeyAndValue(nil, @[@(1), @"abc", @(3333)]);
    NSLog(@"ary1:%@", ary1);
    
    // key = @"kkkk[abc]"
    // value = @"abc"
    ary1 = RXAFQueryStringPairsFromKeyAndValue(@"kkkk", dic1);
    NSLog(@"ary1:%@", ary1);
}
@end
