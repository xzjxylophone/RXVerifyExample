//
//  RXSelfRequestManager.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/4.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
// http://blog.sunnyxx.com/2015/01/17/self-in-arc/
NS_ASSUME_NONNULL_BEGIN

@interface RXSelfRequestManager : NSObject
+ (instancetype)sharedInstance;
- (void)test;
@end

NS_ASSUME_NONNULL_END
