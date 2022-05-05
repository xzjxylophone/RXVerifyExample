//
//  RXOptionalRequiredProtocolObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/16.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXOptionalRequiredProtocolObject.h"
@interface RXOptionalRequiredProtocolObject()
@property (nonatomic, strong, readwrite) NSObject *propertyData;
@end
@implementation RXOptionalRequiredProtocolObject


#pragma mark - RXTestNoneProtocol
- (void)testInNoneProtocol {
    
}
#pragma mark - RXTestRequiredProtocol
- (void)testInRequiredProtocol {
    
}
@end
