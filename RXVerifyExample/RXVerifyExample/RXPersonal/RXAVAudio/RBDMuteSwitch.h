//
//  RBDMuteSwitch.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/18.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN


@protocol RBDMuteSwitchDelegate <NSObject>
- (void)isMuted:(BOOL)muted;
@end


@interface RBDMuteSwitch : NSObject
@property (nonatomic, weak) id<RBDMuteSwitchDelegate> delegate;
/** Creates a shared instance
 */
+ (RBDMuteSwitch *)sharedInstance;

/** Determines if the device is muted, wait for delegate callback using isMuted: on your delegate.
 */
- (void)detectMuteSwitch;
@end

NS_ASSUME_NONNULL_END
