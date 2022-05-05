//
//  RXMethodStaticObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/7/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMethodStaticObject.h"

@implementation RXMethodStaticObject

- (void)test {
    static NSInteger a = 0;
    a++;
    NSLog(@"address:%p, a:%zd", self, a);
}
@end
