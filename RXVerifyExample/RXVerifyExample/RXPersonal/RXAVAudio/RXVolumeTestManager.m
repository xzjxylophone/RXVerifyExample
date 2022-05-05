//
//  RXVolumeTestManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/4/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXVolumeTestManager.h"
#import <AVFoundation/AVFAudio.h>
#import <MediaPlayer/MediaPlayer.h>




@interface RXVolumeTestManager() <AVAudioPlayerDelegate>
@property (nonatomic, strong) AVAudioPlayer *audioPlayer;

@property (nonatomic, strong) MPVolumeView *volumeView;

@property (nonatomic, strong) UISlider *volumeSlider;

@end


@implementation RXVolumeTestManager


#pragma mark - Public Method
- (void)play {
    [self stopPlay];
    NSLog(@"play:");
    [self.audioPlayer prepareToPlay];
    [self.audioPlayer play];
}
- (void)stopPlay {
    if (self.audioPlayer && self.audioPlayer.isPlaying) {
        [self.audioPlayer stop];
    }
}

- (void)printInfo {
    
    float sliderVolume = self.volumeSlider.value;
    NSLog(@"systemVolume:%.5f, appVolume:%.5f, sliderVolume:%.5f", self.systemVolume, self.appVolume, sliderVolume);
}

- (void)changeSystemVolume:(float)volume {
    [self.volumeSlider setValue:volume animated:NO];
    [self.volumeSlider sendActionsForControlEvents:UIControlEventTouchUpInside];
}
- (void)changeAppVolume:(float)volume {
    self.audioPlayer.volume = volume;
}
#pragma mark - Readonly Property
- (float)systemVolume {
    AVAudioSession *session = [AVAudioSession sharedInstance];
    return session.outputVolume;
}
- (float)appVolume {
    return self.audioPlayer.volume;
}

#pragma mark - AVAudioPlayerDelegate
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"ok");
}


#pragma mark - Signal Instance
+ (instancetype)sharedInstance
{
    static RXVolumeTestManager *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
- (id)init {
    if (self = [super init]) {
        [self _setupAVAudioSession];
        [self _setupAVPlayer];
        [self _setupVolumeView];
        
    }
    return self;
}

#pragma mark - Private
- (void)_setupAVAudioSession {
//    AVAudioSession *session = [AVAudioSession sharedInstance];
//    AVAudioSessionCategory destCategory = AVAudioSessionCategoryPlayback;
//    if (@available(iOS 9, *)) {
//        NSArray *availableCategories = session.availableCategories;
//        NSLog(@"availableCategories:%@", availableCategories);
//        BOOL find = NO;
//        for (AVAudioSessionCategory category in availableCategories) {
//            if ([category isEqualToString:destCategory]) {
//                find = YES;
//                break;
//            }
//        }
//        if (!find) {
//            destCategory = AVAudioSessionCategorySoloAmbient;
//        }
//    }
//    NSError *error;
//    [session setCategory:destCategory error:&error];
//    if (error) {
//        NSLog(@"error:%@", error);
//    }
//    [session setActive:YES error:nil];
}
- (void)_setupAVPlayer {
    NSURL *soundUrl = [[NSBundle mainBundle] URLForResource:@"ok.mp3" withExtension:nil];
    //初始化播放器对象
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundUrl error:nil];
    self.audioPlayer.delegate = self;
    //设置循环次数，如果为负数，就是无限循环
    self.audioPlayer.numberOfLoops = 0;
    self.audioPlayer.currentTime = 0;
}
- (void)_setupVolumeView {
    self.volumeView = [[MPVolumeView alloc] init];
    for (UIView *view in self.volumeView.subviews) {
        if ([[view.class description] isEqualToString:@"MPVolumeSlider"]) {
            self.volumeSlider = (UISlider *)view;
            break;
        }
    }
}
@end
