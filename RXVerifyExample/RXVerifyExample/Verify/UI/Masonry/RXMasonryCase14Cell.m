//
//  RXMasonryCase14Cell.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/26.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase14Cell.h"
#import <Masonry/Masonry.h>

@implementation RXMasonryCase14Cell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.clipsToBounds = YES;
        
        _stairView = [RXMasonryCase14StairView new];
        _stairView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.1];
        [self.contentView addSubview:_stairView];
        
        [_stairView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self.contentView).insets(UIEdgeInsetsMake(4, 4, 4, 4));
        }];
    }
    return self;
}

@end
