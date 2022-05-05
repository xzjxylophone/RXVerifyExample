//
//  VKDownloadDefine.m
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/6/14.
//

#import "VKDownloadDefine.h"

// 获取错误信息
NSError *PVK_errorWithCode(VKDownloadErrorType code) {
    return PVK_errorWithCodeAndMsg(code, @"");
}

NSError *PVK_errorWithCodeAndMsg(VKDownloadErrorType code, NSString *msg) {
    NSDictionary *dic = @{
                          @(VKDownloadErrorType_URLIsNull): @"URL下载地址为空",
                          @(VKDownloadErrorType_URLIsWrong): @"无法下载资源"
                          };
    id value = dic[@(code)];
    NSString *message = value ? value : @"未知的错误码";
    if (msg.length != 0) {
        message = [NSString stringWithFormat:@"%@:%@", message, msg];
    }
    NSDictionary *userInfo = @{NSLocalizedDescriptionKey: message};
    return [NSError errorWithDomain:@"www.vipkid.com.cn.vkdownload" code:code userInfo:userInfo];
}
