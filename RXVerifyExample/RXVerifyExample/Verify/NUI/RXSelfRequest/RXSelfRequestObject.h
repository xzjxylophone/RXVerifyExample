//
//  RXSelfRequestObject.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/4.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@class RXSelfRequestObject;
@protocol RXSelfRequestObjectDelegate <NSObject>

- (void)requesetFinished:(RXSelfRequestObject *)request;

@end


@interface RXSelfRequestObject : NSObject

// hook __block_copy问题  https://www.jianshu.com/p/0a3d00485c7f
@property (nonatomic, copy, nullable) void(^completionBlock)(RXSelfRequestObject *request);
@property (nonatomic, weak) id<RXSelfRequestObjectDelegate> delegate;
- (void)start;

@end

NS_ASSUME_NONNULL_END
