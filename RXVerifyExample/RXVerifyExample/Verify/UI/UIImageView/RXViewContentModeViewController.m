//
//  RXViewContentModeViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/10/25.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXViewContentModeViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface RXViewContentModeViewController ()

@property (nonatomic, strong) UIImageView *tmp1ImageView;
@property (nonatomic, strong) UIImageView *tmp2ImageView;
@property (nonatomic, strong) UIImageView *tmp3ImageView;


@property (nonatomic, strong) UIImageView *origin1ImageView;
@property (nonatomic, strong) UIImageView *origin2ImageView;
@property (nonatomic, strong) UIImageView *origin3ImageView;

@property (nonatomic, strong) UIView *line1View;
@property (nonatomic, strong) UIView *line2View;
@property (nonatomic, strong) UIView *line3View;

@end

@implementation RXViewContentModeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.line1View = [[UIView alloc] initWithFrame:CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 1)];
    self.line1View.backgroundColor = [UIColor redColor];
    self.line2View = [[UIView alloc] initWithFrame:CGRectMake(0, 250, [UIScreen mainScreen].bounds.size.width, 1)];
    self.line2View.backgroundColor = [UIColor redColor];
    self.line3View = [[UIView alloc] initWithFrame:CGRectMake(0, 400, [UIScreen mainScreen].bounds.size.width, 1)];
    self.line3View.backgroundColor = [UIColor redColor];
    
    self.origin1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 100, 100, 100)];
    self.origin2ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 250, 100, 100)];
    self.origin3ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 400, 100, 100)];
    
    self.tmp1ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 100, 100, 100)];
    self.tmp1ImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.tmp1ImageView.backgroundColor = [UIColor greenColor];
    self.tmp1ImageView.clipsToBounds = YES;
    
    self.tmp2ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 250, 100, 100)];
    self.tmp2ImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.tmp2ImageView.backgroundColor = [UIColor greenColor];
    self.tmp2ImageView.clipsToBounds = YES;
    
    self.tmp3ImageView = [[UIImageView alloc] initWithFrame:CGRectMake(200, 400, 100, 100)];
    self.tmp3ImageView.contentMode = UIViewContentModeScaleAspectFill;
    self.tmp3ImageView.backgroundColor = [UIColor greenColor];
    self.tmp3ImageView.clipsToBounds = YES;
    
    NSString *url_Vertical = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571999972278&di=cc1cebd8751ddb7cda76304923ca1378&imgtype=0&src=http%3A%2F%2Fb-ssl.duitang.com%2Fuploads%2Fitem%2F201203%2F31%2F20120331135810_kMBdG.jpeg";
    NSString *url_Horizontal = @"http://pic31.nipic.com/20130802/2531170_131452087000_2.jpg";
    NSString *url_11 = @"https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1571996384278&di=332c4f7b1eca973b59b34ea3bc65f41e&imgtype=0&src=http%3A%2F%2Fimg1.a.maoyia.com%2F201902%2F21%2F17%2F17-25-19-21-1499589.jpg";
    
    [self.tmp1ImageView sd_setImageWithURL:[NSURL URLWithString:url_Vertical]];
    [self.tmp2ImageView sd_setImageWithURL:[NSURL URLWithString:url_Horizontal]];
    [self.tmp3ImageView sd_setImageWithURL:[NSURL URLWithString:url_11]];
    
    
    __weak typeof(self) weakSelf = self;
    [self.origin1ImageView sd_setImageWithURL:[NSURL URLWithString:url_Vertical] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        [weakSelf resizeImageView:weakSelf.origin1ImageView image:image];
    }];
    [self.origin2ImageView sd_setImageWithURL:[NSURL URLWithString:url_Horizontal] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        [weakSelf resizeImageView:weakSelf.origin2ImageView image:image];
    }];
    [self.origin3ImageView sd_setImageWithURL:[NSURL URLWithString:url_11] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        [weakSelf resizeImageView:weakSelf.origin3ImageView image:image];
    }];
    
    [self.view addSubview:self.origin1ImageView];
    [self.view addSubview:self.origin2ImageView];
    [self.view addSubview:self.origin3ImageView];
    
    [self.view addSubview:self.tmp1ImageView];
    [self.view addSubview:self.tmp2ImageView];
    [self.view addSubview:self.tmp3ImageView];
    
    [self.view addSubview:self.line1View];
    [self.view addSubview:self.line2View];
    [self.view addSubview:self.line3View];
}


- (void)resizeImageView:(UIImageView *)imageView image:(UIImage *)image {
    CGFloat width = 100;
    CGFloat imageWidth = image.size.width;
    CGFloat imageHeight = image.size.height;
    NSLog(@"imageWidth:%.2f imageHeight:%.2f", imageWidth, imageHeight);
    CGFloat height = width / imageWidth * imageHeight;
    CGRect frame = imageView.frame;
    frame.size = CGSizeMake(width, height);
    imageView.frame = frame;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
//
//{
//    "extraInfo": {},
//    "data": {
//        "ads": [{
//            "adLlsid": "13372087017678585281",
//            "itemId": "6321439043966304941",
//            "adProvider": "KS",
//            "adCodeId": null,
//            "adAward": 0,
//            "extra": "{\"result\":1,\"impAdInfo\":[{\"adInfo\":[{\"adTrackInfo\":[{\"type\":1,\"url\":[\"https://s2s.adjust.com/z5hrlc5?campaign=%E5%BC%93%E7%AE%AD%E4%BC%A0%E8%AF%B4-iOS-%E9%9F%B3%E4%B9%90%E9%B3%8C%E6%8B%9C-0907(4441708)&adgroup=5876005&creative=84289585&s2s=1&ip_address=103.107.217.73&idfa_upper_md5=__IDFA2__&install_callback=http%3A%2F%2Fad.partner.gifshow.com%2Ftrack%2Factivate%3Fcallback%3DXWXwjjvhAL1CjyAuo32wE8RNSDdpKO1CPVY0WK2kbC8VEbUtD3Gs6jcVuhSWahDpCXw5yRL9nm5i8WX2oczsaSFuHuzIwbpxkXUY0Ss9whI6-QwdFk3pc3Cv4rYE54zw0momX9EjYNggtwKDHbuwN3cLR7uhzZsnLtpxQuX_RQmgRqoI-KKR_tV67bC5Jgf0\"]}],\"adBaseInfo\":{\"adSourceType\":1,\"chargeInfo\":\"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\",\"deliveryStartTs\":0,\"deliveryEndTs\":0,\"appName\":\"弓箭传说\",\"campaignId\":4441708,\"adShowEnable\":0,\"adShowDuration\":10,\"creativeId\":84289585,\"adDescription\":\"一款在国外火爆的游戏,你不来试试么?\",\"accountId\":1222426,\"adPos\":0,\"adSourceDescription\":\"\",\"appPackageName\":\"\",\"unitId\":5876005,\"appScore\":45,\"adxSourceType\":0,\"appIconUrl\":\"\",\"campaignName\":\"弓箭传说-iOS-音乐鳌拜-0907\",\"adActionDescription\":\"玩游戏\",\"adOperationType\":1},\"adMaterialInfo\":{\"materialFeature\":[{\"coverUrl\":\"\",\"materialUrl\":\"https://static.yximgs.com/udata/pkg/bf17c33ccc377a28173f59f67d7902e9\",\"featureType\":2,\"photoId\":0,\"materialSize\":{\"width\":1124,\"height\":624}}],\"materialType\":2},\"adConversionInfo\":{\"h5Url\":\"\",\"deeplinkUrl\":\"\",\"cellphone\":\"\",\"appDownloadUrl\":\"https://itunes.apple.com/cn/app/id1475058355\",\"email\":\"\"},\"advertiserInfo\":{\"accountId\":1222426,\"portraitUrl\":\"https://ali2.a.yximgs.com/uhead/AB/2019/05/15/16/BMjAxOTA1MTUxNjA3MDNfMTMzNzcwNDY5MV8yX2hkNDg5XzUxOA==_s.jpg\",\"userGender\":\"F\",\"userName\":\"弓箭传说\",\"userId\":1337704691}}],\"type\":3,\"pageId\":20001,\"subPageId\":20001001,\"gridPos\":0,\"gridUnitId\":\"2\"}],\"llsid\":1647645827783737345}",
//            "adBizType": null,
//            "adPositionType": "NEWS",
//            "warmUpCnt": 2,
//            "warmUpExpire": 1800000
//        }, {
//            "adLlsid": "8184623981451366854",
//            "itemId": "2859780724474957184",
//            "adProvider": "KS",
//            "adCodeId": null,
//            "adAward": 0,
//            "extra": "{\"result\":1,\"impAdInfo\":[{\"adInfo\":[{\"adTrackInfo\":[{\"type\":1,\"url\":[\"https://s2s.adjust.com/5rpfbnw?campaign=1017-LS%2F14%E8%A7%A3%E5%8E%8B%E6%8D%8F1016(4834486)&adgroup=6204159&creative=89638718&s2s=1&ip_address=103.107.217.73&idfa_upper_md5=__IDFA2__&install_callback=http%3A%2F%2Fad.partner.gifshow.com%2Ftrack%2Factivate%3Fcallback%3DCDBaUUxqCQURTp2R0N3vU7rpOatWMebgNl9QybY_lz1N9gO8ibcpReWLkTuRp_xwNvClxs38HhRZp3CXI_J9VKU3AIU7L9twXDOJC7B8TcvOqatlZiqJmyI_ke8rnDYPROYSQNOndBretxD31bJ809yXeqJLjMkAcRmdk68i-sl7-ENnCeV5hOX3GZjRmpNM\"]}],\"adBaseInfo\":{\"adSourceType\":1,\"chargeInfo\":\"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\",\"deliveryStartTs\":0,\"deliveryEndTs\":0,\"appName\":\"弓箭传说\",\"campaignId\":4834486,\"adShowEnable\":0,\"adShowDuration\":10,\"creativeId\":89638718,\"adDescription\":\"都在玩的休闲游戏，看看你能闯到第几关呢？\",\"accountId\":2148638,\"adPos\":0,\"adSourceDescription\":\"\",\"appPackageName\":\"\",\"unitId\":6204159,\"appScore\":45,\"adxSourceType\":0,\"appIconUrl\":\"\",\"campaignName\":\"1017-LS/14解压捏1016\",\"adActionDescription\":\"玩游戏\",\"adOperationType\":1},\"adMaterialInfo\":{\"materialFeature\":[{\"coverUrl\":\"\",\"materialUrl\":\"https://static.yximgs.com/udata/pkg/bf17c33ccc377a28173f59f67d7902e9\",\"featureType\":2,\"photoId\":0,\"materialSize\":{\"width\":1124,\"height\":624}}],\"materialType\":2},\"adConversionInfo\":{\"h5Url\":\"\",\"deeplinkUrl\":\"\",\"cellphone\":\"\",\"appDownloadUrl\":\"https://itunes.apple.com/cn/app/id1475058355\",\"email\":\"\"},\"advertiserInfo\":{\"accountId\":2148638,\"portraitUrl\":\"https://ali2.a.yximgs.com/uhead/AB/2019/09/18/15/BMjAxOTA5MTgxNTQ2MTZfMTQ5ODMwODc2OF8yX2hkNDExXzIwMg==_s.jpg\",\"userGender\":\"F\",\"userName\":\"弓箭传说官方正版\",\"userId\":1498308768}}],\"type\":3,\"pageId\":20001,\"subPageId\":20001001,\"gridPos\":0,\"gridUnitId\":\"1\"}],\"llsid\":1647645827783737345}",
//            "adBizType": null,
//            "adPositionType": "NEWS",
//            "warmUpCnt": 2,
//            "warmUpExpire": 1800000
//        }]
//    },
//    "status": 0,
//    "message": "success"
//}

@end
