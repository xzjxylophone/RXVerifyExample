//
//  NSString+OnlineClass.m
//  onlineclass-base-kit
//
//  Created by vipkid_03 on 2019/6/4.
//

#import "NSString+OnlineClass.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString(NSString_VK)
+ (BOOL)isValidPhoneNumber:(NSString*)string
{
    return ![NSString isEmpty:string] && [string isValidPhoneNumber];
}

+ (BOOL)isEmpty:(NSString *)string
{
    return string == nil || ![string isKindOfClass:[NSString class]] || string.length == 0;
}

- (BOOL)isValidPhoneNumber
{
    return self.length == 11 && [self longLongValue] > (1000ul*1000ul*1000ul*10ul) && [self characterAtIndex:0] == '1';
}

+ (BOOL)isBlankString:(NSString*)str
{
    if (str == nil || str == NULL
        || [str isKindOfClass:[NSNull class]]
        || [[str stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]] length]==0
        || [str isEqualToString:@"(null)"]
        || [str isEqualToString:@"<null>"]
        || [str isEqualToString:@"null"])
    {
        return YES;
    }
    
    return NO;
}

+ (BOOL)checkString:(id)string
{
    if (string && [string isKindOfClass:[NSString class]] && ![string isEqualToString:@""])
    {
        return YES;
    }
    return NO;
}

@end

@implementation NSString(VK_MD5)
/**
 *  给字符串进行MD5加密
 *
 *  @param newStr 需要加密的字符串
 *
 *  @return 返回一个MD5加密的字符串
 */
- (NSString *)vkMD5String
{
    const char *value = [self UTF8String];
    
    unsigned char outputBuffer[CC_MD5_DIGEST_LENGTH];
    CC_MD5(value, (CC_LONG)strlen(value), outputBuffer);
    
    NSMutableString *outputString = [[NSMutableString alloc] initWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    for(NSInteger count = 0; count < CC_MD5_DIGEST_LENGTH; count++){
        [outputString appendFormat:@"%02x",outputBuffer[count]];
    }
    
    return outputString;
}
@end

@implementation NSString (VKURLCode)

- (NSString *)vkURLEncodedString{
    if (!self || ![self isKindOfClass:[NSString class]]) {
        return @"";
    }
    NSString *encodePath = [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    return encodePath;
}

- (NSString *)vkURLDecodedString{
    if (!self || ![self isKindOfClass:[NSString class]]) {
        return @"";
    }
    NSMutableString *outputStr = [NSMutableString stringWithString:self];
    [outputStr replaceOccurrencesOfString:@"+"
                               withString:@" "
                                  options:NSLiteralSearch
                                    range:NSMakeRange(0, [outputStr length])];

    return [outputStr stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}

@end

@implementation NSString (VKRSACipher)

//- (NSString *)RSAEnencryptString{
//    NSString *publicKey = @"-----BEGIN PUBLIC KEY-----MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQDaJG/EixMUS5prtp5+x3vFrfjHNWzZT/EagAnKteZlKvVIqOHAUqfYOH4fxfubGTgtTWb92WE46vhD3XDLynbmKPA4QtiE4X0AQMsabZfJZt/nXA98QMsIhCbZSJuPge4Dvf44VZ2nrGbcxqYmUB14NnwtTqwykOE/g8QmHODFpQIDAQAB-----END PUBLIC KEY-----";
//    return [VKOnlineClassRSACipher encryptString:self publicKey:publicKey];
//}

@end

@implementation NSString (Trims)

- (NSString *)stringByTrimmingWhitespace
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
}

- (NSString *)stringByTrimmingWhitespaceAndNewlines
{
    return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSString *)stringByTrimingAllWhitespace
{
    return [self stringByReplacingOccurrencesOfString:@" " withString:@""];
}

@end
