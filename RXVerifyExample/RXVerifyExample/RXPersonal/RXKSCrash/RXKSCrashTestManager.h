//
//  RXKSCrashTestManager.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/23.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RXKSCrashTestManager : NSObject
+ (instancetype)sharedInstance;

- (void)test;
@end

NS_ASSUME_NONNULL_END
