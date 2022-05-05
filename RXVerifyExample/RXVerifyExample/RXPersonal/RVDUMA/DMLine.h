//
//  DMLine.h
//  RXVerifyExample
//
//  Created by ceshi on 16/7/11.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DMLine : NSObject
@property (nonatomic, strong) UIBezierPath *bezierPath;

@property (nonatomic, strong) NSMutableArray *pointArray;

@property (nonatomic, strong) UIColor *fillColor;
@property (nonatomic, assign) CGFloat alpha;
@property (nonatomic, assign) CGFloat lineWidth;

@property (nonatomic, assign) BOOL isComplete;

@end
