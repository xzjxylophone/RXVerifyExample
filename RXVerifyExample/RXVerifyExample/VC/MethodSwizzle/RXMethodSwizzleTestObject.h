//
//  RXMethodSwizzleTestObject.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/29.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXMethodSwizzleTestObject : NSObject
- (void)test_roughly;
- (void)test_roughly_after_parent;
- (void)test_roughly_before_parent;
- (void)test_safely;
- (void)test_override_roughly;
- (void)test_oveerrid_safely;
@end
