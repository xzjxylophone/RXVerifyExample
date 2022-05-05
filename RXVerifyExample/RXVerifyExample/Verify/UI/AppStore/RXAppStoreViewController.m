//
//  RXAppStoreViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/10/21.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXAppStoreViewController.h"
#import <StoreKit/StoreKit.h>
#import "RXAppStorePopViewController.h"
#import "RVWebViewController.h"
@interface RXAppStoreViewController () <SKStoreProductViewControllerDelegate>

@property (nonatomic, strong) SKStoreProductViewController *storeViewController;
@property (nonatomic, strong) UIViewController *vc;

@end

@implementation RXAppStoreViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
    self.view.backgroundColor = [UIColor redColor];
    
    [self.view rx_addGestureRecognizerWithTarget:self action:@selector(viewAction)];
    
}
- (void)viewAction {
    UINavigationController *nc = self.navigationController;
    UINavigationController *nc2 = self.navigationController.navigationController;
    
    NSLog(@"nc1:%@, nc2:%@", nc, nc2);
    
    [self testWeb];
//    [self testAppStore];
    
//    [self testAppStore2];
    
//    self.navigationController.navigationBar.translucent = NO;
    
//    [self testA];
}
- (void)testWeb {
    if (self.vc == nil) {
        self.vc = [RVWebViewController new];
    }
    [self.navigationController pushViewController:self.vc animated:YES];
}

- (void)testA {
    if (self.vc == nil) {
        
        RXAppStorePopViewController *vc = [[RXAppStorePopViewController alloc] init];
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
        
        BOOL a1 = nc.definesPresentationContext;
        BOOL a2 = vc.definesPresentationContext;
        self.vc = nc;
        
    }
    __weak __typeof__(self) weakSelf = self;
    [self presentViewController:self.vc animated:YES completion:^{
        UIViewController *vc1 = weakSelf.vc.presentingViewController;
        UIViewController *vc2 = weakSelf.vc.presentedViewController;
        UIViewController *vc3 = weakSelf.presentingViewController;
        UIViewController *vc4 = weakSelf.presentedViewController;
        NSLog(@"3333");
        
    }];
    
}


- (void)testAppStore2 {
    NSString *appId = @"1475058355";
    
    if (self.storeViewController == nil) {
        SKStoreProductViewController *storeViewController = [[SKStoreProductViewController alloc] init];
        storeViewController.delegate = self;
        
        self.storeViewController = storeViewController;
        __weak __typeof__(self) weakSelf = self;
        
    } else {
        
        //        [[UINavigationBar appearance] setTintColor:[UIColor purpleColor]];
        //        [self.storeViewController viewDidLayoutSubviews];
    }
    
    [self presentViewController:self.storeViewController animated:YES completion:^{
        NSLog(@"3333");
    }];
    
    NSDictionary *parameters = @{SKStoreProductParameterITunesItemIdentifier:appId};
    [self.storeViewController loadProductWithParameters:parameters completionBlock:^(BOOL result, NSError *error) {
        NSLog(@"1111 result:%@ %@", result ? @"YES" : @"NO", error);
        //            weakSelf.storeViewController = storeViewController;
    }];
    
}

- (void)testAppStore {
    NSString *appId = @"1475058355";
    
    if (self.storeViewController == nil) {
        SKStoreProductViewController *storeViewController = [[SKStoreProductViewController alloc] init];
        storeViewController.delegate = self;
        
        self.storeViewController = storeViewController;
        __weak __typeof__(self) weakSelf = self;
        
        NSDictionary *parameters = @{SKStoreProductParameterITunesItemIdentifier:appId};
        [self.storeViewController loadProductWithParameters:parameters completionBlock:^(BOOL result, NSError *error) {
            NSLog(@"1111 result:%@ %@", result ? @"YES" : @"NO", error);
            //            weakSelf.storeViewController = storeViewController;
        }];
        
    } else {
        
//        [[UINavigationBar appearance] setTintColor:[UIColor purpleColor]];
//        [self.storeViewController viewDidLayoutSubviews];
    }
    
    [self presentViewController:self.storeViewController animated:YES completion:^{
        NSLog(@"3333");
    }];
    
    
}

#pragma mark - SKStoreProductViewControllerDelegate
- (void)productViewControllerDidFinish:(SKStoreProductViewController *)viewController {
    NSLog(@"2222:%@", NSStringFromClass([viewController class]));
    
    BOOL beingPresented = viewController.beingPresented;
    NSLog(@"6666 beingPresented:%@", beingPresented ? @"YES" : @"NO");
    // 这里得要调用一下
    BOOL inWindow = viewController.isViewLoaded && viewController.view.window;
    NSLog(@"5555 inWindow:%@", inWindow ? @"YES" : @"NO");
    [viewController dismissViewControllerAnimated:YES completion:^{
        NSLog(@"44444");
    }];
}
@end
