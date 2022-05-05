//
//  VKNormalLevelView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/10.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "VKNormalLevelView.h"
#import <Masonry/Masonry.h>
#import "RXMacro.h"

@interface VKNormalLevelView()

@property (nonatomic, strong) UILabel *backLabel;
@end
@implementation VKNormalLevelView

- (id)initWithSuperview:(UIView *)superview {
    if (self = [super initWithSuperview:superview]) {
        self.backLabel = [UILabel new];
        self.backLabel.text = @"我是返回按钮";
        self.backLabel.textAlignment = NSTextAlignmentCenter;
        self.backLabel.backgroundColor = [UIColor redColor];
        [self.backLabel rx_addGestureRecognizerWithTarget:self action:@selector(backLabelAction:)];
        [self addSubview:self.backLabel];
        
        [self.backLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(superview).offset(64);
            make.left.equalTo(superview).offset(0);
            make.width.equalTo(@(300));
            make.height.equalTo(@(100));
        }];
        
        
    }
    return self;
}

- (void)backLabelAction:(id)sender {
    
//    RXWarningIgnore_Wdeprecated_declarations(
                                             {
        UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:@"backLabel" delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确认", nil];
        [av show];
    }

                                             
//                                             );
    
}

@end
