//
//  RXParentLockObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/9.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXParentLockObject.h"

@implementation RXParentLockObject
- (id)init
{
    if (self = [super init]) {
        self.elementArray = [NSMutableArray new];
    }
    return self;
}
- (void)push:(id)element
{
    NSLog(@"parent push element");
}
@end
