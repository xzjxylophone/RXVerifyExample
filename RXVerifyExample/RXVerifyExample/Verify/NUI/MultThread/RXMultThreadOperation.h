//
//  RXMultThreadOperation.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2020/9/4.
//  Copyright © 2020 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXMultThreadView.h"

NS_ASSUME_NONNULL_BEGIN

@interface RXMultThreadOperation : NSOperation
- (id)initWithMultThreadView:(RXMultThreadView *)multThreadView;
@end

NS_ASSUME_NONNULL_END
