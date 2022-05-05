//
//  LSApplicationWorkspace.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/11/20.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 Class LSApplicationWorkspace is implemented in both /System/Library/Frameworks/CoreServices.framework/CoreServices (0x1c756f8d8) and /var/containers/Bundle/Application/D39A918B-EF4D-40F4-AC44-836993EE3290/RXVerifyExample.app/RXVerifyExample (0x1016b7df8). One of the two will be used. Which one is undefined.
 */
// 因为是先加载了系统framework，所以没有问题
@interface LSApplicationWorkspace : NSObject

@end

NS_ASSUME_NONNULL_END
