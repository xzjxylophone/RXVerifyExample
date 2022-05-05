//
//  RXAFNTest4Object.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/14.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXAFNTest4Object : NSObject


// 一对一的影响:b的值依赖a, b是只读的
@property (nonatomic, assign) int a;
@property (nonatomic, readonly) int b;

// 一对一的影响:b1的值依赖a1, 注意b1与b的区别
@property (nonatomic, assign) int a1;
@property (nonatomic, assign) int b1;



// 一对一的影响:d的值依赖c,在c的赋值过程中会重新赋值d
@property (nonatomic, assign) int c;
@property (nonatomic, assign) int d;


// 多个影响1个
@property (nonatomic, assign) int c1;
@property (nonatomic, assign) int c2;
@property (nonatomic, assign) int c3;
@property (nonatomic, assign) int d1;

// e,f之间的关系就相当于AFN中的 AFSecurityPolicy中
// e: pinnedCertificates
// f: pinnedPublicKeys
@property (nonatomic, assign) int e;







// 一对一的影响:另一种实现方法
@property (nonatomic, assign) int g;
@property (nonatomic, assign) int h;

// 一个影响多个
@property (nonatomic, assign) int g1;
@property (nonatomic, assign) int h1;
@property (nonatomic, assign) int h2;
@property (nonatomic, readonly) int h3;

// 互相影响
@property (nonatomic, assign) int i;
@property (nonatomic, assign) int j;

// 多个影响多个-- 方法一: 使用keyPathsForValuesAffectingXXX
@property (nonatomic, assign) int l1;
@property (nonatomic, assign) int l2;
@property (nonatomic, assign) int m1;
@property (nonatomic, assign) int m2;




// 多个影响多个-- 方法二: 使用keyPathsForValuesAffectingValueForKey

@property (nonatomic, assign) int p1;
@property (nonatomic, assign) int p2;
@property (nonatomic, assign) int q1;
@property (nonatomic, assign) int q2;


// 多个影响多个  keyPathsForValuesAffectingXXX  与  keyPathsForValuesAffectingValueForKey 一起使用
@property (nonatomic, assign) int r1;
@property (nonatomic, assign) int r2;
@property (nonatomic, assign) int s1;
@property (nonatomic, assign) int s2;




@end
