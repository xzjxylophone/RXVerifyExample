//
//  RXPropertyKeywordObject+AssociatedObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/18.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXPropertyKeywordObject+AssociatedObject.h"

#import <objc/runtime.h>
@implementation RXPropertyKeywordObject (AssociatedObject)
- (double)doubleValue {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setDoubleValue:(double)doubleValue {
    objc_setAssociatedObject(self, @selector(doubleValue), @(doubleValue), OBJC_ASSOCIATION_ASSIGN);
}

- (int)intValue {
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

- (void)setIntValue:(int)intValue {
    objc_setAssociatedObject(self, @selector(intValue), @(intValue), OBJC_ASSOCIATION_ASSIGN);
}
@end
