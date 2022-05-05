//
//  RXMultThreadView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2020/9/4.
//  Copyright © 2020 Rush.D.Xzj. All rights reserved.
//

#import "RXMultThreadView.h"

static NSInteger s_renderIndex = 0;

@implementation RXMultThreadView

- (id)initWithFrame:(CGRect)frame {
    s_renderIndex ++;
    if (self = [super initWithFrame:frame]) {
        self.renderIndex = s_renderIndex;
    }
    return self;
}


- (void)render_really {
    [self safeLoadDelegate_multThreadViewWillRender:self];
    
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSInteger ms = arc4random() % 3000;
        [NSThread sleepForTimeInterval:ms / 1000.0f];
        dispatch_async(dispatch_get_main_queue(), ^{
            [self safeLoadDelegate_multThreadViewDidRender:self];
        });
        
    });
    
    
    
}


#pragma mark - Safe LoadDelegate
- (void)safeLoadDelegate_multThreadViewWillRender:(RXMultThreadView *)multThreadView {
    if ([self.loadDelegate respondsToSelector:@selector(multThreadViewWillRender:)]) {
        [self.loadDelegate multThreadViewWillRender:multThreadView];
    }
}
- (void)safeLoadDelegate_multThreadViewDidRender:(RXMultThreadView *)multThreadView {
    if ([self.loadDelegate respondsToSelector:@selector(multThreadViewDidRender:)]) {
        [self.loadDelegate multThreadViewDidRender:multThreadView];
    }
}
@end
