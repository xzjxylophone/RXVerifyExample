//
//  RBDMuteSwitchObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/18.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RBDMuteSwitchObject.h"
#import "RBDMuteSwitch.h"
@interface RBDMuteSwitchObject()<RBDMuteSwitchDelegate>



@end
@implementation RBDMuteSwitchObject

- (void)test {
    RBDMuteSwitch *tmp = [RBDMuteSwitch sharedInstance];
    tmp.delegate = self;
    [tmp detectMuteSwitch];
}
#pragma mark - RBDMuteSwitchDelegate
- (void)isMuted:(BOOL)muted {
    NSLog(@"muted:%d", muted);
}
@end
