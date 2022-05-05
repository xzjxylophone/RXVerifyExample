//
//  RXRouteResponse.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXRouteDefinition.h"
@interface RXRouteResponse : NSObject
@property (nonatomic, strong) RXRouteDefinition *routeDefinition;


@property (nonatomic, copy) id block;

- (id)initWithRouteDefinition:(RXRouteDefinition *)routeDefinition block:(id)block;

@end
