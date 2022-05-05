//
//  NSString+OnlineClass.h
//  onlineclass-base-kit
//
//  Created by vipkid_03 on 2019/6/4.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

#define isBlankString(str) [NSString isBlankString:(str)]

@interface NSString(OnlineClass)
+ (BOOL)isValidPhoneNumber:(NSString*)string;
+ (BOOL)isEmpty:(NSString*)string;
    //字符串是否为空串或者只有空格
+(BOOL)isBlankString:(NSString*)str;
    
+ (BOOL)checkString:(id)string;
    
@end

@interface NSString(VK_MD5)
/**
 *  给字符串进行MD5加密
 *
 *  @return 返回一个MD5加密的字符串
 */
- (NSString *)vkMD5String;
    
@end


@interface NSString (VKURLCode)
    
- (NSString *)vkURLEncodedString;
    
- (NSString *)vkURLDecodedString;
@end


@interface NSString (VKRSACipher)
    
//- (NSString *)RSAEnencryptString;

@end


@interface NSString (Trims)
    
- (NSString *)stringByTrimmingWhitespace;
- (NSString *)stringByTrimmingWhitespaceAndNewlines;
- (NSString *)stringByTrimingAllWhitespace;
    
@end

NS_ASSUME_NONNULL_END
