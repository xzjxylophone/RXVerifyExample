//
//  VKDownloadDefine.h
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/6/14.
//

#import <Foundation/Foundation.h>



typedef NS_ENUM(NSInteger, VKDownloadCacheType) {
    VKDownloadCacheType_None,
    VKDownloadCacheType_Disk,
    VKDownloadCacheType_Network,
};
typedef NS_ENUM(NSInteger, VKDownloadErrorType) {
    VKDownloadErrorType_Success                 =           0,
    VKDownloadErrorType_URLIsNull               =           1,
    VKDownloadErrorType_URLIsWrong              =           2,
};


typedef void(^VKDownloadCompletionBlock)(NSURL * _Nullable localURL, NSError * _Nullable error, VKDownloadCacheType cacheType, NSURL * _Nullable downloadURL);

typedef void(^VKDownloadProgressBlock)(NSProgress * _Nonnull progress);

FOUNDATION_EXTERN NSError * _Nonnull PVK_errorWithCode(VKDownloadErrorType code);
FOUNDATION_EXTERN NSError * _Nonnull PVK_errorWithCodeAndMsg(VKDownloadErrorType code, NSString * _Nullable msg);

