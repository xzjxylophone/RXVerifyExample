//
//  RXMultThreadOperationQueueManager.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2020/9/4.
//  Copyright © 2020 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RXMultThreadOperationQueueManager : NSObject
+ (instancetype)sharedInstance;


@property (nonatomic, strong, readonly) NSOperationQueue *operationQueue;

@end

NS_ASSUME_NONNULL_END
