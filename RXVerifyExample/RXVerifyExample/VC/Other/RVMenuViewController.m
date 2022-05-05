//
//  RVMenuViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 15/12/9.
//  Copyright © 2015年 Rush.D.Xzj. All rights reserved.
//

#import "RVMenuViewController.h"
#import "RXMenuItemView.h"
#import "RXMenuView.h"
@interface RVMenuViewController ()<RXMenuViewDelegate>

@end

@implementation RVMenuViewController


#pragma mark - RXMenuViewDelegate
- (void)rxMenuView:(RXMenuView *)menu didSelectIndex:(NSInteger)index
{
    NSLog(@"index:%zd", index);
}


#pragma mark - View Life Cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //    self.view.backgroundColor = [UIColor redColor];
    
    
    
    UIImage *bgImage = [UIImage imageNamed:@"bg_menuitem"];
    UIImage *highlightedBgImage = [UIImage imageNamed:@"bg_menuitem_h"];
    UIImage *contentImage = [UIImage imageNamed:@"icon_star"];
    RXMenuItemView *item0 = [[RXMenuItemView alloc] initWithImage:bgImage highlightedImage:highlightedBgImage contentImage:contentImage highlightedContentImage:nil];
    RXMenuItemView *item1 = [[RXMenuItemView alloc] initWithImage:bgImage highlightedImage:highlightedBgImage contentImage:contentImage highlightedContentImage:nil];
    RXMenuItemView *item2 = [[RXMenuItemView alloc] initWithImage:bgImage highlightedImage:highlightedBgImage contentImage:contentImage highlightedContentImage:nil];
    RXMenuItemView *item3 = [[RXMenuItemView alloc] initWithImage:bgImage highlightedImage:highlightedBgImage contentImage:contentImage highlightedContentImage:nil];
    RXMenuItemView *item4 = [[RXMenuItemView alloc] initWithImage:bgImage highlightedImage:highlightedBgImage contentImage:contentImage highlightedContentImage:nil];
    RXMenuItemView *item5 = [[RXMenuItemView alloc] initWithImage:bgImage highlightedImage:highlightedBgImage contentImage:contentImage highlightedContentImage:nil];
    NSArray *menus = @[item0, item1, item2, item3, item4, item5];
    RXMenuView *menuView = [[RXMenuView alloc] initWithFrame:[UIScreen mainScreen].bounds menus:menus];
    menuView.delegate = self;
    [self.view addSubview:menuView];
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
