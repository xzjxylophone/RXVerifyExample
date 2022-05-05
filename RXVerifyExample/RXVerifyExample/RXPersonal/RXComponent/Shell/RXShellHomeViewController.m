//
//  RXShellHomeViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/3/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXShellHomeViewController.h"
#import "RXComponentRoute.h"
@interface RXShellHomeViewController ()
@property (nonatomic, strong) NSArray *array;
@end

@implementation RXShellHomeViewController


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.array.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identify = @"cellIdentify";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
        cell.textLabel.text = self.array[indexPath.row];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UIViewController *vc = [RXComponentRoute routeViewController:@"asdk://AHomeVC?a=1&b=2&c=3" params:@{@"akey": @"11111"}];
    [self.navigationController pushViewController:vc animated:YES];
    
    
//    UIViewController *vc = [RXComponentRoute routeViewController:@"asdk://errorVC" params:@{@"akey": @"11111"}];
//    [self.navigationController pushViewController:vc animated:YES];
    
    
    id value = [RXComponentRoute routeDataSync:@"asdk://syncData?aaa=1&bbb=2&ccc=3" params:@{@"akey": @"11111"}];
    NSLog(@"value:%@", value);
    
    [RXComponentRoute routeDataAsync:@"asdk://asyncData?aaaaa=1&bbbbb=2&ccccc=3" params:@{@"akey": @"11111"} competion:^(NSDictionary *result) {
        NSLog(@"result:%@", result);
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *components = @[@"RXErrorSDK", @"RXASDK", @"RXBSDK", @"RXCSDK"];
    [RXComponentRoute setupWithComponents:components];
    [self _asyn_update_strategyList];
    
    self.array = @[@"AHome", @"BHome", @"CHome"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private
- (void)_asyn_update_strategyList {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 3 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{
        NSString *str1 = @"asdk://AHomeVC?redirect=bsdk://BHomeVC"; // 定位的BHomeVC
        NSString *str2 = @"asdk://AHomeVC?redirect=error://route"; // 定位到error
        NSString *strRedirectCancel = @"asdk://AHomeVC"; // 取消重定向
        NSArray *strategyList = @[str1, str2, strRedirectCancel];
        [RXComponentRoute updateStrategy:strategyList];
    });
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
