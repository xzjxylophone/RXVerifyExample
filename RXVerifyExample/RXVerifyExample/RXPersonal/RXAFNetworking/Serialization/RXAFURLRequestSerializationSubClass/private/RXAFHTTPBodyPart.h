//
//  RXAFHTTPBodyPart.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/11.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

// TODOAFN_M_3_K_10
typedef enum {
    RXAFEncapsulationBoundaryPhase = 1,
    RXAFHeaderPhase                = 2,
    RXAFBodyPhase                  = 3,
    RXAFFinalBoundaryPhase         = 4,
} RXAFHTTPBodyPartReadPhase;



@interface RXAFHTTPBodyPart : NSObject
@property (nonatomic, assign) NSStringEncoding stringEncoding;
@property (nonatomic, strong) NSDictionary *headers;
@property (nonatomic, copy) NSString *boundary;
@property (nonatomic, strong) id body;
@property (nonatomic, assign) unsigned long long bodyContentLength;
@property (nonatomic, strong) NSInputStream *inputStream;

@property (nonatomic, assign) BOOL hasInitialBoundary;
@property (nonatomic, assign) BOOL hasFinalBoundary;

@property (readonly, nonatomic, assign, getter = hasBytesAvailable) BOOL bytesAvailable;
@property (readonly, nonatomic, assign) unsigned long long contentLength;

- (NSInteger)read:(uint8_t *)buffer
        maxLength:(NSUInteger)length;
@end
