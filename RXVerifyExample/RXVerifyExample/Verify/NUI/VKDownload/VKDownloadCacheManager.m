//
//  VKDownloadCacheManager.m
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/6/14.
//

#import "VKDownloadCacheManager.h"
#import "NSString+OnlineClass.h"

@interface VKDownloadCacheManager()
@property (nonatomic, strong) NSCache *cache;
@property (nonatomic, strong) dispatch_queue_t ioQueue;
@property (nonatomic, assign) NSInteger maxFileCount;
@property (nonatomic, copy) NSDictionary *subDirectoryDictionary;
@end

@implementation VKDownloadCacheManager

- (BOOL)findWithURL:(NSURL *)url completionBlock:(VKDownloadCompletionBlock)completionBlock {
    BOOL find = [self _pvk_resourceWithURL:url];
    if (find) {
        __weak typeof(self) weakSelf = self;
        dispatch_async(self.ioQueue, ^{
            NSString *fileName = [weakSelf _pvk_fileNameWithURL:url];
            NSString *fullPath = [weakSelf _pvk_fullPathWithFileName:fileName];
            NSURL *fullPathURL = [NSURL fileURLWithPath:fullPath];
            // 更新文件的日期
            NSFileManager *fm = [NSFileManager defaultManager];
            NSDictionary *attrs = [fm attributesOfItemAtPath:fullPath error:nil];
            if (attrs != nil) {
                NSMutableDictionary *mutDic = [attrs mutableCopy];
                mutDic[NSFileModificationDate] = [NSDate new];
                [fm setAttributes:mutDic ofItemAtPath:fullPath error:nil];
            }
            if (completionBlock != nil) {
                dispatch_async(dispatch_get_main_queue(), ^{
                    completionBlock(fullPathURL, nil, VKDownloadCacheType_Disk, url);
                });
            }
        });
    }
    return find;
}
- (void)saveWithURL:(NSURL *)url fromURL:(NSURL *)fromURL completionBlock:(void(^)(NSURL *newLocalURL))completionBlock {
    __weak typeof(self) weakSelf = self;
    dispatch_async(self.ioQueue, ^{
        NSURL *newURL = nil;
        if (fromURL != nil) {
            NSString *fileName = [weakSelf _pvk_fileNameWithURL:url];
            NSString *fullPath = [weakSelf _pvk_fullPathWithFileName:fileName];
            NSURL *fullPathURL = [NSURL fileURLWithPath:fullPath];
            newURL = fullPathURL;
            NSFileManager *fm = [NSFileManager defaultManager];
            NSError *error = nil;
            [fm moveItemAtURL:fromURL toURL:fullPathURL error:&error];
            if (error != nil) {
                NSLog(@"vk_log_download: 移动文件失败");
            } else {
                NSLog(@"vk_log_download: 移动文件成功 : %@", fileName);
            }
            [weakSelf _pvk_clearIfNeed];
        }
        if (completionBlock != nil) {
            completionBlock(newURL);
        }
    });
}
- (NSString *)tmpFullPathWithURL:(NSURL *)url {
    NSString *fileName = [self _pvk_fileNameWithURL:url];
    NSString *tmpDir = [self _pvk_tmpDirectory];
    NSString *fullPath = [tmpDir stringByAppendingPathComponent:fileName];
    return fullPath;
}
- (void)clearAll {
    [[NSFileManager defaultManager] removeItemAtPath:[self _pvk_rootDirectory] error:nil];
    [[NSFileManager defaultManager] removeItemAtPath:[self _pvk_tmpDirectory] error:nil];
    
    [self _pvk_initCacheDirectory];
}


#pragma mark - Private
// 如果有必要的话,清除多余的缓存文件
- (void)_pvk_clearIfNeed {
    NSString *root = [self _pvk_rootDirectory];
    NSInteger count = [self _pvk_numberOfAllCachedFileWithDirector:root];
    if (count > self.maxFileCount) {
        [self _pvk_halfClear];
    }
}
// 清除根目录下的一半文件
- (void)_pvk_halfClear {
    NSString *root = [self _pvk_rootDirectory];
    NSError *error = nil;
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *filesArray = [fm contentsOfDirectoryAtPath:root error:&error];
    for (NSString *item in filesArray) {
        BOOL isDir = NO;
        NSString *fullPath = [root stringByAppendingPathComponent:item];
        if ([fm fileExistsAtPath:fullPath isDirectory:&isDir]) {
            if (isDir) { // 目录
                [self _pvk_removeHalfFilesWithDirectory:fullPath];
            } else { // 文件
                // 理论上是不可能存在的
            }
        }
    }
}
// 移除目录下的一半文件
- (void)_pvk_removeHalfFilesWithDirectory:(NSString *)directory {
    NSError *error = nil;
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *filesArray = [fm contentsOfDirectoryAtPath:directory error:&error];
    NSMutableDictionary *mutDic = [NSMutableDictionary new];
    for (NSString *item in filesArray) {
        BOOL isDir = NO;
        NSString *fullPath = [directory stringByAppendingPathComponent:item];
        if ([fm fileExistsAtPath:fullPath isDirectory:&isDir]) {
            if (isDir) { // 目录
                [self _pvk_removeHalfFilesWithDirectory:fullPath];
            } else { // 文件
                NSDictionary *attrs = [fm attributesOfItemAtPath:fullPath error:nil];
                NSDate *key = [NSDate dateWithTimeIntervalSince1970:0];;
                if (attrs != nil && attrs[NSFileModificationDate] != nil) {
                    key = attrs[NSFileModificationDate];
                }
                mutDic[key] = fullPath;
            }
        }
    }
    NSArray *allKeys = [mutDic.allKeys sortedArrayUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2) {
        return [obj1 compare:obj2];
    }];
    NSLog(@"allkeys:%@", allKeys);
    for (NSInteger i = 0; i < allKeys.count / 2; i++) {
        NSDate *key = allKeys[i];
        NSString *deletePath = mutDic[key];
        [fm removeItemAtPath:deletePath error:&error];
    }
}
// 获取所有缓存目录的文件个数
- (NSInteger)_pvk_numberOfAllCachedFileWithDirector:(NSString *)directory
{
    NSInteger count = 0;
    NSError *error = nil;
    NSFileManager *fm = [NSFileManager defaultManager];
    NSArray *filesArray = [fm contentsOfDirectoryAtPath:directory error:&error];
    for (NSString *item in filesArray) {
        BOOL isDir = NO;
        NSString *fullPath = [directory stringByAppendingPathComponent:item];
        if ([fm fileExistsAtPath:fullPath isDirectory:&isDir]) {
            if (isDir) {//目录
                count += [self _pvk_numberOfAllCachedFileWithDirector:fullPath];
            } else {//文件
                count += 1;
            }
        }
    }
    return count;
}
// 某个资源对应的下载文件是否存在
- (BOOL)_pvk_resourceWithURL:(NSURL *)url {
    NSString *fileName = [self _pvk_fileNameWithURL:url];
    NSString *fullPath = [self _pvk_fullPathWithFileName:fileName];
    NSFileManager *fm = [NSFileManager defaultManager];
    return [fm fileExistsAtPath:fullPath];
}
// 获取文件名
- (NSString *)_pvk_fileNameWithURL:(NSURL *)url {
    NSString *absoluteString = url.absoluteString;
    NSString *suffixFileName = @"";
    if (NSNotFound != [absoluteString rangeOfString:@"?"].location) {
        NSString *paramString = [absoluteString substringFromIndex:([absoluteString rangeOfString:@"?"].location + 1)];
        NSCharacterSet *delimiterSet = [NSCharacterSet characterSetWithCharactersInString:@"&"];
        NSScanner *scanner = [[NSScanner alloc] initWithString:paramString];
        while (![scanner isAtEnd]) {
            NSString *pairString = nil;
            [scanner scanUpToCharactersFromSet:delimiterSet intoString:&pairString];
            [scanner scanCharactersFromSet:delimiterSet intoString:NULL];
            NSArray *kvPair = [pairString componentsSeparatedByString:@"="];
            if (kvPair.count == 2) {
                NSString *value = [kvPair objectAtIndex:1];
                suffixFileName = value;
            }
        }
    } else {
        suffixFileName = [absoluteString componentsSeparatedByString:@"/"].lastObject;
    }
    // TODO_XZJ
    NSString *md5 = [absoluteString vkMD5String];
    NSString *fileName = [NSString stringWithFormat:@"%@_%@", md5, suffixFileName];
    return fileName;
}
// 获取缓存根目录
- (NSString *)_pvk_rootDirectory {
    NSString *cacheDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *appCacheDir = [cacheDir stringByAppendingPathComponent:@"online_class"];
    return appCacheDir;
}
- (NSURL *)localURLWithURL:(NSURL *)url {
    NSString *fileName = [self _pvk_fileNameWithURL:url];
    NSString *fullPath = [self _pvk_fullPathWithFileName:fileName];
    NSFileManager *fm = [NSFileManager defaultManager];
    if ([fm fileExistsAtPath:fullPath]) {
        return [NSURL fileURLWithPath:fullPath];
    } else {
        return nil;
    }
}
// 获取缓存临时目录
- (NSString *)_pvk_tmpDirectory {
    NSString *cacheDir = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *tmpDir = [cacheDir stringByAppendingPathComponent:@"online_class_tmp"];
    return tmpDir;
}
// 根据文件名称获取全路径
- (NSString *)_pvk_fullPathWithFileName:(NSString *)filePath {
    NSString *extension = [filePath componentsSeparatedByString:@"."].lastObject;
    NSString *dir = self.subDirectoryDictionary[extension] ? self.subDirectoryDictionary[extension] : @"other";
    NSString *root = [self _pvk_rootDirectory];
    NSString *subCacheDir = [root stringByAppendingPathComponent:dir];
    NSString *fullPath = [subCacheDir stringByAppendingPathComponent:filePath];
    return fullPath;
}
// 初始化相关的目录
- (void)_pvk_initCacheDirectory {
    NSFileManager *fm = [NSFileManager defaultManager];
    [fm createDirectoryAtPath:[self _pvk_rootDirectory] withIntermediateDirectories:YES attributes:nil error:nil];
    [fm createDirectoryAtPath:[self _pvk_tmpDirectory] withIntermediateDirectories:YES attributes:nil error:nil];
    for (NSString *value in self.subDirectoryDictionary.allValues) {
        NSString *filePath = [[self _pvk_rootDirectory] stringByAppendingPathComponent:value];
        [fm createDirectoryAtPath:filePath withIntermediateDirectories:YES attributes:nil error:nil];
    }
}

#pragma mark - Singleton
- (id)init {
    if (self = [super init]) {
        self.cache = [NSCache new];
        self.cache.countLimit = 50;
        self.ioQueue = dispatch_queue_create("www.vip.com.cn", DISPATCH_QUEUE_SERIAL);
        self.maxFileCount = 40;
        self.subDirectoryDictionary = @{@"jpg": @"image",
                                        @"png": @"image",
                                        @"mp3": @"audio",
                                        @"": @"other"
                                        };
        [self _pvk_initCacheDirectory];
    }
    return self;
}
+ (instancetype)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}
@end
