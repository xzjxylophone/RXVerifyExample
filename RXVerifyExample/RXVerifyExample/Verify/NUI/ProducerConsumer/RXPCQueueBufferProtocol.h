//
//  RXPCQueueBufferProtocol.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/7/4.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#ifndef RXPCQueueBufferProtocol_h
#define RXPCQueueBufferProtocol_h
#import <Foundation/Foundation.h>


@protocol RXPCQueueBufferProtocol <NSObject>
+ (id)defaultQueueBuffer;
- (id)initWithMaxLength:(NSInteger)length;
- (void)push:(id)data;
- (id)pop;
- (void)print;

@property (nonatomic, assign, readonly) NSInteger maxLength;

@property (nonatomic, readonly) BOOL empty;
@property (nonatomic, readonly) BOOL full;
@end

#endif /* RXPCQueueBufferProtocol_h */
