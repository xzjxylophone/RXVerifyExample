//
//  RXAVAudioTestManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/18.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXAVAudioTestManager.h"
#import "RBDMuteSwitchObject.h"
#import "AudioToolbox/AudioToolbox.h"
#import "RXVolumeTestManager.h"

// https://www.cnblogs.com/knrainy/articles/3435739.html
@interface RXAVAudioTestManager()
@property (nonatomic, strong) RBDMuteSwitchObject *muteSwitchObject;


@end
@implementation RXAVAudioTestManager
+ (instancetype)sharedInstance
{
    static RXAVAudioTestManager *sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
- (void)test {
//    [self test_mute];
    
//    [self test_isSilent];
    
}

- (void)test_mute {
    
    self.muteSwitchObject = [RBDMuteSwitchObject new];
    [self.muteSwitchObject test];
}

- (void)test_isSilent {
    NSLog(@"silent:%d", [self isSilentMode]);
}


// 以下方法不对
- (BOOL)isSilentMode {
    CFStringRef state;
    UInt32 propertySize = sizeof(CFStringRef);
    AudioSessionInitialize(NULL, NULL, NULL, NULL);
    AudioSessionGetProperty(kAudioSessionProperty_AudioRoute, &propertySize, &state);
    return CFStringGetLength(state) == 0;
}
@end
