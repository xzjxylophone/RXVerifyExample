//
//  KSAdInsertScreenViewController.m
//  AFNetworking
//
//  Created by Rush.D.Xzj on 2019/8/12.
//

#import "KSAdInsertScreenViewController.h"
#import "KSAdCountdownView.h"
@interface KSAdInsertScreenViewController ()
@property (nonatomic, strong) KSAdCountdownView *countdownView;
@end

@implementation KSAdInsertScreenViewController

#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.countdownView = [KSAdCountdownView defaultView];
    __weak typeof(self) weakSelf = self;
    self.countdownView.clickCloseBlock = ^{
        [weakSelf buttonTouchUpInside:nil];
    };
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(12, 12, 50, 50);
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:button];
    [self.view addSubview:self.countdownView];
    
    [self.countdownView start];
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    [self.navigationController.navigationBar setHidden:NO];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController.navigationBar setHidden:YES];
}
- (void)buttonTouchUpInside:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
