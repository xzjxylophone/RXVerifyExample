//
//  RXUrlDealObject.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/28.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXUrlDealObject.h"

@implementation RXUrlDealObject
- (void)test {
    [self test2];
    
}

// 支持如下url：
// http://xxxxx.xxxxx.com                                          http://xxxxx.xxxxx.com?sessionId=newSessionId
// http://xxxxx.xxxxx.com?key1=value1(一个或多个keyvalue)                              http://xxxxx.xxxxx.com?key1=value1(一个或多个keyvalue)&sessionId=newSessionId
// http://xxxxx.xxxxx.com?key1=value1(零个或多个keyvalue)&sessionId=oldSessionId       http://xxxxx.xxxxx.com?key1=value1(零个或多个keyvalue)&sessionId=newSessionId
// http://xxxxx.xxxxx.com?key1=value1(零个或多个keyvalue)&sessionId=oldSessionId&keyA=valueA(一个或多个keyvalue)       http://xxxxx.xxxxx.com?key1=value1(零个或多个keyvalue)&sessionId=newSessionId&keyA=valueA(一个或多个keyvalue)

- (void)test2 {
    NSString *sessionId = @"new_sessionId";
    NSString *key = @"sessionId";
    NSString *url1 = @"http://www.xxxxx.com";
    NSString *expectUrl1 = [NSString stringWithFormat:@"http://www.xxxxx.com?sessionId=%@", sessionId];
    NSString *res1 = [self getRealDocUrlWithUrl:url1 key:key value:sessionId];
    NSLog(@"expect1:%@, res1:%@", expectUrl1, res1);
    //    NSAssert([expectUrl1 isEqualToString:res1], @"测试不通过");
    
    
    NSString *url2 = @"http://www.xxxxx.com?key1=value1";
    NSString *expectUrl2 = [NSString stringWithFormat:@"http://www.xxxxx.com?key1=value1&sessionId=%@", sessionId];
    NSString *res2 = [self getRealDocUrlWithUrl:url2 key:key value:sessionId];
    NSLog(@"expect2:%@, res2:%@", expectUrl2, res2);
    //    NSAssert([expectUrl2 isEqualToString:res2], @"测试不通过");
    
    
    NSString *url3 = @"http://www.xxxxx.com?sessionId=old_sessionId";
    NSString *expectUrl3 = url3;
    NSString *res3 = [self getRealDocUrlWithUrl:url3 key:key value:sessionId];
    NSLog(@"expect3:%@, res3:%@", expectUrl3, res3);
    //    NSAssert([expectUrl3 isEqualToString:res3], @"测试不通过");
    
    
    NSString *url4 = @"http://www.xxxxx.com?key1=value1&sessionId=old_sessionId";
    NSString *expectUrl4 = url4;
    NSString *res4 = [self getRealDocUrlWithUrl:url4 key:key value:sessionId];
    NSLog(@"expect4:%@, res4:%@", expectUrl4, res4);
    //    NSAssert([expectUrl4 isEqualToString:res4], @"测试不通过");
    
    
    NSString *url5 = @"http://www.xxxxx.com?key1=value1&sessionId=old_sessionId&keyA=valueA";
    NSString *expectUrl5 = url5;
    NSString *res5 = [self getRealDocUrlWithUrl:url5 key:key value:sessionId];
    NSLog(@"expect5:%@, res5:%@", expectUrl5, res5);
    //    NSAssert([expectUrl5 isEqualToString:res5], @"测试不通过");
    
    NSLog(@"end test");
}
- (NSString *)getRealDocUrlWithUrl:(NSString *)url key:key value:(NSString *)value {
    if ([url containsString:key]) {
        return url;
    }
    NSString *result = @"";
    NSString *questionMark = @"?";
    NSString *andMark = @"&";
    BOOL haveQuestionMark = [url containsString:questionMark];
    if (haveQuestionMark) { // 有问号
        result = [NSString stringWithFormat:@"%@%@%@=%@", url, andMark, key, value];
    } else {
        result = [NSString stringWithFormat:@"%@%@%@=%@", url, questionMark, key, value];
    }
    return result;
}

- (void)test1 {
    NSString *sessionId = @"new_sessionId";
    
    NSString *url1 = @"http://www.xxxxx.com";
    NSString *expectUrl1 = [NSString stringWithFormat:@"http://www.xxxxx.com?sessionId=%@", sessionId];
    NSString *res1 = [self getRealDocUrlWithUrl:url1 sessionId:sessionId];
    NSLog(@"expect1:%@, res1:%@", expectUrl1, res1);
    //    NSAssert([expectUrl1 isEqualToString:res1], @"测试不通过");
    
    
    NSString *url2 = @"http://www.xxxxx.com?key1=value1";
    NSString *expectUrl2 = [NSString stringWithFormat:@"http://www.xxxxx.com?key1=value1&sessionId=%@", sessionId];
    NSString *res2 = [self getRealDocUrlWithUrl:url2 sessionId:sessionId];
    NSLog(@"expect2:%@, res2:%@", expectUrl2, res2);
    //    NSAssert([expectUrl2 isEqualToString:res2], @"测试不通过");
    
    
    NSString *url3 = @"http://www.xxxxx.com?sessionId=old_sessionId";
    NSString *expectUrl3 = [NSString stringWithFormat:@"http://www.xxxxx.com?sessionId=%@", sessionId];
    NSString *res3 = [self getRealDocUrlWithUrl:url3 sessionId:sessionId];
    NSLog(@"expect3:%@, res3:%@", expectUrl3, res3);
    //    NSAssert([expectUrl3 isEqualToString:res3], @"测试不通过");
    
    
    NSString *url4 = @"http://www.xxxxx.com?key1=value1&sessionId=old_sessionId";
    NSString *expectUrl4 = [NSString stringWithFormat:@"http://www.xxxxx.com?key1=value1&sessionId=%@", sessionId];
    NSString *res4 = [self getRealDocUrlWithUrl:url4 sessionId:sessionId];
    NSLog(@"expect4:%@, res4:%@", expectUrl4, res4);
    //    NSAssert([expectUrl4 isEqualToString:res4], @"测试不通过");
    
    
    NSString *url5 = @"http://www.xxxxx.com?key1=value1&sessionId=old_sessionId&keyA=valueA";
    NSString *expectUrl5 = [NSString stringWithFormat:@"http://www.xxxxx.com?key1=value1&sessionId=%@&keyA=valueA", sessionId];
    NSString *res5 = [self getRealDocUrlWithUrl:url5 sessionId:sessionId];
    NSLog(@"expect5:%@, res5:%@", expectUrl5, res5);
    //    NSAssert([expectUrl5 isEqualToString:res5], @"测试不通过");
    
    NSLog(@"end test");
}

- (NSString *)getRealDocUrlWithUrl:(NSString *)url sessionId:(NSString *)sessionId {
    NSString *result = @"";
    NSString *key = @"sessionId";
    NSString *questionMark = @"?";
    NSString *andMark = @"&";
    BOOL haveQuestionMark = [url containsString:questionMark];
    if (haveQuestionMark) { // 有问号
        NSRange keyRange = [url rangeOfString:key];
        if (keyRange.length > 0) { // 有 sessionId这个参数
            NSString *before = [url substringToIndex:keyRange.location];
            NSString *after = [url substringFromIndex:keyRange.location];
            NSRange andMarkRangeInAfter = [after rangeOfString:andMark];
            BOOL keyIsLastParam = andMarkRangeInAfter.length == 0; // 没有找到 & 那么就是最后一个参数
            if (keyIsLastParam) { // sessionId 是最后一个参数
                result = [NSString stringWithFormat:@"%@%@=%@", before, key, sessionId];
            } else {
                NSString *keyAfter = [after substringFromIndex:andMarkRangeInAfter.location];
                result = [NSString stringWithFormat:@"%@%@=%@%@", before, key, sessionId, keyAfter];
            }
        } else {
            result = [NSString stringWithFormat:@"%@%@%@=%@", url, andMark, key, sessionId];
        }
    } else {
        result = [NSString stringWithFormat:@"%@%@%@=%@", url, questionMark, key, sessionId];
    }
    return result;
}
@end
