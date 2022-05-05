//
//  RXRunLoop.h
//  RXVerifyExample
//
//  Created by ceshi on 16/5/25.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXRunLoopExeObject.h"

@interface RXRunLoop : NSObject



@property (nonatomic, readonly) NSThread *thread;
@property (nonatomic, readonly) NSRunLoop *runLoop;
@property (nonatomic, readonly) CFRunLoopRef runLoopRef;

@property (nonatomic, readonly) NSString *currentMode;





#pragma mark - Public
- (void)executeWithRXRunLoopExeObject:(RXRunLoopExeObject *)object;
- (void)stop;








- (NSString *)currentRunLoopInfo;

- (NSString *)description;


@end
