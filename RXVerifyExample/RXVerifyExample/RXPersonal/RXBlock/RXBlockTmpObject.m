//
//  RXBlockTmpObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/14.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXBlockTmpObject.h"

@implementation RXBlockTmpObject
+ (id)tmpObjectWithName:(NSString *)name
{
    RXBlockTmpObject *tmp = [RXBlockTmpObject new];
    tmp.name = name;
    return tmp;
}
- (NSString *)description
{
    // 输出内存地址，监控内存变化
    return [NSString stringWithFormat:@"address:%p, name:%@", self, self.name];
}
@end
