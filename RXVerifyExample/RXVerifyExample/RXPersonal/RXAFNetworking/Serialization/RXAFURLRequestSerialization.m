//
//  RXAFURLRequestSerialization.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/1.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFURLRequestSerialization.h"
#import "RXAFURLRequestSerializationDefine.h"
#import "RXAFQueryStringPair.h"
NSString * const RXAFURLRequestSerializationErrorDomain = @"com.alamofire.error.serialization.request";
NSString * const RXAFNetworkingOperationFailingURLRequestErrorKey = @"com.alamofire.serialization.request.error.response";


NSUInteger const kRXAFUploadStream3GSuggestedPacketSize = 1024 * 16;
NSTimeInterval const kRXAFUploadStream3GSuggestedDelay = 0.2;


NSString * RXAFQueryStringFromParameters(NSDictionary *parameters) {
    NSMutableArray *mutablePairs = [NSMutableArray array];
    for (RXAFQueryStringPair *pair in RXAFQueryStringPairsFromDictionary(parameters)) {
        [mutablePairs addObject:[pair URLEncodedStringValue]];
    }
    
    return [mutablePairs componentsJoinedByString:@"&"];
}

NSArray * RXAFQueryStringPairsFromDictionary(NSDictionary *dictionary) {
    return RXAFQueryStringPairsFromKeyAndValue(nil, dictionary);
}


