//
//  RXAFNTest4Object.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/14.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNTest4Object.h"

@interface RXAFNTest4Object ()

@property (nonatomic, assign) int f;

@end

@implementation RXAFNTest4Object


- (int)b
{
    return self.a + 1;
}
+ (NSSet *)keyPathsForValuesAffectingB
{
    return [NSSet setWithObjects:@"a", nil];
}



+ (NSSet *)keyPathsForValuesAffectingB1
{
    return [NSSet setWithObjects:@"a1", nil];
}




- (void)setC:(int)c
{
    _c = c;
    self.d = _c + 2;
}
+ (NSSet *)keyPathsForValuesAffectingD
{
    return [NSSet setWithObjects:@"c", nil];
}



+ (NSSet *)keyPathsForValuesAffectingD1
{
    return [NSSet setWithObjects:@"c1", @"c2", @"c3", nil];
}



- (void)setE:(int)e
{
    _e = e;
    self.f = _e + 3;
}

+ (NSSet *)keyPathsForValuesAffectingF
{
    return [NSSet setWithObjects:@"e", nil];
}




- (int)h3
{
    return self.g1 + 3;
}

+ (NSSet *)keyPathsForValuesAffectingI
{
    return [NSSet setWithObjects:@"j", nil];
}
+ (NSSet *)keyPathsForValuesAffectingJ
{
    return [NSSet setWithObjects:@"i", nil];
}
+ (NSSet *)keyPathsForValuesAffectingM1
{
    return [NSSet setWithObjects:@"l1", @"l2", nil];
}
+ (NSSet *)keyPathsForValuesAffectingM2
{
    return [NSSet setWithObjects:@"l1", @"l2", nil];
}

+ (NSSet *)keyPathsForValuesAffectingS1
{
    return [NSSet setWithObjects:@"r1", @"r2", nil];
}
+ (NSSet *)keyPathsForValuesAffectingS2
{
    return [NSSet setWithObjects:@"r1", @"r2", nil];
}


+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key {
   
    // 注意这里的区别,g影响h,这里要返回g,并指明是g的变化影响h
    if ([key isEqualToString:@"h"]) {
        return [NSSet setWithObject:@"g"];
    }
    
    if ([key isEqualToString:@"h1"] || [key isEqualToString:@"h2"] || [key isEqualToString:@"h3"]) {
        return [NSSet setWithObject:@"g1"];
    }
    
    if ([key isEqualToString:@"q1"] || [key isEqualToString:@"q2"]) {
        return [NSSet setWithObjects:@"p1", @"p2", nil];
    }
    
    
    if ([key isEqualToString:@"s1"] || [key isEqualToString:@"s2"]) {
        return [NSSet setWithObjects:@"r1", @"r2", nil];
    }
    
    return [super keyPathsForValuesAffectingValueForKey:key];
}


@end
