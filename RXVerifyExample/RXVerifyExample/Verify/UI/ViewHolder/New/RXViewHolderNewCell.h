//
//  RXViewHolderNewCell.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/16.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RXViewHolderBaseCell.h"
#import "RXViewHolderGradientLayerView.h"

NS_ASSUME_NONNULL_BEGIN

@interface RXViewHolderNewCell : RXViewHolderBaseCell

@property (nonatomic, strong) RXViewHolderGradientLayerView *gradientView;
- (void)refreshViewWithIndex:(NSInteger)index;
@end

NS_ASSUME_NONNULL_END
