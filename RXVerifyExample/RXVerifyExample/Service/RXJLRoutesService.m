//
//  RXJLRoutesService.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/9/12.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXJLRoutesService.h"
#import "JLRoutes.h"

@implementation RXJLRoutesService
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    JLRoutes *routes = [JLRoutes globalRoutes];
    [routes addRoute:@"/user/view/:userID" handler:^BOOL(NSDictionary<NSString *,id> * _Nonnull parameters) {
        NSString *userID = parameters[@"userID"];
        NSLog(@"userID:%@", userID);
        return YES;
    }];
    NSLog(@"initialization RXJLRoutesService");
    return YES;
}
@end
