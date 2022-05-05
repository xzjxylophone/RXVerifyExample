//
//  RXFrameworkViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/5/14.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXFrameworkViewController.h"
#import "RXMVPGreetingViewController.h"
#import "RXMVPPerson.h"
@interface RXFrameworkViewController ()
@property (nonatomic, copy) NSArray *items;

@end

@implementation RXFrameworkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.items = @[@"RXMVP"];
    
    CGFloat width = [UIScreen mainScreen].bounds.size.width;
    CGFloat subHeight = 40;
    CGFloat start = 100;
    
    NSInteger count = self.items.count;
    for (NSInteger i = 0; i < count; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, start + subHeight * i, width, subHeight)];
        label.textColor = [UIColor blueColor];
        label.textAlignment = NSTextAlignmentCenter;
        label.text = self.items[i];
        label.tag = i;
        [label rx_addGestureRecognizerWithTarget:self action:@selector(labelAction:)];
        [self.view addSubview:label];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)labelAction:(id)sender {
    UITapGestureRecognizer *tgr = sender;
    UIView *view = tgr.view;
    NSInteger tag = view.tag;
//    NSString *text = self.items[tag];
    
    RXMVPPerson *person = [RXMVPPerson new];
    person.firstName = @"111";
    person.lastName = @"222";
    RXMVPGreetingViewController *vc = [[RXMVPGreetingViewController alloc] init];
    RXMVPGreetingPresenter *presenter = [RXMVPGreetingPresenter new];
    [presenter initlization:vc person:person];
    vc.greetingPresenter = presenter;
    
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)gotoExampleVCWithName:(NSString *)name
{
    NSString *clsString = [NSString stringWithFormat:@"rxpage://%@ViewController", name];
    
    [RXVCMediator pushInNavigationController:self.navigationController withString:clsString query:nil animate:YES];
    
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
