//
//  VKAnimationItem.m
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/6/21.
//

#import "VKAnimationItem.h"

@interface VKAnimationItem()

@property (nonatomic, readwrite, strong) NSDate *createDate;
@end

@implementation VKAnimationItem

- (id)init {
    if (self = [super init]) {
        self.createDate = [NSDate new];
        self.expiredSeconds = 20;
    }
    return self;
}
- (BOOL)maybeAnimationException {
    if (self.beginExecuteDate == nil) {
        self.beginExecuteDate = [NSDate new];
        return NO;
    }
    NSDate *now = [NSDate new];
    NSTimeInterval timeInterval = [now timeIntervalSinceDate:self.beginExecuteDate];
    return timeInterval > self.expiredSeconds;
}

@end
