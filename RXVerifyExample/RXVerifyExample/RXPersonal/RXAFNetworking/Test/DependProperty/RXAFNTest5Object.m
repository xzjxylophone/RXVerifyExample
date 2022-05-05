//
//  RXAFNTest5Object.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/11/14.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXAFNTest5Object.h"

@implementation RXAFNTest5Object
+ (NSSet *)keyPathsForValuesAffectingValueForKey:(NSString *)key
{
    if ([key isEqualToString:@"b"]) {
        return [NSSet setWithObjects:@"a", nil];
    }
    return [super keyPathsForValuesAffectingValueForKey:key];
}
@end
