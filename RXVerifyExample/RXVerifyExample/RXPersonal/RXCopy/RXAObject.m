
//
//  RXAObject.m
//  RXVerifyExample
//
//  Created by ceshi on 16/9/4.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RXAObject.h"

@implementation RXAObject

- (id)copy
{
    Class cls = [self class];
    id object = [[cls alloc] init];
    RXAObject *tmp = (RXAObject *)object;
    tmp.m_a = self.m_a;
    return tmp;
}


- (void)abcTest {
    NSLog(@"1234567890");
}

@end
