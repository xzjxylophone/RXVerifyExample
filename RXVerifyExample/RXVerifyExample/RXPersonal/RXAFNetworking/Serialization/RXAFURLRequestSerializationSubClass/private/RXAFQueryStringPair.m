//
//  RXAFQueryStringPair.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/10.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFQueryStringPair.h"
#import "RXAFURLRequestSerializationDefine.h"
#import "RXAFURLRequestSerialization.h"
@implementation RXAFQueryStringPair

- (instancetype)initWithField:(id)field value:(id)value {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.field = field;
    self.value = value;
    
    return self;
}

- (NSString *)URLEncodedStringValue {
    if (!self.value || [self.value isEqual:[NSNull null]]) {
        return RXAFPercentEscapedStringFromString([self.field description]);
    } else {
        return [NSString stringWithFormat:@"%@=%@", RXAFPercentEscapedStringFromString([self.field description]), RXAFPercentEscapedStringFromString([self.value description])];
    }
}

@end
