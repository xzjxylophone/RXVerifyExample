//
//  VKDownloadTestManager.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VKDownloadTestManager : NSObject
+ (instancetype)sharedInstance;
- (void)test;
@end

NS_ASSUME_NONNULL_END
