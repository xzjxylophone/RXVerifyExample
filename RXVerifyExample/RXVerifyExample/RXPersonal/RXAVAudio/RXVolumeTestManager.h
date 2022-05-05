//
//  RXVolumeTestManager.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/4/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RXVolumeTestManager : NSObject

@property (nonatomic, readonly) float appVolume;
@property (nonatomic, readonly) float systemVolume;

+ (instancetype)sharedInstance;
- (void)play;
- (void)stopPlay;

- (void)printInfo;

- (void)changeSystemVolume:(float)volume;
- (void)changeAppVolume:(float)volume;
@end

NS_ASSUME_NONNULL_END
