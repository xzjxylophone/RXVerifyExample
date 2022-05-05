//
//  RXPCQueueBufferManager.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/7/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RXPCQueueBufferManager : NSObject

- (void)test;


+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
