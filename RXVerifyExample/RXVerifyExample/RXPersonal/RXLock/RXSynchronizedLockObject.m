//
//  RXSynchronizedLockObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/9.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXSynchronizedLockObject.h"

@interface RXSynchronizedLockObject()

@end

@implementation RXSynchronizedLockObject
- (void)push:(id)element
{
    @synchronized(self) {
        [self.elementArray addObject:element];
    }
}
@end
