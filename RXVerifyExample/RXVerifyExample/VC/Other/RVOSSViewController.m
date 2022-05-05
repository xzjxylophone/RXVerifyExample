//
//  RVOSSViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/6/29.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVOSSViewController.h"
#import <AliyunOSSiOS/OSSService.h>
#import <AliyunOSSiOS/OSSCompat.h>
#import "RXImagePickManager.h"
@interface RVOSSViewController () <RXImagePickManagerDelegate>
{
    OSSClient * client;
}


@property (nonatomic, strong) RXImagePickManager *rxImagePickManager;

@end

@implementation RVOSSViewController


#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self performSelector:@selector(test_OSS) withObject:nil afterDelay:1.0];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - RXImagePickManagerDelegate

- (UIViewController *)viewControllerInRXImagePickManager:(RXImagePickManager *)rxImagePickManager
{
    return self;
}

- (void)rxImagePickManager:(RXImagePickManager *)rxImagePickManager selectedImage:(UIImage *)selectedImage
{
    
    
    /*
    UserModel *user=[UserModel currentUser];
    OSSPutObjectRequest *put=[OSSPutObjectRequest new];
    put.bucketName=BUKNAME;
    NSDate *  senddate=[NSDate date];
    NSDateFormatter  *dateformatter=[[NSDateFormatter alloc] init];
    [dateformatter setDateFormat:@"YYYYMMddmmss"];
    NSString *  locationString=[dateformatter stringFromDate:senddate];
    NSString *objectStr=[NSString stringWithFormat:@"dmg/dmgphoto/user/%@%@.jpg",user.phone,locationString];
    put.objectKey=objectStr;
    put.uploadingData=self.imgStr;
    __weak typeof(self) weakself=self;
    OSSTask *putTask=[self.client putObject:put];
    [[putTask continueWithBlock:^id(OSSTask *task)
      {
          if (!task.error)
          {
              self.photoUrl=[NSString stringWithFormat:@"/%@",objectStr];
              [weakself upUserInfo];
          }
          else
          {
              CustomAlertView * alert = [[CustomAlertView alloc]initWithmessage:@"上传失败，请重新上传!" delegate:self];
              [alert show];
              
          }
          return nil;
      }]waitUntilFinished];
    */
    
    NSString *ossID = @"6eGbpUhlZUdiObK5";
    NSString *ossKeySecret = @"a13TrTjGeA7sa9F31PyRMIP91GKb8m";
    
     // http://yiyizuche.oss-cn-beijing.aliyuncs.com/difu/photo/img/20160627/1268086482@chatroom_1465354326937_43.png
//#warning 参数设置
    
    
    NSString *endpoint = @"http://yiyizuche.oss-cn-beijing.aliyuncs.com";
    endpoint = @"oss-cn-beijing";
    endpoint = @"http://oss-cn-beijing.aliyuncs.com";
    // 明文设置secret的方式建议只在测试时使用，更多鉴权模式参考后面链接给出的官网完整文档的`访问控制`章节
    id<OSSCredentialProvider> credential = [[OSSPlainTextAKSKPairCredentialProvider alloc] initWithPlainTextAccessKey:ossID secretKey:ossKeySecret];
    client = [[OSSClient alloc] initWithEndpoint:endpoint credentialProvider:credential];
    OSSPutObjectRequest * put = [OSSPutObjectRequest new];
    

//#warning 参数设置
    
    // http://xzj.oss.aliyuncs.com/abc/111.jpg
    
    NSString *bucketName = @"yiyidifu";
    NSString *objectKeys = [NSString stringWithFormat:@"difu/photo/img/1111.png"];

    
    
    put.bucketName = bucketName;
    
    put.objectKey = objectKeys;
    NSData *data = UIImagePNGRepresentation(selectedImage);
    put.uploadingData = data;
    put.uploadProgress = ^(int64_t bytesSent, int64_t totalByteSent, int64_t totalBytesExpectedToSend) {
        NSLog(@"%lld, %lld, %lld", bytesSent, totalByteSent, totalBytesExpectedToSend);
    };
    OSSTask * putTask = [client putObject:put];
    
    
    
    
    [putTask continueWithBlock:^id(OSSTask *task) {
        task = [client presignPublicURLWithBucketName:bucketName withObjectKey:objectKeys];
        NSLog(@"objectKey: %@", put.objectKey);
        NSLog(@"task result:%@", task.result);
        if (!task.error) {
            
            
            NSString *string = [NSString stringWithFormat:@"/%@", objectKeys];
            NSLog(@"string:%@", string);
            NSLog(@"upload object success!");
            
        } else {
            NSLog(@"upload object failed, error: %@" , task.error);
        }
        return nil;
    }];
}



#pragma mark - Action
- (void)test_OSS
{
    self.rxImagePickManager = [[RXImagePickManager alloc] init];
    self.rxImagePickManager.delegate = self;
    [self.rxImagePickManager pickAction];
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
