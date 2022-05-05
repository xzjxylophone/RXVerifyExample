//
//  RXMachOObject.m
//  RXFishhookDemo
//
//  Created by xuzhijun on 2019/8/20.
//  Copyright © 2019 xuzhijun. All rights reserved.
//

#import "RXMachOObject.h"

@implementation RXMachOObject

- (void)testInstanceMethod {
    NSLog(@"testInstanceMethod:%@", NSStringFromClass([self class]));
}
+ (void)testClassMethod {
}
@end
