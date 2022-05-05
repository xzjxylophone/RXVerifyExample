//
//  RXMasonryCase13Cell.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/26.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase13Cell.h"
#import <Masonry/Masonry.h>

@interface RXMasonryCase13Cell()
@property (nonatomic, strong) UILabel *label1;
@property (nonatomic, strong) UILabel *label2;
@property (nonatomic, strong) UILabel *label3;

@end

@implementation RXMasonryCase13Cell


#pragma mark - Init

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self commonInit];
    }
    return self;
}

- (void)commonInit {
    _label1 = [self newLabel];
    _label2 = [self newLabel];
    _label3 = [self newLabel];
    
    [self.contentView addSubview:_label1];
    [self.contentView addSubview:_label2];
    [self.contentView addSubview:_label3];
    
    [_label1 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@80);
        make.top.equalTo(self.contentView.mas_top);
        make.left.equalTo(self.contentView.mas_left);
        make.bottom.lessThanOrEqualTo(self.contentView.mas_bottom);
    }];
    
    [_label2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@80);
        make.top.equalTo(self.contentView.mas_top);
        make.centerX.equalTo(self.contentView.mas_centerX);
        make.bottom.lessThanOrEqualTo(self.contentView.mas_bottom);
    }];
    
    [_label3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@80);
        make.top.equalTo(self.contentView.mas_top);
        make.right.equalTo(self.contentView.mas_right);
        make.bottom.lessThanOrEqualTo(self.contentView.mas_bottom);
    }];
}

#pragma mark - Public

- (void)configWithTexts:(NSArray<NSString *> *)cellTexts {
    // Check
    assert(cellTexts.count == 3);
    
    _label1.text = cellTexts[0];
    _label2.text = cellTexts[1];
    _label3.text = cellTexts[2];
}

#pragma mark - Private

- (UILabel *)newLabel {
    UILabel *label = [UILabel new];
    
    label.textColor = [UIColor grayColor];
    label.font = [UIFont systemFontOfSize:14];
    label.layer.masksToBounds = YES;
    label.layer.borderWidth = 0.5f;
    label.layer.borderColor = [UIColor brownColor].CGColor;
    label.numberOfLines = 0;
    
    return label;
}


@end
