//
//  RXViewHolderCell.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/11.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RXViewHolderBaseCell.h"

NS_ASSUME_NONNULL_BEGIN

@interface RXViewHolderCell : RXViewHolderBaseCell


@property (nonatomic, strong) UIView *gradientView;
@property (nonatomic, strong) CAGradientLayer *gradientLayer;


- (void)refreshViewWithIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
