//
//  RXAutoGenerateManager.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/9.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXAutoGenerateManager.h"

@implementation RXAutoGenerateManager

+ (void)generate {
    [self test];
    NSURL *fileURL = [[NSBundle mainBundle] URLForResource:@"auto_content" withExtension:nil];
    NSString *content = [NSString stringWithContentsOfURL:fileURL encoding:NSUTF8StringEncoding error:nil];
    NSArray *strAry = [content componentsSeparatedByString:@"\n"];
    NSMutableString *mutStr = [NSMutableString new];
    [mutStr appendString:@"\n#pragma mark - UI Getter\n"];
    for (NSString *str in strAry) {
        if ([str hasPrefix:@"@property"]) {
            NSString *value = [self autoCodeFromPropertyString:str];
            [mutStr appendString:value];
        }
    }
    NSLog(@"%@", mutStr);
}

+ (NSString *)autoCodeFromPropertyString:(NSString *)propertyString {
    NSArray <NSString *>*ary = [propertyString componentsSeparatedByString:@" "];
    if (ary.count < 2) {
        return @"";
    }
    // 去掉 * 号
    NSString *propertyName = [ary.lastObject substringFromIndex:1];
    // 去掉 ; 号
    propertyName = [propertyName substringToIndex:propertyName.length - 1];
    NSString *typeName = ary[ary.count - 2];
    NSMutableString *mutStr = [NSMutableString new];
    
    [mutStr appendFormat:@"- (%@ *)%@ {\n", typeName, propertyName];
    [mutStr appendFormat:@"    if (!_%@) {\n", propertyName];
    [mutStr appendFormat:@"        _%@ = [%@ new];\n", propertyName, typeName];
    [mutStr appendFormat:@"    }\n"];
    [mutStr appendFormat:@"    return _%@;\n", propertyName];
    [mutStr appendFormat:@"}\n\n"];
    return mutStr;
}


+ (void)test {
    NSString *originValue = @"01.4,a,3";
    NSArray *array = [originValue componentsSeparatedByString:@","];
    NSMutableArray *mutAry = [NSMutableArray new];
    for (NSString *tmp in array) {
        NSScanner *scan = [NSScanner scannerWithString:tmp];
        int val;
        if ([scan scanInt:&val] && [scan isAtEnd]) {
            [mutAry addObject:@(val)];
        }
    }
    NSLog(@"mutAry:%@", mutAry);
}
@end
