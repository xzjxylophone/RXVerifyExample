//
//  RXMultThreadOperation.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2020/9/4.
//  Copyright © 2020 Rush.D.Xzj. All rights reserved.
//

#import "RXMultThreadOperation.h"

@interface RXMultThreadOperation () <RXMultThreadViewLoadDelegate>

@property (nonatomic, assign) NSInteger renderIndex;
@property (assign, nonatomic, getter = isExecuting) BOOL executing;
@property (assign, nonatomic, getter = isFinished) BOOL finished;
@property (nonatomic, weak) RXMultThreadView *multThreadView;

@end

@implementation RXMultThreadOperation
@synthesize executing = _executing;
@synthesize finished = _finished;



#pragma mark - init & dealloc
- (id)initWithMultThreadView:(RXMultThreadView *)multThreadView {
    if (self = [self init]) {
        self.renderIndex = multThreadView.renderIndex;
        self.multThreadView = multThreadView;
        self.multThreadView.loadDelegate = self;
    }
    return self;
}
#pragma mark - override
- (void)start {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (self.multThreadView == nil) {
            NSLog(@"aaaa: cancel, render_index:%ld", (long)self.renderIndex);
            [self cancel];
            return;
        }
        self.finished = NO;
        self.executing = YES;
        [self.multThreadView render_really];
    });
}
- (BOOL)isConcurrent {
    return YES;
}


#pragma mark - Private
- (void)done {
    self.finished = YES;
    self.executing = NO;
}
- (void)cancel {
//    @synchronized (self) {
        [self cancelInternal];
//        self.endTime = CFAbsoluteTimeGetCurrent();
//    }
    
}

- (void)cancelInternal {
    if (self.isFinished) return;
    [super cancel];
    
//    [self stopTimer];
    if (self.isExecuting) self.executing = NO;
    if (!self.isFinished) self.finished = YES;
}
#pragma mark - RXMultThreadViewLoadDelegate

- (void)multThreadViewWillRender:(RXMultThreadView *)multThreadView {
    NSLog(@"aaaa: will render, render_index:%ld", (long)self.renderIndex);
}
- (void)multThreadViewDidRender:(RXMultThreadView *)multThreadView {
    NSLog(@"aaaa: did render, render_index:%ld", (long)self.renderIndex);
    [self done];
}
#pragma mark - Property
- (void)setFinished:(BOOL)finished {
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)executing {
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}
@end
