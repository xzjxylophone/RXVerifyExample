//
//  RXObserverObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXObserverObject.h"
// 观察者对象
@implementation RXObserverObject
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    NSLog(@"keyPath:%@", keyPath);
}

@end
