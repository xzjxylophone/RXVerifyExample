//
//  RXOptionalRequiredProtocolObject.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/16.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXOptionalRequiredProtocol.h"
NS_ASSUME_NONNULL_BEGIN

@interface RXOptionalRequiredProtocolObject : NSObject<RXTestNoneProtocol, RXTestOptionalProtocol, RXTestRequiredProtocol, RXTestPropertyProtocol>

@end

NS_ASSUME_NONNULL_END
