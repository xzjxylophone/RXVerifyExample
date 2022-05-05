//
//  DMLine.m
//  RXVerifyExample
//
//  Created by ceshi on 16/7/11.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "DMLine.h"

@implementation DMLine


- (id)init
{
    self = [super init];
    if (self) {
        _fillColor = [UIColor blackColor];
        _lineWidth = 4;
        self.pointArray = [NSMutableArray array];
        
    }
    return self;
}

@end
