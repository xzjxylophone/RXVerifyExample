//
//  RXThreadMemoryManager.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/8.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RXThreadMemoryManager : NSObject
- (void)test;


+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END
