//
//  RXViewHolderBaseCell.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/16.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RXViewHolderBaseCell : UITableViewCell

@property (nonatomic, strong) UIView *parentView;
@property (nonatomic, strong) UIImageView *bgImageView;
@property (nonatomic, strong) UILabel *desLabel;

- (void)refreshViewWithIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
