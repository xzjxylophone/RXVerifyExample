//
//  RXRouteDefinition.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RXRouteDefinition : NSObject

@property (nonatomic, readonly) NSString *key;

@property (nonatomic, copy) NSString *scheme;
@property (nonatomic, copy) NSString *host;

@property (nonatomic, readonly) BOOL valid;

@property (nonatomic, assign) BOOL redirect;
@property (nonatomic, copy) NSString *redirectUrl;

- (id)initWithRoute:(NSString *)route;
+ (id)invalidDefinition;
+ (id)defaultErrorDefinition;
@end
