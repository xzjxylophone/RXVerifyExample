//
//  RXRouteRequest.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXRouteRequest.h"
@interface RXRouteRequest()
@property (nonatomic, readwrite, strong) NSDictionary *urlParams;

@end
@implementation RXRouteRequest

- (id)initWithRoute:(NSString *)route {
    if (self = [super init]) {
        NSArray *ary = [route componentsSeparatedByString:@"?"];
        self.urlParams = [NSDictionary new];
        if (ary.count == 0) {
            self.routeDefinition = [RXRouteDefinition invalidDefinition];
        } else {
            self.routeDefinition = [[RXRouteDefinition alloc] initWithRoute:ary[0]];
            if (ary.count >= 2) {
                NSString *paramString = ary[1];
                NSArray *ary2 = [paramString componentsSeparatedByString:@"&"];
                NSMutableDictionary *dic = [NSMutableDictionary new];
                for (NSString *tmp in ary2) {
                    NSArray *ary3 = [tmp componentsSeparatedByString:@"="];
                    if (ary3.count == 2) {
                        NSString *key = ary3[0];
                        NSString *value = ary3[1];
                        if ([key isEqualToString:@"redirect"]) {
                            self.routeDefinition.redirectUrl = value;
                            self.routeDefinition.redirect = YES;
                        } else {
                            dic[key] = value;
                        }
                        
                    }
                }
                self.urlParams = dic;
            }
        }
    }
    return self;
}
//- (RXRouteDefinition *)realRouteDefinition {
//    if (self.routeDefinition.redirect) {
//        return [[RXRouteDefinition alloc] initWithRoute:self.routeDefinition.redirectUrl];
//    } else {
//        return self.routeDefinition;
//    }
//}

@end
