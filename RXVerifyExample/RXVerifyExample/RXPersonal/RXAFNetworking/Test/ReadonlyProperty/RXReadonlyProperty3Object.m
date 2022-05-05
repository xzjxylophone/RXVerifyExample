//
//  RXReadonlyProperty3Object.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/21.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXReadonlyProperty3Object.h"

@interface RXReadonlyProperty1Object ()
@property (nonatomic, readwrite) NSInteger a1;
@end

@implementation RXReadonlyProperty3Object

- (void)printValue
{
    NSLog(@"printValue a1:%zd", self.a1);
}
- (void)print2Value
{
    self.a1 = 100;
    NSLog(@"print2Value a1:%zd", self.a1);
}
@end
