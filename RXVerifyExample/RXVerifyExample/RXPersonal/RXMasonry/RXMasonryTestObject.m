
//
//  RXMasonryTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/10.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryTestObject.h"
#import "RXMasonryObject.h"

@implementation RXMasonryTestObject

- (void)mainTest
{
    RXMasonryObject *rxMasonryObject = [RXMasonryObject new];
    NSLog(@"%zd", rxMasonryObject.b);
}

@end
