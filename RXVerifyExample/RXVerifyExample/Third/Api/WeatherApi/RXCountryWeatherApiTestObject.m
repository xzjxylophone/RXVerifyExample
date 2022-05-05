//
//  RXCountryWeatherApiTestObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/1/1.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXCountryWeatherApiTestObject.h"
#import "RXCountryWeatherApi.h"
@implementation RXCountryWeatherApiTestObject
- (id)kkkkkkk {
    return [NSObject new];
}
- (void)test
{
    [RXCountryWeatherApi gettkkk];
    
    // 有警告
    [self performSelector:NSSelectorFromString(@"kkkkkkk") withObject:nil];
    
    // 没有警告
    [self performSelector:NSSelectorFromString(@"kkkkkkk") withObject:nil afterDelay:0];
}
@end
