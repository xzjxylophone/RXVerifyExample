//
//  RXRouteRequest.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXRouteDefinition.h"
@interface RXRouteRequest : NSObject

@property (nonatomic, copy) NSString *origin;
@property (nonatomic, strong) RXRouteDefinition *routeDefinition;

@property (nonatomic, readonly) NSDictionary *urlParams;

//@property (nonatomic, readonly) RXRouteDefinition *realRouteDefinition;


- (id)initWithRoute:(NSString *)route;

@end
