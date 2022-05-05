//
//  RXPrintUtil.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/17.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXPrintUtil.h"

@implementation RXPrintUtil

+ (void)printBlockWithPrefix:(NSString *)prefix block:(id)block
{
    NSLog(@"%@, class:%@, address:%p", prefix, [block class], block);
}
@end
