//
//  RXTestManagerViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/4.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXTestManagerViewController.h"
#import "RXSelfRequestManager.h"
#import "RXClassExtensionManager.h"
#import "RXThreadMemoryManager.h"
#import "VKDownloadTestManager.h"
#import "RXStaticManager.h"
#import "RXPCQueueBufferManager.h"
#import "RXSortManager.h"
#import "RXSignalManager.h"
#import "RXTestManagerViewController+Extension.h"

#import "RXAssociateManager.h"
#import "RXDateManager.h"
#import "RXPrivateApiManager.h"
#import "RXTestMulThreadMutableDataManager.h"
#import "RXWeakPropertyManager.h"
#import "RXMultThreadManager.h"
@interface RXAAAA : NSObject
@end

@implementation RXAAAA
+ (id)array {
    return [[NSMutableArray alloc] init];
}
+ (void)test1 {
//    __strong id value = [RXAAAA array];
}
+ (void)test2 {
    __weak id value = [RXAAAA array];
    NSLog(@"value:%@", value);
}
+ (void)test3 {
//    __autoreleasing id value = [RXAAAA array];
}
+ (void)test4 {
//    __unsafe_unretained id value = [RXAAAA array];
}
+ (void)test5 {
    @autoreleasepool {
//        __autoreleasing id value = [RXAAAA array];
    }
}
@end


@interface RXTestManagerViewController()

@property (nonatomic, assign) NSInteger def;

@end


@implementation RXTestManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.abc = 10;
    self.def = 20;
    
//    [RXAAAA test2];
    
    NSLog(@"abc:%zd", self.abc);
    NSLog(@"def:%zd", self.def);
    
    // Do any additional setup after loading the view.
//    [[RXSelfRequestManager sharedInstance] test];
    
//    [[RXClassExtensionManager sharedInstance] test];
    
//    [[RXThreadMemoryManager sharedInstance] test];
    
//    [[VKDownloadTestManager sharedInstance] test];
    
//    [[RXStaticManager sharedInstance] test];
    
//    [[RXPCQueueBufferManager sharedInstance] test];
//    [[RXSortManager sharedInstance] test];
    
//    [[RXSignalManager sharedInstance] test];
    
//    [[RXDateManager sharedInstance] test];
    
//    [[RXAssociateManager sharedInstance] test];
    
//    [[RXPrivateApiManager sharedInstance] test];
//    [[RXTestMulThreadMutableDataManager sharedInstance] test];
    
//    [[RXWeakPropertyManager sharedInstance] test];
    [[RXMultThreadManager sharedInstance] test];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
