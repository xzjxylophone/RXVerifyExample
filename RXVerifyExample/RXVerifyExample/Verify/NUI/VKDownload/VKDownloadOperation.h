//
//  VKDownloadOperation.h
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/6/14.
//

#import <Foundation/Foundation.h>
#import "VKDownloadDefine.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^VKDownloadOperationCompletionBlock)(NSURL * _Nullable localURL, NSError * _Nullable error, NSURL * _Nullable realURL, NSURL * _Nullable redirectURL);


@interface VKDownloadOperation : NSOperation

- (id)initWithURLArray:(NSArray *)urlArray destFullPath:(NSString *)destFullPath;


@property (assign, nonatomic, getter = isExecuting) BOOL executing;
@property (assign, nonatomic, getter = isFinished) BOOL finished;

// NSOperation 有一个 completionBlock
//@property (nonatomic, copy) VKDownloadCompletionBlock completionBlock;
@property (nonatomic, copy) VKDownloadOperationCompletionBlock vk_completionBlock;
@property (nonatomic, copy) VKDownloadProgressBlock vk_progressBlock;

@end

NS_ASSUME_NONNULL_END
