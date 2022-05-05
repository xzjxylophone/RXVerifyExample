//
//  RXARCCallObject.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/15.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXARCRequestObject.h"
@interface RXARCCallObject : NSObject <RXARCRequestObjectDelegate>


@property (nonatomic, strong) RXARCRequestObject *requestObject;
- (void)test;
- (void)test2;
@end
