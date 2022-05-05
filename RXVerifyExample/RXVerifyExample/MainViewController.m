//
//  MainViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/8.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "MainViewController.h"
#import "RXYellowView.h"
#import <Masonry/Masonry.h>
#import "NSObject+RXVerifyExample.h"
#import "RXWeakTestViewController.h"
#import "RXDirectionViewController.h"
#import <UIImageView+WebCache.h>
//#import <FLAnimatedImage/FLAnimatedImage.h>
//#import <FLAnimatedImage/FLAnimatedImageView.h>
//#import <FLAnimatedImageView+WebCache.h>
#import <FMDB/FMDB.h>
static NSInteger a = 0;

// xzj_todo https://www.ojit.com/article/1906717
// xzj_todo linux 学习 https://www.zhihu.com/question/19606660
@interface MainViewController ()


@property (nonatomic, strong) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSString *target;
@property (nonatomic, strong) NSArray *functionItems;

@property (nonatomic, strong) UIView *yellowView;

@property (nonatomic, copy) NSString *abc;

@property (nonatomic, strong) FMDatabaseQueue *queue;


@end

@implementation MainViewController

- (void)fmdb_test {
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *dbPath = [docPath stringByAppendingPathComponent:@"test.sqlite"];
        _queue = [FMDatabaseQueue databaseQueueWithPath:dbPath];
        
        // 构建测试数据，新建一个表test，inert一些数据
        [_queue inDatabase:^(FMDatabase * _Nonnull db) {
            [db executeUpdate:@"create table if not exists test (a text, b text, c text, d text, e text, f text, g text, h text, i text)"];
            for (int i = 0; i < 10000; i++) {
                NSString *sql = [NSString stringWithFormat:@"insert into test (a, b, c, d, e, f, g, h, i) values ('1', '1', '1','1', '1', '1','1', '1', '1')"];
                [db executeUpdate:sql];
            }
        }];
        
        // 多线程查询数据库
        for (int i = 0; i < 10; i++) {
            dispatch_async(dispatch_get_global_queue(0, 0), ^{
                [_queue inDatabase:^(FMDatabase * _Nonnull db) {
                    FMResultSet *result = [db executeQuery:@"select * from test where a = '1'"];
                    // 这里要用if，改成while就没问题了
                    if ([result next]) {
                    }
                    // 这里不调用close
    //                [result close];
                }];
            });
        }

}
- (CGFloat)valueWith:(CGFloat)ab {
    CGFloat x = ab * 2;
    NSInteger x2 = ceil(x);
    return x2 / 2.0f;
}
- (void)appIVTest {
    UIImageView *iv1 = [UIImageView new];
    [iv1 sd_setImageWithURL:[NSURL URLWithString:@"https://t8.baidu.com/it/u=1484500186,1503043093&fm=79&app=86&size=h300&n=0&g=4n&f=jpeg?sec=1590750901&t=519ce75c1da6810cca9a5fe5561712a1"] completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
        NSLog(@"111");
    }];
    [self.view addSubview:iv1];
}

- (void)kkkk {
    NSArray *ary = @[@"111", @"222", @"333"];
    dispatch_group_t group = dispatch_group_create();
    [ary enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        dispatch_group_enter(group);
        NSLog(@"kkkk:%@", obj);
        dispatch_group_leave(group);
    }];
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"kkkk:notify");
    });
}
- (NSString *)reserver:(NSString *)str {
    unsigned long len;
    len = [str length];
    unichar a[len];
    for(int i = 0; i < len; i++)
    {
    unichar c = [str characterAtIndex:len-i-1];
    a[i] = c;
    }
    NSString *str1=[NSString stringWithCharacters:a length:len];
    
    return str1;
}
- (void)mult:(NSString *)a b:(NSString *)b {
    NSString *a1 = [self reserver:a];
    NSString *b1 = [self reserver:b];
    for (NSInteger i = 0; i < a1.length; i++) {
        for (NSInteger j = 0; j < b1.length; j++) {
            
        }
    }
}

- (void)scanOtherApp {
    NSArray *ary = @[@"YPConvenientPay://", @"xhqball://", @"daikuangou://"];
    for (NSString *scheme in ary) {
        BOOL result = [[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:scheme]];
        NSLog(@"canOpenURL:  scan result:%@", result ? @"YES" : @"NO");
    }
}
- (void)imageViewTest {
    NSString *imageURLString = @"https://sf1-ttcdn-tos.pstatp.com/obj/ad.union.api/text_icon_02";
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    [imageView sd_setImageWithURL:[NSURL URLWithString:imageURLString]];
    [self.view addSubview:imageView];
}
- (void)imageViewTest2 {
//    NSString *imageURLString = @"https://sf1-ttcdn-tos.pstatp.com/obj/ad.union.api/text_icon_02";
//    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:imageURLString]];
//
//    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:data];
//    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
//    [imageView setAnimatedImage:image];
////    [imageView sd_setImageWithURL:[NSURL URLWithString:imageURLString]];
////    imageView
//    [self.view addSubview:imageView];
}

- (void)imageViewTest3 {
//    NSString *imageURLString = @"https://sf1-ttcdn-tos.pstatp.com/obj/ad.union.api/text_icon_02";
//    NSURL *url = [NSURL URLWithString:imageURLString];
////    NSData *data = [NSData dataWithContentsOfURL:url];
//
////    FLAnimatedImage *image = [FLAnimatedImage animatedImageWithGIFData:data];
//    FLAnimatedImageView *imageView = [[FLAnimatedImageView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
////    [imageView setAnimatedImage:image];
//    [imageView sd_setImageWithURL:url];
////    imageView
//    [self.view addSubview:imageView];
}
#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    NSString *test1 = @"1111";
//    if (!test1.length) {
//        NSLog(@"11");
//    } else {
//        NSLog(@"11");
//    }
//    
//    test1 = @"";
//    if (!test1.length) {
//        NSLog(@"11");
//    } else {
//        NSLog(@"11");
//    }
    
//    [self fmdb_test];
    
//    [self test];
//    
//    FILE *input = fopen(NULL, "r");
//    
//    NSMutableDictionary *utdi = [NSMutableDictionary new];
//    utdi[@"abc"] = @"132";
//    utdi[@"abc"] = nil;
////    [utdi setObject:@"aaa" forKey:nil];
////    [utdi setObject:nil forKey:@"aaa"];
//    
//    [self setValue:@"1111" forKey:@"abc"];
//    [self setValue:nil forKey:@"abc"];
//    
//
//    
//    NSDictionary *dic = @{@"a": @"1",
//                          @"c": @"null",
//                          @"d": @"nil",
//                          @"b": @"<null>"};
//    
//    
//    NSMutableDictionary *mutDic = [NSMutableDictionary dictionary];
//    [mutDic setObject:@"kkk" forKey:@"a"];
//    [mutDic addEntriesFromDictionary:dic];
    
//    [self imageViewTest3];
//    [self scanOtherApp];
//    a++;
//    NSLog(@"a:%zd", a);
//
//    NSInteger b = 10;
//    NSLog(@"%lo", b);
//    NSLog(@"%@", b);
    
//    [self kkkk];
//    
//    [self appIVTest];
//    [self appIVTest];
//    [self appIVTest];
//    [self appIVTest];
    // Do any additional setup after loading the view from its nib.
    
//    NSObject *object1 = [NSObject new];
    
    NSDictionary *dict = nil;
    NSMutableDictionary *dict2 = [NSMutableDictionary dictionaryWithDictionary:dict];
    NSLog(@"dict2:%@", dict2);
    
//    CGFloat ab = 3.2;
//    CGFloat abc = 3.5;
//    CGFloat abcd = 3.6;
//    
//    CGFloat ab_r = [self valueWith:ab];
//    CGFloat abc_r = [self valueWith:abc];
//    CGFloat abcd_r = [self valueWith:abcd];
    
    
    
//    NSString *str1 = NSStringFromClass([self class]);
//    NSString *str2 = @"MainViewController";
//    
//    BOOL b1 = [str1 isEqual:str2];
//    BOOL b2 = [str1 isEqualToString:str2];
//    
//    NSLog(@"b1:%zd, b2:%zd", b1, b2);
    
//    self.view.backgroundColor = [UIColor redColor];
    
//    self.yellowView = [[RXYellowView alloc] initWithFrame:CGRectMake(0, 0, RX_Window_Width, RX_Window_Height)];
//    self.yellowView.backgroundColor = [[UIColor yellowColor] colorWithAlphaComponent:0.3];
//    [[UIApplication sharedApplication].keyWindow addSubview:self.yellowView];
    
    self.functionItems = @[
        @"RVMenu", @"RVRefresh", @"RVRect",
        @"RVScroll", @"RVTrans", @"RVWY",
        @"RVPopupBox", @"RVButton", @"RVUPPay",
        @"RVGCD", @"RVAFNetworking", @"RVAnimation",
        @"RVDebug", @"RVStrongWeakSelf", @"RVViewCycle",
        @"RVRunLoop", @"RVRunLoop2", @"RVRunTime",
        @"RVLock", @"RVUtility", @"RVYYKit",
        @"RVLayer", @"RVOSS", @"RVDUMA",
        @"RVWeb", @"RVStock", @"RVCopy",
        @"RVOCData", @"RVQQ", @"RVThread",
        @"RVTDW", @"RVLLDB", @"RXMethodForward",
        @"RVEventResponseList", @"RXObjectCreate", @"RVGCD2",
        @"RXMRSW", @"RXCurrentQueue", @"RXTargetQueue",
        @"RXQueueSpecial", @"RVAutoRelease", @"RVRTPrint",
        @"RVMsgForward", @"RVAddMethod", @"RVArrayCopy",
        @"RXFramework", @"RXNSObjectForSelector", @"RXMVVMList",
        @"RXMultNotification", @"RXSY", @"RVGCDQueues",
        @"RXUIListPerformance", @"RXCompressWhitSpace", @"RXMVVMLogin",
        @"RXRAC", @"RXMacro", @"RXRACClass",
        @"RXRACDemo", @"RXOCKeywordMethodName", @"RXRACMT",
        @"RXUncaughtExceptionHandler", @"RXOPMQ", @"RXMethodListDemo",
        @"RXAspects", @"RXCLanguage", @"RXAFNetworking",
        @"RXUtil", @"RXLayout", @"RXJLRouter",
        @"RXAnimation", @"RXShellHome", @"RXVolume",
        @"RXVK", @"RXTestManager", @"RXViewLevel",
        @"RXMaskView", @"VKAnimationQueue", @"RXKS",
        @"RXParent", @"RXVRC", @"RXUIAnimation",
        @"RXAppStore", @"RXViewContentMode", @"RXMasonryTest",
        @"RXDirection", @"RXStrangeA", @"RXViewHolder",
        @"RXStrangeXR", @"RXNotificationFirst", @"RXViewVisiable",
        @"RXVisiableTest", @"RXTestManager", @"RXJS",
        @"RXCSJ", @"RVWeb", @"RXGCDHTTPRequestHeaders", @"HeatMap",
        @"RXNote"
    ];
    
    // 数组倒叙
    self.functionItems = [[self.functionItems reverseObjectEnumerator] allObjects];

    NSString *object = self.functionItems.firstObject;
    
//    NSMutableDictionary *dict = [NSMutableDictionary new];
//    [dict setValue:nil forKey:@"abc"];
//    
//    [dict setObject:nil forKey:@"def"];
//    NSLog(@"dict:%@", dict);
    
#if 1

    object = @"RVTDW";
    object = @"RVRunTime";

    object = @"RVLLDB";

//    object = @"RVMsgForward";
//    object = @"RVGCD2";
//    object = @"RVWeb";
//    object = @"RXSY";
    
//    object = @"RXAFNetworking";
//    object = @"RVGCD2";
//    object = @"RXLayout";
//    object = @"RXJLRouter";
//    object = @"RXAnimation";
//    object = @"RXShellHome";
//    object = @"RXVolume";
//    object = @"RXKS";
//        object = @"RXMaskView";
//    object = @"RXParent";
//    object = @"RVWeb";
    object = @"RXVRC";
    
    object = @"RXUIAnimation";
    
    object = @"RXAppStore";
    
    object = @"RXMasonryTest";
    
    object = @"RXJS";
    
    object = @"RXAFNetworking";
    
    
//    object = @"RXTestManager";
    
//    object = @"RXDirection";
    
//    object = @"RXStrangeA";
    
//    object = @"RXViewVisiable";
    
//    object = @"RXVisiableTest";
    
//    object = @"RXNotificationFirst";
    
    object = @"RVWeb";
    
    object = @"RXNote";
    
#endif
    
//    [self performSelector:@selector(gotoExampleVCWithName:) withObject:object afterDelay:1];
//    
//    UIView *tmpView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
//    tmpView.backgroundColor = [UIColor whiteColor];
//    tmpView.layer.shadowOffset = CGSizeMake(0, 0);
//    tmpView.layer.shadowColor = [UIColor redColor].CGColor;
//    tmpView.layer.shadowOpacity = 0.5f;
//    tmpView.layer.shadowRadius = 3;
//    tmpView.layer.cornerRadius = 4;
////    tmpView.layer.masksToBounds = YES;
//    [self.tableView addSubview:tmpView];
    
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_global_queue(0, 0), ^{
//            NSLog(@"111");
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"222");
//        });
//        NSLog(@"333");
//    });
    
}
- (id)reportForScene:(NSString *)scene {
    NSLog(@"123456");
    return scene;
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"_cmd:%@, class:%@", NSStringFromSelector(_cmd), [self class]);
}
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    NSLog(@"_cmd:%@, class:%@", NSStringFromSelector(_cmd), [self class]);
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSLog(@"_cmd:%@, class:%@", NSStringFromSelector(_cmd), [self class]);
}
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    NSLog(@"_cmd:%@, class:%@", NSStringFromSelector(_cmd), [self class]);
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.functionItems.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"abc123";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.textLabel.text = self.functionItems[indexPath.row];
    return cell;
}
#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    NSString *tmp = self.functionItems[indexPath.row];
    [self gotoExampleVCWithName:tmp];
}

- (void)test {
//    dispatch_queue_t queue = dispatch_queue_create("parallel", DISPATCH_QUEUE_CONCURRENT);
//    for (int i = 0; i < 1000000 ; i++) {
//        dispatch_async(queue, ^{
//            self.target = [NSString stringWithFormat:@"ksddkjalkjd%d",i];
//        });
//    }
}

#pragma mark - Private
- (void)gotoExampleVCWithName:(NSString *)name
{
    NSString *clsString = [NSString stringWithFormat:@"rxpage://%@ViewController", name];

    [RXVCMediator pushInNavigationController:self.navigationController withString:clsString query:nil animate:YES];
    
//    RXWeakTestViewController *vc = [RXWeakTestViewController new];
//    NSLog(@"vc:%@", vc);

}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



/*
 
 
 
 #pragma mark - View Life Cycle
 
 
 - (void)viewDidLoad {
 [super viewDidLoad];
 // Do any additional setup after loading the view from its nib.
 
 [self initializeUIAndData];
 [self initializeAction];
 }
 
 
 #pragma mark - initialize UI And Data
 - (void)initializeUIAndData
 {
 
 self.view.backgroundColor = [UIColor redColor];
 }
 - (void)initializeAction
 {
 
 }
 
 

 
 
 */

@end
