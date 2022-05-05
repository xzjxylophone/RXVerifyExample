//
//  RVAFNetworkingViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/4/18.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVAFNetworkingViewController.h"
#import <AFNetworking.h>


// this function doesn't check params valid
//int water_valume(const int *height, int width, int depth)
//{
//    int totalArea = width * width;
//    int max = 0;
//    // find max
//    for (int i = 0; i < totalArea; i++) {
//        int oneHeight = *(height + i * sizeof(int));
//        if (max < oneHeight) {
//            max = oneHeight;
//        }
//    }
//    // to hold to Max
//    int result = 0;
//    for (int i = 0; i < width; i++) {
//        int oneHeight = *(height + i * sizeof(int));
//        int offset = abs(oneHeight - max);
//        result += offset;
//    }
//    // if depth greater than max need to add
//    if (depth > max) {
//        int offset2 = (depth - max) * width * width;
//        result += offset2;
//    }
//    return result;
//    
//}

static dispatch_queue_t responseAnalysisQueue(void) {
    static dispatch_queue_t sharedQueue = nil;
    static dispatch_once_t predicat;
    dispatch_once(&predicat, ^{
        sharedQueue = dispatch_queue_create("com.analysis.global.data", DISPATCH_QUEUE_CONCURRENT);
    });
    return sharedQueue;
}


@interface RVAFNetworkingViewController ()

@end

@implementation RVAFNetworkingViewController



- (void)test_Http_post_001
{
//    NSString *str = @"http://api.hiexhibition.com/v1/homepage";
    
//    NSString *base = @"http://api.hiexhibition.com";
//    NSString *info = @"v1/zhanhui";
//    NSLog(@"start");
//    AFHTTPSessionManager *httpSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:base]];
////    httpSessionManager.completionQueue = responseAnalysisQueue();
//    NSURLSessionDataTask *sessionDataTask = [httpSessionManager POST:info parameters:nil progress:^(NSProgress * progress) {
//        NSLog(@"progress");
//    } success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"success:responseObject:%@", [responseObject class]);
//        dispatch_queue_t queue = responseAnalysisQueue();
//        dispatch_async(queue, ^{
//            NSLog(@"analysis data");
//            sleep(2);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                NSLog(@"go to main");
//            });
//        });
//    } failure:^(NSURLSessionDataTask *task, NSError * error) {
//        NSLog(@"failed:%@", error);
//    }];
//    NSLog(@"end");
//    NSLog(@"sessionDataTask:%@", sessionDataTask);
//    [sessionDataTask cancel];
}

- (NSString *)parametersFromDictionary:(NSDictionary *)dic
{
    NSMutableArray *ary = [NSMutableArray array];
    for (NSString *key in dic.allKeys) {
        NSString *value = [dic objectForKey:key];
        [ary addObject:[NSString stringWithFormat:@"%@=%@", key, value]];
    }
//    NSString *extraString = [NSString stringWithFormat:@"clientVersion=iOS%@", [RXInfoHelper appVersion]];
//    [ary addObject:extraString];
//    
//    extraString = [NSString stringWithFormat:@"clienttype=1"];
//    [ary addObject:extraString];
    NSString *result = [ary componentsJoinedByString:@"&"];
    return result;
}


- (void)test_Http_post_002
{
    //    NSString *str = @"http://api.hiexhibition.com/v1/homepage";
    
//    NSString *base = @"http://api.hiexhibition.com";
//    NSString *info = @"v1/zhanhui";
//    NSDictionary *params = @{@"num":@"1",
//                             @"offset":@"1"};
//    NSLog(@"start");
//    AFHTTPSessionManager *httpSessionManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:base]];
//    AFHTTPRequestSerializer *requestSerializer = [[AFHTTPRequestSerializer alloc] init];
//    [requestSerializer setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, id parameters, NSError **error) {
//        return [self parametersFromDictionary:parameters];
//    }];
//    httpSessionManager.requestSerializer = requestSerializer;
//    NSURLSessionDataTask *sessionDataTask = [httpSessionManager POST:info parameters:params progress:^(NSProgress * progress) {
//        NSLog(@"progress");
//    } success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"success:responseObject class:%@", [responseObject class]);
//        NSLog(@"success:responseObject:%@", responseObject);
//        dispatch_queue_t queue = responseAnalysisQueue();
//        dispatch_async(queue, ^{
//            NSLog(@"analysis data");
//            sleep(2);
//            dispatch_async(dispatch_get_main_queue(), ^{
//                NSLog(@"go to main");
//            });
//        });
//    } failure:^(NSURLSessionDataTask *task, NSError * error) {
//        NSLog(@"failed:%@", error);
//    }];
//    NSLog(@"end");
//    NSLog(@"sessionDataTask:%@", sessionDataTask);
}



- (void)test_Http_post_003
{
    dispatch_queue_t queue = responseAnalysisQueue();
    dispatch_group_t group = dispatch_group_create();

    NSString *base = @"http://api.hiexhibition.com";
    NSString *info1 = @"v1/base/city";
    NSLog(@"start");
    dispatch_group_enter(group);
    AFHTTPSessionManager *httpSessionManager1 = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:base]];
    httpSessionManager1.completionQueue = queue;
//    AFHTTPRequestSerializer *requestSerializer1 = [[AFHTTPRequestSerializer alloc] init];
//    [requestSerializer1 setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, id parameters, NSError **error) {
//        return [self parametersFromDictionary:parameters];
//    }];
//    httpSessionManager1.requestSerializer = requestSerializer1;
//    httpSessionManager1.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript", nil];
//    [httpSessionManager1 POST:info1 parameters:nil progress:^(NSProgress * progress) {
//        NSLog(@"1progress");
//    } success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"1success:responseObject class:%@", [responseObject class]);
////        NSThread *thread = [NSThread currentThread];
////        dispatch_queue_t queue = dispatch_get_current_queue();
////        NSLog(@"%s", dispatch_queue_get_label(queue));
//        dispatch_group_leave(group);
//
//    } failure:^(NSURLSessionDataTask *task, NSError * error) {
//        NSLog(@"1failed");
//        dispatch_group_leave(group);
//    }];
    
    NSString *info2 = @"v1/base/enterprise_nature";
    dispatch_group_enter(group);
    AFHTTPSessionManager *httpSessionManager2 = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:base]];
    httpSessionManager2.completionQueue = queue;
//    AFHTTPRequestSerializer *requestSerializer2 = [[AFHTTPRequestSerializer alloc] init];
//    [requestSerializer2 setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, id parameters, NSError **error) {
//        return [self parametersFromDictionary:parameters];
//    }];
//    httpSessionManager2.requestSerializer = requestSerializer2;
    
//    [httpSessionManager2 POST:info2 parameters:nil progress:^(NSProgress * progress) {
//        NSLog(@"2progress");
//    } success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"2success:responseObject class:%@", [responseObject class]);
//        dispatch_group_leave(group);
//    } failure:^(NSURLSessionDataTask *task, NSError * error) {
//        NSLog(@"2failed");
//        dispatch_group_leave(group);
//    }];
    NSLog(@"before notify");
    
    dispatch_group_notify(group, queue, ^{
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 50, 50)];
        view.backgroundColor = [UIColor redColor];
        [self.view addSubview:view];
//        dispatch_queue_t queue = disp
        
        NSLog(@"notify");
    });

}


- (void)test_Http_post_004
{
    dispatch_queue_t queue = responseAnalysisQueue();
    dispatch_group_t group = dispatch_group_create();
    
    NSString *base = @"http://api.hiexhibition.com";
    NSString *info1 = @"v1/base/city";
    NSLog(@"start");
    dispatch_group_enter(group);

    
    AFHTTPSessionManager *httpSessionManager1 = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:base]];
    httpSessionManager1.completionQueue = queue;
    httpSessionManager1.completionGroup = group;
    //    AFHTTPRequestSerializer *requestSerializer1 = [[AFHTTPRequestSerializer alloc] init];
    //    [requestSerializer1 setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, id parameters, NSError **error) {
    //        return [self parametersFromDictionary:parameters];
    //    }];
    //    httpSessionManager1.requestSerializer = requestSerializer1;
    //    httpSessionManager1.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html", @"text/json", @"text/javascript", nil];
//    [httpSessionManager1 POST:info1 parameters:nil progress:^(NSProgress * progress) {
//        NSLog(@"1progress");
//
//    } success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"1success:responseObject class:%@", [responseObject class]);
//        //        NSThread *thread = [NSThread currentThread];
//        //        dispatch_queue_t queue = dispatch_get_current_queue();
//        //        NSLog(@"%s", dispatch_queue_get_label(queue));
//        dispatch_group_leave(group);
//
//    } failure:^(NSURLSessionDataTask *task, NSError * error) {
//        NSLog(@"1failed");
//        dispatch_group_leave(group);
//
//    }];
    
    
    dispatch_group_enter(group);

    NSString *info2 = @"v1/base/enterprise_nature";
    AFHTTPSessionManager *httpSessionManager2 = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:base]];
    httpSessionManager2.completionQueue = queue;
    httpSessionManager2.completionGroup = group;
    //    AFHTTPRequestSerializer *requestSerializer2 = [[AFHTTPRequestSerializer alloc] init];
    //    [requestSerializer2 setQueryStringSerializationWithBlock:^NSString *(NSURLRequest *request, id parameters, NSError **error) {
    //        return [self parametersFromDictionary:parameters];
    //    }];
    //    httpSessionManager2.requestSerializer = requestSerializer2;
    
//    [httpSessionManager2 POST:info2 parameters:nil progress:^(NSProgress * progress) {
//        NSLog(@"2progress");
//    } success:^(NSURLSessionDataTask *task, id responseObject) {
//        NSLog(@"2success:responseObject class:%@", [responseObject class]);
//        dispatch_group_leave(group);
//
//    } failure:^(NSURLSessionDataTask *task, NSError * error) {
//        NSLog(@"2failed");
//        dispatch_group_leave(group);
//
//    }];
    NSLog(@"before notify");
    
    dispatch_group_notify(group, queue, ^{
        dispatch_sync(dispatch_get_main_queue(), ^{
            UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 50, 50)];
            view.backgroundColor = [UIColor redColor];
            [self.view addSubview:view];
            
            NSLog(@"notify");
        });
        
    });
    
}



#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
//    dispatch_queue_t queue = dispatch_queue_create("com.1", DISPATCH_QUEUE_SERIAL);
//    dispatch_async(queue, ^{
//        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 200, 50, 50)];
//        view.backgroundColor = [UIColor redColor];
//        [self.view addSubview:view];
//        NSLog(@"Kkkk");
//    });
//    
    
    [self test_Http_post_004];
    
    

    
    
//    int height_1 = {{5, 5, 5}, {5, 1, 5}, {5, 5, 5}};
    
    
//    assert(water_valume(&height_1, 3, 3) == 4);
    
//    int *height1 = {5, 5, 5,
//                    5, 1, 5,
//                    5, 5, 5};
//    assert(water_valume(height1, 3, 3) == 4);
//    assert(water_valume(height1, 3, 2) == 4);
//    assert(water_valume(height1, 3, 5) == 4);
//    assert(water_valume(height1, 3, 6) == (4 + 9));
//    
//    int *height2 = {5, 5, 5, 6
//                    5, 1, 5, 6
//                    5, 5, 5, 6
//                    1, 2, 3, 4};
//    assert(water_valume(height2, 4, 3) == 27);
//    assert(water_valume(height2, 4, 8) == (27 + 16 * 2));
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
