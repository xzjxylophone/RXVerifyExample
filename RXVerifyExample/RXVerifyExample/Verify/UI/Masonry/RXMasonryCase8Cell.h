//
//  RXMasonryCase8Cell.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/25.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RXMasonryCase8Entity.h"

NS_ASSUME_NONNULL_BEGIN
@class RXMasonryCase8Cell;

@protocol RXMasonryCase8CellDelegate <NSObject>
- (void)case8Cell:(RXMasonryCase8Cell *)cell switchExpandedStateWithIndexPath:(NSIndexPath *)index;
@end


@interface RXMasonryCase8Cell : UITableViewCell

@property (weak, nonatomic) id <RXMasonryCase8CellDelegate> delegate;

- (void)setEntity:(RXMasonryCase8Entity *)entity indexPath:(NSIndexPath *)indexPath;
@end

NS_ASSUME_NONNULL_END
