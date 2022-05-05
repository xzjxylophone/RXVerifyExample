//
//  RXCountryWeatherApi.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/31.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXCountryWeatherApi.h"

@implementation RXCountryWeatherApi

+ (id)gettkkk {
    RXSimpleHttpManager *http = [RXSimpleHttpManager getActionWithBaseUrl:@"http://www.weather.com.cn" url:@"data/sk/101010100.html" parameters:nil completion:^(RXBaseResponse *response) {
        NSLog(@"111");
    }];
    return http;
}

@end
