//
//  RXAFXMLParserResponseSerializer.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/15.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFXMLParserResponseSerializer.h"
#import "RXAFURLResponseSerializationDefine.h"

@implementation RXAFXMLParserResponseSerializer

+ (instancetype)serializer {
    RXAFXMLParserResponseSerializer *serializer = [[self alloc] init];
    
    return serializer;
}

- (instancetype)init {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.acceptableContentTypes = [[NSSet alloc] initWithObjects:@"application/xml", @"text/xml", nil];
    
    return self;
}

#pragma mark - AFURLResponseSerialization

- (id)responseObjectForResponse:(NSHTTPURLResponse *)response
                           data:(NSData *)data
                          error:(NSError *__autoreleasing *)error
{
    if (![self validateResponse:(NSHTTPURLResponse *)response data:data error:error]) {
        if (!error || RXAFErrorOrUnderlyingErrorHasCodeInDomain(*error, NSURLErrorCannotDecodeContentData, RXAFURLResponseSerializationErrorDomain)) {
            return nil;
        }
    }
    
    return [[NSXMLParser alloc] initWithData:data];
}
@end
