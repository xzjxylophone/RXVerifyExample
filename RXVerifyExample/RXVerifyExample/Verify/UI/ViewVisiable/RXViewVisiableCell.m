//
//  RXViewVisiableCell.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/18.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXViewVisiableCell.h"
#import "UIView+RXVerify.h"
#import "NSTimer+RXVerify.h"

@interface RXViewVisiableCell ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) NSTimer *timer;
@end

@implementation RXViewVisiableCell
- (void)refreshViewWithIndex:(NSInteger)index {
    if (self.label == nil) {
        // cell height = 200
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100)];
        self.label.textColor = [UIColor whiteColor];
        self.label.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:self.label];
    }
    NSLog(@"refreshViewWithIndex self.hidden:%zd", (long)self.hidden);
    self.label.text = [NSString stringWithFormat:@"%zd", (long)index];
    if (index == 4) {
        [self startTimer];
    } else {
        [self endTimer];
    }
}
- (void)startTimer {
    if (self.timer == nil) {
        __weak typeof(self) weakSelf = self;
        self.timer = [NSTimer rxv_scheduleTimerWithTimeInterval:1.0 repeats:YES usingBlock:^(NSTimer * _Nonnull timer) {
            CGFloat percent = [weakSelf.label rxv_viewVisiable];
            NSLog(@"visiableCell index:%@ percent:%.3f self:%p self.label:%p self.hidden:%zd", weakSelf.label.text, percent, weakSelf, weakSelf.label, (long)weakSelf.hidden);
            if (weakSelf.hidden) {
                NSLog(@"timer find cell hidden, need to endTimer");
                [weakSelf endTimer];
            }
        }];
    }
}

- (void)endTimer {
    [self.timer invalidate];
    self.timer = nil;
}
- (void)printSomething {
    NSMutableArray *viewArray = [NSMutableArray new];
    UIView *pView = self;
    UITableView *tableView = nil;
    while (pView != nil) {
        if ([pView isKindOfClass:[UITableView class]]) {
            tableView  = (UITableView *)pView;
        }
        [viewArray addObject:pView];
        pView = pView.superview;
    }
    
    NSArray *subviewArray = tableView.subviews;
    
    NSLog(@"subviewArray:%@", subviewArray);
    NSLog(@"viewArray:%@", viewArray);
}


@end
