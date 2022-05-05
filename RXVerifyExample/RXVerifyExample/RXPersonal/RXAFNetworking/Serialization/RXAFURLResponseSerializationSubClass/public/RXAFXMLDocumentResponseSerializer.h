//
//  RXAFXMLDocumentResponseSerializer.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/15.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFHTTPResponseSerializer.h"
#ifdef __MAC_OS_X_VERSION_MIN_REQUIRED
@interface RXAFXMLDocumentResponseSerializer : RXAFHTTPResponseSerializer

- (instancetype)init;

/**
 Input and output options specifically intended for `NSXMLDocument` objects. For possible values, see the `NSXMLDocument` documentation section "Input and Output Options". `0` by default.
 */
@property (nonatomic, assign) NSUInteger options;

/**
 Creates and returns an XML document serializer with the specified options.
 
 @param mask The XML document options.
 */
+ (instancetype)serializerWithXMLDocumentOptions:(NSUInteger)mask;

@end

#endif
