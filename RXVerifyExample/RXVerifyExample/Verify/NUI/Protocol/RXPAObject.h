//
//  RXPAObject.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/7/3.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol RXPA1Protocol <NSObject>

- (void)a1_doSomething;


@end
@protocol RXPA2Protocol <NSObject>

- (void)a2_doSomething;

@end
@protocol RXPA3Protocol <NSObject>

- (void)a3_doSomething;

@end

@interface RXPAObject : NSObject<RXPA1Protocol, RXPA2Protocol, RXPA3Protocol>

@end

NS_ASSUME_NONNULL_END
