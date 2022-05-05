//
//  RXRouteResponse.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXRouteResponse.h"

@interface RXRouteResponse()

@end

@implementation RXRouteResponse

- (id)initWithRouteDefinition:(RXRouteDefinition *)routeDefinition block:(id)block {
    if (self = [super init]) {
        self.routeDefinition = routeDefinition;
        self.block = block;
    }
    return self;
}
@end
