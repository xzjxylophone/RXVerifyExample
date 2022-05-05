//
//  RXAssociateObject+Associate.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/11/16.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXAssociateObject+Associate.h"
#import "RXNotificationDelegate.h"
#import <objc/runtime.h>

@interface RXAssociateObject()
@property (nonatomic, strong) RXNotificationDelegate *notiDelegate;

@end


@implementation RXAssociateObject (Associate)

static void *NSNotificationProtectKey = &NSNotificationProtectKey;

- (RXNotificationDelegate *)notiDelegate {
    id delegate = objc_getAssociatedObject(self, NSNotificationProtectKey);
    if (!delegate) {
        delegate = [[RXNotificationDelegate alloc] initWithObserver:self];
        self.notiDelegate = delegate;
    }
    return delegate;
}

- (void)setNotiDelegate:(RXNotificationDelegate *)notiDelegate {
    objc_setAssociatedObject(self, NSNotificationProtectKey, notiDelegate, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (void)rxAssociate_doSomething {
    UIViewController *vc = [UIViewController new];
    NSLog(@"RXAssociateObject rxAssociate_doSomething self.notiDelegate: %@, vc:%p", self.notiDelegate, vc);
}

- (void)dealloc {
    UIViewController *vc = [UIViewController new];
    NSLog(@"RXAssociateObject dealloc self.observer:%@, vc:%p, runloop:%p", self.notiDelegate, vc, [NSRunLoop currentRunLoop]);
}
@end
