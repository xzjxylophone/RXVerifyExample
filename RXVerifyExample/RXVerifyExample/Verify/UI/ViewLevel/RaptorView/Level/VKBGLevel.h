//
//  VKBGLevel.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/6.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKBaseLevel.h"

NS_ASSUME_NONNULL_BEGIN

@class VKBGLevel;
@protocol VKBGLevelDelegate <NSObject>
- (void)doSomethingInBgLevel:(VKBGLevel *)bgLevel;
@end

@interface VKBGLevel : VKBaseLevel


@property (nonatomic, weak) id<VKBGLevelDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
