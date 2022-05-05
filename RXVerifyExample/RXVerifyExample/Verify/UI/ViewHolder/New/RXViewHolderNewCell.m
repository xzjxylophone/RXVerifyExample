//
//  RXViewHolderNewCell.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/16.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXViewHolderNewCell.h"
#import <Masonry/Masonry.h>
#import <SDWebImage/UIImageView+WebCache.h>

@implementation RXViewHolderNewCell

- (void)refreshViewWithIndex:(NSInteger)index {
    [self.bgImageView sd_setImageWithURL:[NSURL URLWithString:@"https://static.yximgs.com/udata/pkg/c0f04f06a2020297ad56fb7fea4fb5f4"]];
}
#pragma mark - UI Getter
- (RXViewHolderGradientLayerView *)gradientView {
    if (!_gradientView) {
        _gradientView = [RXViewHolderGradientLayerView new];
    }
    return _gradientView;
}
@end
