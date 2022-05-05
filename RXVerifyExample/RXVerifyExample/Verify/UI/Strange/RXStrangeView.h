//
//  RXStrangeView.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RXStrangeView : UIView
@property (nonatomic, strong) dispatch_block_t pushNext;
@property (nonatomic, strong) dispatch_block_t popPre;
@end

NS_ASSUME_NONNULL_END
