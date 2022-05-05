//
//  VKNormalLevel.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/6.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKBaseLevel.h"

NS_ASSUME_NONNULL_BEGIN
@class VKNormalLevel;
@protocol VKNormalLevelDelegate <NSObject>
- (void)helpActionInNormalLevel:(VKNormalLevel *)bgLevel;
@end
@interface VKNormalLevel : VKBaseLevel
@property (nonatomic, weak) id<VKNormalLevelDelegate> delegate;
@end

NS_ASSUME_NONNULL_END
