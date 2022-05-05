//
//  RXMRSWPerson.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/7.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXMRSWPerson.h"

@interface RXMRSWPerson() {
    @private
    NSString *_name;
}
@property (nonatomic, strong) dispatch_queue_t queue;
@end

@implementation RXMRSWPerson

- (id)init {
    if (self = [super init]) {
        _name = @"";
    }
    return self;
}
- (dispatch_queue_t)queue {
    if (_queue == nil) {
        _queue = dispatch_queue_create("com.rxmrswperson.com", DISPATCH_QUEUE_CONCURRENT);
    }
    return _queue;
}


- (void)setName:(NSString *)name {
    dispatch_barrier_async(self.queue, ^{
        _name = name;
    });
}

- (NSString *)name {
    __block NSString *tmpName;
    dispatch_sync(self.queue, ^{
        tmpName = _name;
    });
    return tmpName;
}


@end
