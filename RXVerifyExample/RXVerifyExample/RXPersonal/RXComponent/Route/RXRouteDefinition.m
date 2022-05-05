//
//  RXRouteDefinition.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXRouteDefinition.h"
@interface RXRouteDefinition()

@end
@implementation RXRouteDefinition
- (id)initWithRoute:(NSString *)route {
    if (self = [super init]) {
        NSString *uft8String = [route stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
        NSURL *url = [NSURL URLWithString:uft8String];
        self.scheme = url.scheme;
        self.host = url.host;
        self.redirect = NO;
        self.redirectUrl = @"";
    }
    return self;
}

- (BOOL)valid {
    return self.scheme.length > 0 && self.host.length > 0;
}
- (NSString *)key {
    return [NSString stringWithFormat:@"%@://%@", self.scheme, self.host];
}

- (BOOL)isEqual:(id)object {
    if (![object isKindOfClass:[RXRouteDefinition class]]) {
        return NO;
    }
    RXRouteDefinition *tmp = (RXRouteDefinition *)object;
    return [self.scheme isEqual:tmp.scheme] && [self.host isEqual:tmp.host] && self.redirectUrl == tmp.redirectUrl;
}
- (NSUInteger)hash {
    return [self.scheme hash] / 2 + [self.host hash] / 2;
}

+ (id)invalidDefinition {
    RXRouteDefinition *result = [RXRouteDefinition new];
    result.scheme = @"";
    result.host = @"";
    result.redirect = NO;
    return result;
}
extern NSString *kRXComponetRouteErrorRoute;
+ (id)defaultErrorDefinition {
    return [[RXRouteDefinition alloc] initWithRoute:kRXComponetRouteErrorRoute];
}
@end
