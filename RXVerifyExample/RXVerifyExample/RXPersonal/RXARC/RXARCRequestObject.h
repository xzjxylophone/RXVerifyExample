//
//  RXARCRequestObject.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@class RXARCRequestObject;

@protocol RXARCRequestObjectDelegate
- (void)requestFinished:(RXARCRequestObject *)object;
@end

@interface RXARCRequestObject : NSObject

@property (nonatomic, weak) id<RXARCRequestObjectDelegate> delegate;

- (void)start;
- (void)start2;
@end

NS_ASSUME_NONNULL_END
