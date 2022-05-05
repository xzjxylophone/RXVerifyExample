//
//  RXAFURLResponseSerialization.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/14.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN



///----------------
/// @name Constants
///----------------

/**
 ## Error Domains
 
 The following error domain is predefined.
 
 - `NSString * const AFURLResponseSerializationErrorDomain`
 
 ### Constants
 
 `AFURLResponseSerializationErrorDomain`
 AFURLResponseSerializer errors. Error codes for `AFURLResponseSerializationErrorDomain` correspond to codes in `NSURLErrorDomain`.
 */
FOUNDATION_EXPORT NSString * const RXAFURLResponseSerializationErrorDomain;

/**
 ## User info dictionary keys
 
 These keys may exist in the user info dictionary, in addition to those defined for NSError.
 
 - `NSString * const AFNetworkingOperationFailingURLResponseErrorKey`
 - `NSString * const AFNetworkingOperationFailingURLResponseDataErrorKey`
 
 ### Constants
 
 `AFNetworkingOperationFailingURLResponseErrorKey`
 The corresponding value is an `NSURLResponse` containing the response of the operation associated with an error. This key is only present in the `AFURLResponseSerializationErrorDomain`.
 
 `AFNetworkingOperationFailingURLResponseDataErrorKey`
 The corresponding value is an `NSData` containing the original data of the operation associated with an error. This key is only present in the `AFURLResponseSerializationErrorDomain`.
 */
FOUNDATION_EXPORT NSString * const RXAFNetworkingOperationFailingURLResponseErrorKey;

FOUNDATION_EXPORT NSString * const RXAFNetworkingOperationFailingURLResponseDataErrorKey;





/**
 The `AFURLResponseSerialization` protocol is adopted by an object that decodes data into a more useful object representation, according to details in the server response. Response serializers may additionally perform validation on the incoming response and data.
 
 For example, a JSON response serializer may check for an acceptable status code (`2XX` range) and content type (`application/json`), decoding a valid JSON response into an object.
 */

@protocol RXAFURLResponseSerialization <NSObject, NSSecureCoding, NSCopying>

/**
 The response object decoded from the data associated with a specified response.
 
 @param response The response to be processed.
 @param data The response data to be decoded.
 @param error The error that occurred while attempting to decode the response data.
 
 @return The object decoded from the specified response data.
 */
- (nullable id)responseObjectForResponse:(nullable NSURLResponse *)response
                                    data:(nullable NSData *)data
                                   error:(NSError * _Nullable __autoreleasing *)error NS_SWIFT_NOTHROW;

@end


NS_ASSUME_NONNULL_END
