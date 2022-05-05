//
//  RBDMuteSwitch.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/18.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RBDMuteSwitch.h"
#include <AudioToolbox/AudioToolbox.h>

static RBDMuteSwitch *_sharedInstance;
@interface RBDMuteSwitch()
@property (nonatomic, assign) float soundDuration;
@property (nonatomic, strong) NSTimer *playbackTimer;

@end
@implementation RBDMuteSwitch

+ (RBDMuteSwitch *)sharedInstance
{
    if (!_sharedInstance) {
        _sharedInstance = [[[self class] alloc] init];
    }
    return _sharedInstance;
}

- (id)init
{
    self = [super init];
    if (self) {
    }
    
    return self;
}

- (void)playbackComplete {
    if ([self.delegate respondsToSelector:@selector(isMuted:)]) {
        // If playback is far less than 100ms then we know the device is muted
        if (self.soundDuration < 0.001) {
            [self.delegate isMuted:YES];
        }
        else {
            [self.delegate isMuted:NO];
        }
    }
    [self.playbackTimer invalidate];
    self.playbackTimer = nil;
    
    
}
#if !TARGET_IPHONE_SIMULATOR
static void soundCompletionCallback (SystemSoundID mySSID, void* myself) {
    AudioServicesRemoveSystemSoundCompletion (mySSID);
    [[RBDMuteSwitch sharedInstance] playbackComplete];
}
#endif
- (void)incrementTimer {
    self.soundDuration = self.soundDuration + 0.001;
}

- (void)detectMuteSwitch {
#if TARGET_IPHONE_SIMULATOR
    // The simulator doesn't support detection and can cause a crash so always return muted
    if ([self.delegate respondsToSelector:@selector(isMuted:)]) {
        [self.delegate isMuted:YES];
    }
#else
    // iOS 5+ doesn't allow mute switch detection using state length detection
    // So we need to play a blank 100ms file and detect the playback length
    self.soundDuration = 0.0;
    // Get the main bundle for the app
    CFBundleRef mainBundle = CFBundleGetMainBundle();
    // Get the URL to the sound file to play
    CFURLRef soundFileURLRef = CFBundleCopyResourceURL(mainBundle, CFSTR("detection"), CFSTR("aiff"), NULL);
    // Create a system sound object representing the sound file
    SystemSoundID soundFileObject;
    AudioServicesCreateSystemSoundID(soundFileURLRef, &soundFileObject);
    AudioServicesAddSystemSoundCompletion (soundFileObject, NULL, NULL, soundCompletionCallback, (void*)CFBridgingRetain(self));
    // Start the playback timer
    self.playbackTimer = [NSTimer scheduledTimerWithTimeInterval:0.010 target:self selector:@selector(incrementTimer) userInfo:nil repeats:YES];
    // Play the sound
    AudioServicesPlaySystemSound(soundFileObject);
#endif
}
@end
