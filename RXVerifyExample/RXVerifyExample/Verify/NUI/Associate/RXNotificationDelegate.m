//
//  RXNotificationDelegate.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/11/16.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXNotificationDelegate.h"
#import "RXAssociateObject+Associate.h"
@interface RXNotificationDelegate()

@property (nonatomic, assign) RXAssociateObject *observer;
@end

@implementation RXNotificationDelegate
- (instancetype)initWithObserver:(id)observer {
    if (self = [super init]) {
        _observer = observer;
    }
    return self;
}

- (void)dealloc {
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
//        
//    });
    
    UIViewController *vc = [UIViewController new];
    NSLog(@"RXNotificationDelegate dealloc self.observer:%@, vc:%p runloop:%p", self.observer, vc, [NSRunLoop currentRunLoop]);
    [self.observer rxAssociate_doSomething];
    
    
}
@end
