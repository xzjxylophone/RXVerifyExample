//
//  RXViewHolderBaseCell.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/16.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXViewHolderBaseCell.h"

@implementation RXViewHolderBaseCell


- (void)refreshViewWithIndex:(NSInteger)index {
    // Do Nothing
}

#pragma mark - UI Getter
- (UIView *)parentView {
    if (!_parentView) {
        _parentView = [UIView new];
    }
    return _parentView;
}
- (UIImageView *)bgImageView {
    if (!_bgImageView) {
        _bgImageView = [UIImageView new];
    }
    return _bgImageView;
}
- (UILabel *)desLabel {
    if (!_desLabel) {
        _desLabel = [UILabel new];
        _desLabel.textColor = [UIColor whiteColor];
        _desLabel.numberOfLines = 1;
        _desLabel.font = [UIFont systemFontOfSize:14];
    }
    return _desLabel;
}
@end
