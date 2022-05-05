//
//  RXImageCell.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/6/20.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXImageCell.h"

@implementation RXImageCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        CGFloat cellHeight = [RXImageCell cellHeight];
        CGFloat width = RX_Window_Width;
        CGFloat imageWidth = 250;
        CGFloat imageX = (width - imageWidth) / 2.0f;
        CGFloat imageY = (cellHeight - imageWidth) / 2.0f;
        self.demoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(imageX, imageY, imageWidth, imageWidth)];
        [self.contentView addSubview:self.demoImageView];
    }
    return self;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+ (CGFloat)cellHeight
{
    return 300;
}

@end
