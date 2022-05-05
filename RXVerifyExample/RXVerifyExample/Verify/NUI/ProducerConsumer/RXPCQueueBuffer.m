//
//  RXPCQueueBuffer.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/7/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXPCQueueBuffer.h"

@interface RXPCQueueBuffer()

@property (nonatomic, strong) NSMutableArray *bufferArray;
@property (nonatomic, assign) NSInteger realLength;
@property (nonatomic, assign, readwrite) NSInteger maxLength; // maxLength = realLength + 1;
@property (nonatomic, assign) NSInteger nextIn;
@property (nonatomic, assign) NSInteger nextOut;
@property (nonatomic, strong) NSCondition *popCondition;
@property (nonatomic, strong) NSCondition *pushCondition;
@end

@implementation RXPCQueueBuffer

#pragma mark - Constructor And Destructor
+ (id)defaultQueueBuffer {
    RXPCQueueBuffer *result = [[RXPCQueueBuffer alloc] initWithMaxLength:8];
    return result;
}
- (id)initWithMaxLength:(NSInteger)maxLength {
    if (self = [super init]) {
        NSInteger realLength = maxLength + 1;
        NSMutableArray *ary = [NSMutableArray new];
        for (NSInteger i = 0; i < realLength; i++) {
            [ary addObject:[NSNull new]];
        }
        self.bufferArray = ary;
        self.realLength = realLength;
        self.maxLength = maxLength;
        self.nextIn = 0;
        self.nextOut = 0;
        self.popCondition = [NSCondition new];
        self.pushCondition = [NSCondition new];
    }
    return self;
}


- (BOOL)empty {
    return self.nextIn == self.nextOut;
}

- (BOOL)full {
    return [self increase:self.nextIn] == self.nextOut;
}
// 这里的几个日志输出一定要在unlock前输出
- (void)push:(id)data {
    [self.pushCondition lock];
    if (self.full) {
        NSLog(@"push full");
        [self.pushCondition wait];
        NSLog(@"push full leave");
    }
    [self.bufferArray replaceObjectAtIndex:self.nextIn withObject:data];
    self.nextIn = [self increase:self.nextIn];
    NSLog(@"push:%@ nextIn: %zd", data, self.nextIn);
    [self.popCondition signal];
    [self.pushCondition unlock];
}
- (id)pop {
    [self.popCondition lock];
    if (self.empty) {
        NSLog(@"pop empty");
        [self.popCondition wait];
        NSLog(@"pop empty leave");
    }
    id value = self.bufferArray[self.nextOut];
    self.bufferArray[self.nextOut] = [NSNull new];
    self.nextOut = [self increase:self.nextOut];
    [self.pushCondition signal];
    NSLog(@"pop:%@ nextOut: %zd", value, self.nextOut);
    [self.popCondition unlock];
    return value;
}

- (NSInteger)increase:(NSInteger)next {
    return (next + 1) % self.realLength;
}
- (void)print {
    NSLog(@"nextIn:%zd, nextOut:%zd, full:%@, empty:%@", self.nextIn, self.nextOut, self.full ? @"YES" : @"NO", self.empty ? @"YES" : @"NO");
}
@end
