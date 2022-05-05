//
//  RXStrangeXRPlayerView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/13.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXStrangeXRPlayerView.h"
#import <AVFoundation/AVFoundation.h>

@interface RXStrangeXRPlayerView()

@property (nonatomic, assign) CGFloat rate;
@property (nonatomic, strong) AVPlayer *queuePlayer;
//@property (nonatomic, strong) AVQueuePlayer *queuePlayer;
@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;


@property(nonatomic, copy) AVLayerVideoGravity videoGravity;
@end

@implementation RXStrangeXRPlayerView
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self _setup];
    }
    return self;
}

- (void)_setup {
    // 先设置rate为1.0
    self.rate = 1.0f;
    self.backgroundColor = [UIColor blackColor];
    
    
    
    // 此处为默认视频填充模式
    self.videoGravity = AVLayerVideoGravityResize;
    // 充满屏幕播放视频,但是部分被裁剪了
    self.videoGravity = AVLayerVideoGravityResizeAspectFill;
    // 有黑空白,上下有黑空白,或者左右有黑空白
    self.videoGravity = AVLayerVideoGravityResizeAspect;
}


#pragma mark - Public
// 设置播放URL
- (void)setURL:(NSURL *)URL {
    AVURLAsset *urlAsset = [AVURLAsset assetWithURL:URL];
    // 如果有正在播放的视频 先释放掉
    // 初始化playerItem
    AVPlayerItem *playerItem = [AVPlayerItem playerItemWithAsset:urlAsset];
    self.playerItem = playerItem;
    if (@available(iOS 10.0, *)) {
        self.playerItem.preferredForwardBufferDuration = 10.f;
    } else {
        // Fallback on earlier versions
    }
    self.queuePlayer = [AVPlayer playerWithPlayerItem:self.playerItem];
    if (@available(iOS 10.0, *)) {
        self.queuePlayer.automaticallyWaitsToMinimizeStalling = YES;
    }
    self.playerLayer = [AVPlayerLayer playerLayerWithPlayer:self.queuePlayer];
    self.playerLayer.videoGravity = self.videoGravity;
    // 添加playerLayer到self.layer
    [self.layer insertSublayer:self.playerLayer atIndex:0];
    [self setNeedsLayout];
    [self layoutIfNeeded];
}

- (void)play {
    self.queuePlayer.rate = self.rate ? : 1.0f;
}



#pragma mark - Override
- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.playerLayer) {
        self.playerLayer.frame = self.bounds;
    }
}

@end
