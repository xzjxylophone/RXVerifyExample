//
//  RXARCTmpObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/19.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXARCTmpObject.h"

@implementation RXARCTmpObject
- (NSString *)description
{
    return NSStringFromClass([self class]);
}
- (void)dealloc
{
    NSLog(@"RXARCTmpObject dealloc");
}
@end
