//
//  VKRaptorView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/6.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKRaptorView.h"

#import "VKBGLevel.h"
#import "VKNormalLevel.h"
#import "VKGuideLevel.h"
#import "VKAnimationLevel.h"
#import "VKVideoLevel.h"


#import "VKBgLevelView.h"
#import "VKNormalLevelView.h"

@interface VKRaptorView() <VKNormalLevelDelegate>
@property (nonatomic, strong) VKBGLevel *bgLevel;
@property (nonatomic, strong) VKVideoLevel *videoLevel;
@property (nonatomic, strong) VKNormalLevel *normalLevel;
@property (nonatomic, strong) VKGuideLevel *guideLevel;
@property (nonatomic, strong) VKAnimationLevel *animationLevel;

@property (nonatomic, strong) VKBgLevelView *bgLevelView;
@property (nonatomic, strong) VKNormalLevelView *normalLevelView;


@end

@implementation VKRaptorView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
//        self.bgLevel = [[VKBGLevel alloc] initWithSuperview:self];
//        self.videoLevel = [[VKVideoLevel alloc] initWithSuperview:self];
//        self.normalLevel = [[VKNormalLevel alloc] initWithSuperview:self];
//        self.normalLevel.delegate = self;
//        self.animationLevel = [[VKAnimationLevel alloc] initWithSuperview:self];
//        self.guideLevel = [[VKGuideLevel alloc] initWithSuperview:self];
        
        self.bgLevelView = [[VKBgLevelView alloc] initWithSuperview:self];
        self.normalLevelView = [[VKNormalLevelView alloc] initWithSuperview:self];
    }
    return self;
}

#pragma mark - VKNormalLevelDelegate
- (void)helpActionInNormalLevel:(VKNormalLevel *)bgLevel {
    [self.guideLevel showHelp];
}
@end
