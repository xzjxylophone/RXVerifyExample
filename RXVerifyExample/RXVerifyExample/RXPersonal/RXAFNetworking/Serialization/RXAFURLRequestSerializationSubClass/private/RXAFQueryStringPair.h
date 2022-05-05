//
//  RXAFQueryStringPair.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/10.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>


// TODOAFN_M_3_K_2
@interface RXAFQueryStringPair : NSObject
@property (readwrite, nonatomic, strong) id field;
@property (readwrite, nonatomic, strong) id value;

- (instancetype)initWithField:(id)field value:(id)value;

- (NSString *)URLEncodedStringValue;
@end
