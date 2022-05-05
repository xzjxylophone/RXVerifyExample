//
//  RXAFPropertyListRequestSerializer.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/9.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFURLRequestSerialization.h"
#import "RXAFHTTPRequestSerializer.h"

// TODOAFN_M_3_K_6
@interface RXAFPropertyListRequestSerializer : RXAFHTTPRequestSerializer

/**
 The property list format. Possible values are described in "NSPropertyListFormat".
 */
@property (nonatomic, assign) NSPropertyListFormat format;

/**
 @warning The `writeOptions` property is currently unused.
 */
@property (nonatomic, assign) NSPropertyListWriteOptions writeOptions;

/**
 Creates and returns a property list serializer with a specified format, read options, and write options.
 
 @param format The property list format.
 @param writeOptions The property list write options.
 
 @warning The `writeOptions` property is currently unused.
 */
+ (instancetype)serializerWithFormat:(NSPropertyListFormat)format
                        writeOptions:(NSPropertyListWriteOptions)writeOptions;

@end
