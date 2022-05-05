//
//  KSAdCountdownView.m
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/8/12.
//

#import "KSAdCountdownView.h"
#import "KSAdDefine.h"
@interface KSAdCountdownView ()

// 多长时间后可以关闭，单位秒， default=5
@property (nonatomic, assign, readwrite) NSInteger timeInterval;
@property (nonatomic, assign) CGRect beforeFrame;
@property (nonatomic, assign) CGRect afterFrame;

@property (nonatomic, assign) NSInteger remainTime;

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITapGestureRecognizer *tapGestureRecognizer;

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation KSAdCountdownView
#pragma mark - Class Method

+ (instancetype)defaultView {
    return [self defaultViewWithTimeInterval:5];
}
+ (instancetype)defaultViewWithTimeInterval:(NSInteger)timeInterval {
    KSAdCountdownView *result = [[KSAdCountdownView alloc] initWithFrame:CGRectZero timeInterval:timeInterval];
    return result;
}

#pragma mark - Constructor And Desctructor
- (id)initWithFrame:(CGRect)frame timeInterval:(NSInteger)timeInterval {
    if (self = [super initWithFrame:frame]) {
        CGFloat width = KSAd_ScreenWidth;
        CGFloat y = 12;
        CGFloat beforeWidth = 101;
        CGFloat height = 34;
        CGFloat afterWidth = height;
        CGFloat xOffset = 12;
        CGFloat beforeX = width - beforeWidth - xOffset;
        CGFloat afterX = width - afterWidth - xOffset;
        self.beforeFrame = CGRectMake(beforeX, y, beforeWidth, height);
        self.afterFrame = CGRectMake(afterX, y, afterWidth, height);
        self.timeInterval = timeInterval;
        
        self.label = [[UILabel alloc] init];
        self.label.textAlignment = NSTextAlignmentCenter;
        self.label.textColor = [UIColor whiteColor];
        self.label.font = [UIFont systemFontOfSize:15];
        
        self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewAction:)];
        [self addGestureRecognizer:self.tapGestureRecognizer];
        
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.3];
        self.layer.cornerRadius = height / 2.0f;
        self.layer.masksToBounds = YES;
        [self addSubview:self.label];
    }
    return self;
}
#pragma mark - Public
- (void)start {
    self.remainTime = self.timeInterval;
};

#pragma mark - Proverty
- (void)setRemainTime:(NSInteger)remainTime {
    _remainTime = MAX(remainTime, 0);
    if (_remainTime > 0) {
        self.frame = self.beforeFrame;
        NSString *text = [NSString stringWithFormat:@"%zds后可关闭", _remainTime];
        self.label.text = text;
        self.userInteractionEnabled = NO;
        [self startTimer];
    } else {
        self.frame = self.afterFrame;
        self.label.text = @"X";
        self.userInteractionEnabled = YES;
        [self endTimer];
    }
    self.label.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
}

#pragma mark - Timer
- (void)startTimer {
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:NO];
    }
}
- (void)endTimer {
    [self.timer invalidate];
    self.timer = nil;
}
- (void)timerAction {
    [self endTimer];
    self.remainTime = self.remainTime - 1;
}

#pragma mark - Action
- (void)viewAction:(id)sender {
    if (self.clickCloseBlock) {
        self.clickCloseBlock();
    }
}

@end
