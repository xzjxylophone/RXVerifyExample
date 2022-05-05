//
//  RXMasonryCase8Cell.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/25.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase8Cell.h"
#import <Masonry/Masonry.h>

@interface RXMasonryCase8Cell()

@property (strong, nonatomic) UILabel *titleLabel;
@property (strong, nonatomic) UILabel *contentLabel;
@property (strong, nonatomic) UIButton *moreButton;

@property (strong, nonatomic) MASConstraint *contentHeightConstraint;

@property (weak, nonatomic) RXMasonryCase8Entity *entity;
@property (strong, nonatomic) NSIndexPath *indexPath;
@end


@implementation RXMasonryCase8Cell


- (void)dealloc {
    [self removeObserver:self forKeyPath:@"frame"];
}

#pragma mark - Init

// 调用UITableView的dequeueReusableCellWithIdentifier方法时会通过这个方法初始化Cell
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initView];
    }
    return self;
}

#pragma mark - Public method

- (void)setEntity:(RXMasonryCase8Entity *)entity indexPath:(NSIndexPath *)indexPath {
    _entity = entity;
    _indexPath = indexPath;
    _titleLabel.text = [NSString stringWithFormat:@"index: %ld, contentView: %p", (long) indexPath.row, (__bridge void *) self.contentView];
    _contentLabel.text = entity.content;
    if (_entity.expanded) {
        [_contentHeightConstraint uninstall];
    } else {
        [_contentHeightConstraint install];
    }
}

#pragma mark - Actions

- (void)switchExpandedState:(UIButton *)button {
    [_delegate case8Cell:self switchExpandedStateWithIndexPath:_indexPath];
}

#pragma mark - Private method

- (void)initView {
    [self addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld context:nil];

    // Title
    _titleLabel = [UILabel new];
    [self.contentView addSubview:_titleLabel];

    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@21);
        make.left.and.right.and.top.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(4, 8, 4, 8));
    }];

    // More button
    _moreButton = [UIButton buttonWithType:UIButtonTypeSystem];
    [_moreButton setTitle:@"More" forState:UIControlStateNormal];
    [_moreButton addTarget:self action:@selector(switchExpandedState:) forControlEvents:UIControlEventTouchUpInside];
    [self.contentView addSubview:_moreButton];

    [_moreButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@32);
        make.left.and.right.and.bottom.equalTo(self.contentView);
    }];

    // Content
    // 计算UILabel的preferredMaxLayoutWidth值，多行时必须设置这个值，否则系统无法决定Label的宽度
    CGFloat preferredMaxWidth = [UIScreen mainScreen].bounds.size.width - 16;

    // Content - 多行
    _contentLabel = [UILabel new];
    _contentLabel.numberOfLines = 0;
    _contentLabel.lineBreakMode = NSLineBreakByCharWrapping;
    _contentLabel.clipsToBounds = YES;
    _contentLabel.preferredMaxLayoutWidth = preferredMaxWidth; // 多行时必须设置
    [self.contentView addSubview:_contentLabel];

    [_contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(4, 8, 4, 8));
        make.top.equalTo(_titleLabel.mas_bottom).with.offset(4);
        make.bottom.equalTo(_moreButton.mas_top).with.offset(-4);
        // 先加上高度的限制
        _contentHeightConstraint = make.height.equalTo(@64).with.priorityHigh(); // 优先级只设置成High,比正常的高度约束低一些,防止冲突
//        _contentHeightConstraint = make.height.equalTo(@64); // 优先级只设置成High,比正常的高度约束低一些,防止冲突
    }];
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *, id> *)change context:(void *)context {
    NSValue *frameValue = change[NSKeyValueChangeOldKey];
    CGFloat oldHeight = [frameValue CGRectValue].size.height;

    frameValue = change[NSKeyValueChangeNewKey];
    CGFloat newHeight = [frameValue CGRectValue].size.height;

    NSLog(@"contentView: %p, height change from: %g, to: %g.", (__bridge void *) self.contentView, oldHeight, newHeight);
}

@end
