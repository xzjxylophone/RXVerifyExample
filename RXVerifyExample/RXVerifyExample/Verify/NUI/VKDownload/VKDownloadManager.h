//
//  VKDownloadManager.h
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/6/14.
//

#import <Foundation/Foundation.h>
#import "VKDownloadDefine.h"
NS_ASSUME_NONNULL_BEGIN


@interface VKDownloadManager : NSObject

/*
 下载资源
 @param url 资源URL
 @param completionBlock 完成回调
 @return 任务Operation, 如果URL为空或者已经有缓存,那么这个是nil
 */
- (NSOperation *)downloadWithURL:(nullable NSURL *)url completionBlock:(nullable VKDownloadCompletionBlock)completionBlock;

/*
 下载资源
 @param url 资源URL
 @param progressBlock   进度回调
 @param completionBlock 完成回调
 @return 任务Operation, 如果URL为空或者已经有缓存,那么这个是nil
 */
- (NSOperation *)downloadWithURL:(nullable NSURL *)url progressBlock:(nullable VKDownloadProgressBlock)progressBlock completionBlock:(nullable VKDownloadCompletionBlock)completionBlock;
/*
 下载资源
 @param hostArray 支持的域名数组
 @param relativePath 相对路径,前面不要有  /
 @param progressBlock   进度回调
 @param completionBlock 完成回调
 @return 任务Operation, 如果URL为空或者已经有缓存,那么这个是nil
 */
- (NSOperation *)downloadWithHostArray:(nullable NSArray *)hostArray relativePath:(NSString *)relativePath progressBlock:(nullable VKDownloadProgressBlock)progressBlock completionBlock:(nullable VKDownloadCompletionBlock)completionBlock;
/*
 下载资源
 @param path 路径,会自动判断http,如果没有会添加http
 @param progressBlock   进度回调
 @param completionBlock 完成回调
 @return 任务Operation, 如果URL为空或者已经有缓存,那么这个是nil
 */
- (NSOperation *)downloadWithPath:(NSString *)path progressBlock:(nullable VKDownloadProgressBlock)progressBlock completionBlock:(nullable VKDownloadCompletionBlock)completionBlock;
/*
 下载资源
 @param urlArray 同一份资源的不同的下载地址
 @param progressBlock   进度回调
 @param completionBlock 完成回调
 @return 任务Operation, 如果URL为空或者已经有缓存,那么这个是nil
 */
- (NSOperation *)downloadWithURLArray:(nullable NSArray *)urlArray progressBlock:(nullable VKDownloadProgressBlock)progressBlock completionBlock:(nullable VKDownloadCompletionBlock)completionBlock;

/*
 取消所有的下载
 */
- (void)cancelAll;

/*
 单例
 */
+ (instancetype)sharedInstance;
@end

NS_ASSUME_NONNULL_END

