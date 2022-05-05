//
//  RXStrangeAViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/5.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXStrangeAViewController.h"
#import "RXStrangeView.h"
#import <Masonry/Masonry.h>
#import "RXStrangeBViewController.h"
@interface RXStrangeAViewController ()

@property (nonatomic, strong) RXStrangeView *strangeView;
@property (nonatomic, strong) UIView *sepView;

@end

@implementation RXStrangeAViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.strangeView];
    [self.view addSubview:self.sepView];
    
    [self.strangeView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(@0);
        make.left.equalTo(@0);
        make.right.equalTo(@0);
        make.height.equalTo(@100);
    }];
    
    self.sepView.frame = CGRectMake(0, 100, [UIScreen mainScreen].bounds.size.width, 100);
    
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark - UI Getter
- (RXStrangeView *)strangeView {
    if (_strangeView == nil) {
        _strangeView = [RXStrangeView new];
        __weak typeof(self) weakSelf = self;
        _strangeView.pushNext = ^{
            RXStrangeBViewController *vc = [[RXStrangeBViewController alloc] initWithView:weakSelf.strangeView];
            [weakSelf.navigationController pushViewController:vc animated:YES];
        };
        _strangeView.popPre = ^{
            [weakSelf.navigationController popViewControllerAnimated:YES];
        };
    }
    return _strangeView;
}
- (UIView *)sepView {
    if (_sepView == nil) {
        _sepView = [UIView new];
        _sepView.backgroundColor = [UIColor yellowColor];
    }
    return _sepView;
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
