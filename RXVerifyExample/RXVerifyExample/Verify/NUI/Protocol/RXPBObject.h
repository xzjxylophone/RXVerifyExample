//
//  RXPBObject.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/7/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RXPAObject.h"
NS_ASSUME_NONNULL_BEGIN
@protocol RXPB1Protocol <NSObject>

- (void)b1_doSomething_1;
- (void)b1_doSomething_2;

@end

@interface RXPBObject : RXPAObject <RXPB1Protocol>

@end

NS_ASSUME_NONNULL_END
