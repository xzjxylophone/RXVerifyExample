//
//  RXClassExtObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/4/1.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXClassExtObject.h"
#import "RXClassExtObject+Private.h"
@implementation RXClassExtObject
- (void)print1 {
    NSLog(@"str1:%@", self.str1);
}
- (void)print2 {
    NSLog(@"str1:%@, str2:%@", self.str1, self.str2);
}
@end
