//
//  RXMultThreadOperationQueueManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2020/9/4.
//  Copyright © 2020 Rush.D.Xzj. All rights reserved.
//

#import "RXMultThreadOperationQueueManager.h"

@interface RXMultThreadOperationQueueManager ()
@property (nonatomic, strong, readwrite) NSOperationQueue *operationQueue;

@end

@implementation RXMultThreadOperationQueueManager



#pragma mark - Signal
- (id)init {
    if (self = [super init]) {
        self.operationQueue = [NSOperationQueue new];
        self.operationQueue.maxConcurrentOperationCount = 3;
    }
    return self;
}
+ (instancetype)sharedInstance {
    static id sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

@end
