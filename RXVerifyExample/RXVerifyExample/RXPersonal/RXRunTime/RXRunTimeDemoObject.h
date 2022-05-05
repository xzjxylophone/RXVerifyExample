//
//  RXRunTimeDemoObject.h
//  RXVerifyExample
//
//  Created by ceshi on 16/5/25.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXRunTimeDemoBaseObject.h"

@interface RXRunTimeDemoObject : RXRunTimeDemoBaseObject

@property (nonatomic, strong) UIButton *button;
@property (nonatomic, weak) id delegate;
@property (nonatomic, assign) NSInteger *intProperty;
@property (nonatomic, copy) NSString *msg;

- (void)testPrint;
- (void)testPrint2;

+ (void)testClassMethod;

+ (void)testClassPrint;

@end
