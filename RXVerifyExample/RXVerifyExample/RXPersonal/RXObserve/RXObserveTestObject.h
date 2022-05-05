//
//  RXObserveTestObject.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXObserveTestObject : NSObject
- (void)test_notSameObject;
// 移除一个不存在的
- (void)test_remove_notExist;
- (void)test_remove_multiple;

- (void)test;

- (void)test_after_call_test;
@end
