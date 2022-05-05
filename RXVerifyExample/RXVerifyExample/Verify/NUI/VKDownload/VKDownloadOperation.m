//
//  VKDownloadOperation.m
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/6/14.
//

#import "VKDownloadOperation.h"
#import "AFURLSessionManager.h"
@interface VKDownloadOperation()
@property (nonatomic, strong) NSURLSession *session;
@property (nonatomic, strong) NSURLSessionDownloadTask *task;
@property (nonatomic, strong) NSProgress *progress;


@property (nonatomic, strong) NSURLSession *session2;
@property (nonatomic, strong) NSURLSessionDownloadTask *task2;


// 所有可供下载的url地址
@property (nonatomic, copy) NSArray *urlArray;
// 当前正在尝试第几个
@property (nonatomic, assign) NSInteger currentIndex;
// 存储的目的文件
@property (nonatomic, copy) NSString *destFullPath;
@end

@implementation VKDownloadOperation

@synthesize executing = _executing;
@synthesize finished = _finished;


- (id)initWithURLArray:(NSArray *)urlArray destFullPath:(NSString *)destFullPath {
    if (self = [super init]) {
        self.urlArray = urlArray;
        self.progress = [[NSProgress alloc] initWithParent:nil userInfo:nil];
        self.progress.totalUnitCount = NSURLSessionTransferSizeUnknown;
        self.currentIndex = 0;
        self.destFullPath = destFullPath;
    }
    return self;
}

- (void)start {
//    self.session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:nil];
//    self.task = [self.session downloadTaskWithURL:self.url];
//    [self.task resume];
    [self startDownload];
}
    
- (void)startDownload {
    if (self.isCancelled) {
        self.finished = YES;
        self.executing = NO;
        return;
    }
    self.executing = YES;
    
    NSURL *url = self.urlArray[self.currentIndex];
    NSURLSessionConfiguration *configuration  =  [NSURLSessionConfiguration defaultSessionConfiguration];
    AFURLSessionManager *manager = [[AFURLSessionManager alloc]initWithSessionConfiguration:configuration];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    __weak typeof(self) weakSelf = self;
    self.task = [manager downloadTaskWithRequest:request progress:^(NSProgress * _Nonnull downloadProgress) {
        if (weakSelf.vk_progressBlock) {
            weakSelf.vk_progressBlock(downloadProgress);
        }
    } destination:^NSURL * _Nonnull(NSURL * _Nonnull targetPath, NSURLResponse * _Nonnull response) {
        if ([url.path hasPrefix:@"http://ic-static-ali.vipkid.com.cn"]) {
            NSLog(@"1111");
        }
        return [NSURL fileURLWithPath:weakSelf.destFullPath];
    } completionHandler:^(NSURLResponse * _Nonnull response, NSURL * _Nullable filePath, NSError * _Nullable error) {
        NSInteger nextIndex = weakSelf.currentIndex + 1;
        // 取下一个备用地址
        if (error && nextIndex < weakSelf.urlArray.count) {
            [[NSFileManager defaultManager] removeItemAtPath:weakSelf.destFullPath error:nil];
            weakSelf.currentIndex = nextIndex;
            [weakSelf startDownload];
        } else {
            if ([url.path hasPrefix:@"http://ic-static-ali.vipkid.com.cn"]) {
                NSLog(@"1111");
            }
            weakSelf.finished = YES;
            weakSelf.executing = NO;
            [weakSelf _pvk_completionWithLocalURL:filePath error:error realURL:url redirectURL:nil];
        }
        
    }];
    [self.task resume];
}

//#pragma mark - NSURLSessionTaskDelegate
//- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task didCompleteWithError:(NSError *)error {
//    self.executing = NO;
//    self.finished = YES;
//    if (error != nil) {
//        NSLog(@"vk_log_download:下载失败");
//        NSError *realError = PVK_errorWithCodeAndMsg(VKDownloadErrorType_URLIsWrong, [error description]);
//        [self _pvk_completionWithLocalURL:nil error:realError redirectURL:nil];
//    }
//}
//
//#pragma mark - NSURLSessionDownloadDelegate
//// 下载完成
//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location {
//    self.executing = NO;
//    self.finished = YES;
//
//    NSLog(@"vk_log_download:下载完成 %@", location);
//    [self _pvk_completionWithLocalURL:location error:nil redirectURL:nil];
//}
//// 断点下载数据
//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes {
//}
//// 写数据
//- (void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite {
//    self.progress.completedUnitCount = totalBytesWritten;
//    self.progress.totalUnitCount = totalBytesExpectedToWrite;
//
//    NSLog(@"vk_log_download:下载进度, totalBytesWritten:%lld, totalBytesExpectedToWrite:%lld", totalBytesWritten, totalBytesExpectedToWrite);
//    __weak __typeof(self) weakSelf = self;
//    dispatch_async(dispatch_get_main_queue(), ^{
//        if (weakSelf.vk_progressBlock) {
//            weakSelf.vk_progressBlock(weakSelf.progress);
//        }
//    });
//}

#pragma mark - Private
- (void)_pvk_completionWithLocalURL:(NSURL *)localURL error:(NSError *)error realURL:(NSURL *)realURL redirectURL:(NSURL *)redirectURL {
    __weak __typeof(self) weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (weakSelf.vk_completionBlock) {
            weakSelf.vk_completionBlock(localURL, error, realURL, redirectURL);
        }
    });
}

#pragma mark - Concurrent
- (void)setFinished:(BOOL)finished {
    [self willChangeValueForKey:@"isFinished"];
    _finished = finished;
    [self didChangeValueForKey:@"isFinished"];
}

- (void)setExecuting:(BOOL)executing {
    [self willChangeValueForKey:@"isExecuting"];
    _executing = executing;
    [self didChangeValueForKey:@"isExecuting"];
}
- (BOOL)isConcurrent {
    return YES;
}
@end
