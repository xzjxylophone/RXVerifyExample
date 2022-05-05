//
//  RXCMSBObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/4/1.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXCMSBObject.h"

@implementation RXCMSBObject

+ (void)test {
    dispatch_async(dispatch_get_main_queue(), ^{
        [self print];
    });
}

+ (void)print {
    NSLog(@"111");
}
@end
