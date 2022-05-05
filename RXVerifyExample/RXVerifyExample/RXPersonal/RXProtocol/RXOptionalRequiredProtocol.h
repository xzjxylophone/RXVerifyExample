//
//  RXOptionalRequiredProtocol.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/16.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#ifndef RXOptionalRequiredProtocol_h
#define RXOptionalRequiredProtocol_h

@protocol RXTestNoneProtocol <NSObject>
// 默认的是 required 的
- (void)testInNoneProtocol;
@end


@protocol RXTestOptionalProtocol <NSObject>
@optional
- (void)testInOptionalProtocol;
@end



@protocol RXTestRequiredProtocol <NSObject>
@required
- (void)testInRequiredProtocol;
@end



@protocol RXTestPropertyProtocol <NSObject>
@property (nonatomic, readonly) NSObject *propertyData;
@end

#endif /* RXOptionalRequiredProtocol_h */
