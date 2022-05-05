//
//  RXCObject.m
//  RXVerifyExample
//
//  Created by ceshi on 16/9/4.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RXCObject.h"

@implementation RXCObject
- (id)copy
{
    id object = [super copy];
    RXCObject *tmp = (RXCObject *)object;
    tmp.m_c = self.m_c;
    return tmp;
}
@end
