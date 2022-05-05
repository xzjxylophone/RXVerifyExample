//
//  RXBObject.m
//  RXVerifyExample
//
//  Created by ceshi on 16/9/4.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RXBObject.h"

@implementation RXBObject
- (id)copy
{
    id object = [super copy];
    RXBObject *tmp = (RXBObject *)object;
    tmp.m_b = self.m_b;
    return tmp;
}
@end
