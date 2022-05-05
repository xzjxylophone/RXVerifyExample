//
//  RXAFURLSessionManagerTaskDelegate.h
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/12/23.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXAFURLSessionManagerPrivateDefine.h"
#import "RXAFURLSessionManager.h"
@interface RXAFURLSessionManagerTaskDelegate : NSObject <NSURLSessionTaskDelegate, NSURLSessionDataDelegate, NSURLSessionDownloadDelegate>
- (instancetype)initWithTask:(NSURLSessionTask *)task;
@property (nonatomic, weak) RXAFURLSessionManager *manager;
@property (nonatomic, strong) NSMutableData *mutableData;
@property (nonatomic, strong) NSProgress *uploadProgress;
@property (nonatomic, strong) NSProgress *downloadProgress;
@property (nonatomic, copy) NSURL *downloadFileURL;
@property (nonatomic, copy) RXAFURLSessionDownloadTaskDidFinishDownloadingBlock downloadTaskDidFinishDownloading;
@property (nonatomic, copy) RXAFURLSessionTaskProgressBlock uploadProgressBlock;
@property (nonatomic, copy) RXAFURLSessionTaskProgressBlock downloadProgressBlock;
@property (nonatomic, copy) RXAFURLSessionTaskCompletionHandler completionHandler;

@end
