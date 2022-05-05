//
//  RXAFStreamingMultipartFormData.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/11.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXAFMultipartFormData.h"

// TODOAFN_M_3_K_12
@interface RXAFStreamingMultipartFormData : NSObject<RXAFMultipartFormData>

- (instancetype)initWithURLRequest:(NSMutableURLRequest *)urlRequest stringEncoding:(NSStringEncoding)encoding;

- (NSMutableURLRequest *)requestByFinalizingMultipartFormData;
@end
