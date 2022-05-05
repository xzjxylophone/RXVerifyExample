//
//  RXStrangeView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXStrangeView.h"

@interface RXStrangeView ()

@property (nonatomic, assign) BOOL inOriginal;

@end

@implementation RXStrangeView
- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        UITapGestureRecognizer *tgr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewAction)];
        [self addGestureRecognizer:tgr];
        self.inOriginal = YES;
        self.backgroundColor = [UIColor redColor];
    }
    return self;
}
- (void)viewAction {
    if (self.inOriginal) {
        self.pushNext();
        self.inOriginal = NO;
    } else {
        self.inOriginal = YES;
        self.popPre();
    }
}

@end
