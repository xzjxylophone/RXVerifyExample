//
//  RXMRCUtil.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/19.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXMRCUtil : NSObject
+ (NSUInteger)objectRetainCount:(id)object;

+ (void)objectRelease:(id)object;
@end
