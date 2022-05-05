//
//  RXMasonryCase4Cell.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/25.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase4Cell.h"
#import <Masonry/Masonry.h>

@interface RXMasonryCase4Cell ()


@property (nonatomic, strong) UIImageView *avatarImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;

@property (nonatomic, weak) RXMasonryCase4Entity *dataEntity;

@end

@implementation RXMasonryCase4Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    // Avatar头像
    _avatarImageView = [UIImageView new];
    [self.contentView addSubview:_avatarImageView];
    [_avatarImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.and.height.equalTo(@44);
        make.left.and.top.equalTo(self.contentView).with.offset(4);
    }];

    // Title - 单行
    _titleLabel = [UILabel new];
    [self.contentView addSubview:_titleLabel];

    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@22);
        make.top.equalTo(self.contentView).with.offset(4);
        make.left.equalTo(_avatarImageView.mas_right).with.offset(4);
        make.right.equalTo(self.contentView).with.offset(-4);
    }];

    // 计算UILabel的preferredMaxLayoutWidth值，多行时必须设置这个值，否则系统无法决定Label的宽度
    CGFloat preferredMaxWidth = [UIScreen mainScreen].bounds.size.width - 44 - 4 * 3; // 44 = avatar宽度，4 * 3为padding

    // Content - 多行
    _contentLabel = [UILabel new];
    _contentLabel.backgroundColor = [UIColor greenColor];
    _contentLabel.numberOfLines = 0;
    // 当使用UITableViewAutomaticDimension 的时候，可以不用这个
    _contentLabel.preferredMaxLayoutWidth = preferredMaxWidth; // 多行时必须设置
    [self.contentView addSubview:_contentLabel];

    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_titleLabel.mas_bottom).with.offset(4);
        make.left.equalTo(_avatarImageView.mas_right).with.offset(4);
        make.right.equalTo(self.contentView).with.offset(-4);
        make.bottom.equalTo(self.contentView).with.offset(-4);
    }];

    [_contentLabel setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisVertical];
}
#pragma mark - Public methods

- (void)setupData:(RXMasonryCase4Entity *)dataEntity {
    _dataEntity = dataEntity;

    _avatarImageView.backgroundColor = [UIColor redColor];
    _titleLabel.text = dataEntity.title;
    _contentLabel.text = dataEntity.content;
}

@end
