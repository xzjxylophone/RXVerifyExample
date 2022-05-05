//
//  RXWeakPropertyManager.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2020/7/26.
//  Copyright © 2020 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RXWeakPropertyManager : NSObject
+ (instancetype)sharedInstance;
- (void)test;
@end

NS_ASSUME_NONNULL_END
