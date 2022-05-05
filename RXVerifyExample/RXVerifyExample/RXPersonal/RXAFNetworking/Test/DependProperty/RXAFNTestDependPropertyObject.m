//
//  RXAFNTestDependPropertyObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/23.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNTestDependPropertyObject.h"
#import "RXAFNTest4Object.h"
#import "RXAFNTest5Object.h"
@interface RXAFNTestDependPropertyObject ()

@property (nonatomic, strong) RXAFNTest4Object *test4Object;
@property (nonatomic, strong) RXAFNTest5Object *test5Object;

@end
@implementation RXAFNTestDependPropertyObject
- (id)init
{
    if (self = [super init]) {
        self.test4Object = [RXAFNTest4Object new];
        self.test5Object = [RXAFNTest5Object new];
    }
    return self;
}
- (void)test_dependProperty_A_B {
    [self.test4Object addObserver:self forKeyPath:@"b" options:NSKeyValueObservingOptionNew context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.a = 5;
    });
}
- (void)test_dependProperty_A1_B1 {
    [self.test4Object addObserver:self forKeyPath:@"b1" options:NSKeyValueObservingOptionNew context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.a1 = 5;
    });
}
- (void)test_dependProperty_C_D
{
    [self.test4Object addObserver:self forKeyPath:@"d" options:NSKeyValueObservingOptionNew context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.c = 5;
    });
}

- (void)test_dependProperty_C1_C2_C3_D1
{
    [self.test4Object addObserver:self forKeyPath:@"d1" options:NSKeyValueObservingOptionNew context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.c1 = 10;
        self.test4Object.c2 = 20;
        self.test4Object.c3 = 30;
    });
}
- (void)test_dependProperty_E_F
{
    [self.test4Object addObserver:self forKeyPath:@"f" options:NSKeyValueObservingOptionNew context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.e = 5;
    });
}


- (void)test_dependProperty_G_H
{
    [self.test4Object addObserver:self forKeyPath:@"h" options:NSKeyValueObservingOptionNew context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.g = 5;
    });
}
- (void)test_dependProperty_G1_H1_H2_H3
{
    [self.test4Object addObserver:self forKeyPath:@"h1" options:NSKeyValueObservingOptionNew context:nil];
    [self.test4Object addObserver:self forKeyPath:@"h2" options:NSKeyValueObservingOptionNew context:nil];
    [self.test4Object addObserver:self forKeyPath:@"h3" options:NSKeyValueObservingOptionNew context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.g1 = 10;
    });
}
- (void)test_dependProperty_I_J_1
{
    [self.test4Object addObserver:self forKeyPath:@"i" options:NSKeyValueObservingOptionNew context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.j = 10;
    });
}

- (void)test_dependProperty_I_J_2
{
    [self.test4Object addObserver:self forKeyPath:@"j" options:NSKeyValueObservingOptionNew context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.i = 10;
    });
}




- (void)test_dependProperty_L1_L2_M1_M2
{
    [self.test4Object addObserver:self forKeyPath:@"m1" options:NSKeyValueObservingOptionNew context:nil];
    [self.test4Object addObserver:self forKeyPath:@"m2" options:NSKeyValueObservingOptionNew context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.l1 = 10;
        self.test4Object.l2 = 10;
    });
}
- (void)test_dependProperty_P1_P2_Q1_Q2
{
    [self.test4Object addObserver:self forKeyPath:@"q1" options:NSKeyValueObservingOptionNew context:nil];
    [self.test4Object addObserver:self forKeyPath:@"q2" options:NSKeyValueObservingOptionNew context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.p1 = 10;
        self.test4Object.p2 = 10;
    });
}
- (void)test_dependProperty_R1_R2_S1_S2
{
    [self.test4Object addObserver:self forKeyPath:@"s1" options:NSKeyValueObservingOptionNew context:nil];
    [self.test4Object addObserver:self forKeyPath:@"s2" options:NSKeyValueObservingOptionNew context:nil];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test4Object.r1 = 10;
        self.test4Object.r2 = 10;
    });
}





- (void)test_dependProperty2 {
    //    [self.test5Object addObserver:self forKeyPath:@"a" options:NSKeyValueObservingOptionNew context:nil];
    [self.test5Object addObserver:self forKeyPath:@"b" options:NSKeyValueObservingOptionNew context:nil];
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.test5Object.a = 5;
    });
}


- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"KeyPath:%@, change.new:%@", keyPath, change[@"new"]);
}
@end
