//
//  RXViewHolder1Cell.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/16.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXViewHolder1Cell.h"
#import <Masonry/Masonry.h>

@implementation RXViewHolder1Cell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.parentView];
        [self.parentView addSubview:self.bgImageView];
        [self.parentView addSubview:self.gradientView];
        
        [self.parentView addSubview:self.desLabel];
        
        [self.parentView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.equalTo(@0);
            make.bottom.equalTo(@-20);
        }];
        [self.bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.top.equalTo(@0);
        }];
        [self.gradientView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.bottom.equalTo(@0);
            make.height.equalTo(@40);
        }];

        [self.desLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(@20);
            make.right.equalTo(@-20);
            make.bottom.equalTo(@0);
            make.height.equalTo(@20);
        }];
    }
    return self;
}

- (void)refreshViewWithIndex:(NSInteger)index {
    [super refreshViewWithIndex:index];
    
    NSString *text = @"Cell1 是gradientView的同级view";
    
    
    self.desLabel.text = [NSString stringWithFormat:@"描述文案%zd，%@", (long)(index + 1), text];
    
}

@end
