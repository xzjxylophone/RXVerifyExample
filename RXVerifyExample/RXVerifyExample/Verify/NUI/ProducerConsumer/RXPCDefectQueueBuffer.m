//
//  RXPCDefectQueueBuffer.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/7/4.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXPCDefectQueueBuffer.h"
@interface RXPCDefectQueueBuffer()

@property (nonatomic, strong) NSMutableArray *bufferArray;
@property (nonatomic, assign) NSInteger realLength;
@property (nonatomic, assign, readwrite) NSInteger maxLength; // maxLength = realLength + 1;
@property (nonatomic, assign) NSInteger nextIn;
@property (nonatomic, assign) NSInteger nextOut;

@property (nonatomic, strong) NSLock *lock;

@end
@implementation RXPCDefectQueueBuffer

#pragma mark - Constructor And Destructor
+ (id)defaultQueueBuffer {
    RXPCDefectQueueBuffer *result = [[RXPCDefectQueueBuffer alloc] initWithMaxLength:10];
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
        self.lock = [NSLock new];
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
    [self.lock lock];
    if (self.full) {
        NSLog(@"push full");
        [self.lock unlock];
        return;
    }
    [self.bufferArray replaceObjectAtIndex:self.nextIn withObject:data];
    self.nextIn = [self increase:self.nextIn];
    NSLog(@"push:%@ nextIn: %zd", data, self.nextIn);
    [self.lock unlock];
}
- (id)pop {
    [self.lock lock];
    if (self.empty) {
        NSLog(@"pop empty");
        [self.lock unlock];
        return nil;
    }
    id value = self.bufferArray[self.nextOut];
    self.bufferArray[self.nextOut] = [NSNull new];
    self.nextOut = [self increase:self.nextOut];
    NSLog(@"pop:%@ nextOut: %zd", value, self.nextOut);
    [self.lock unlock];
    return value;
}

- (NSInteger)increase:(NSInteger)next {
    return (next + 1) % self.realLength;
}

- (void)print {
    NSLog(@"nextIn:%zd, nextOut:%zd, full:%@, empty:%@", self.nextIn, self.nextOut, self.full ? @"YES" : @"NO", self.empty ? @"YES" : @"NO");
}
@end
