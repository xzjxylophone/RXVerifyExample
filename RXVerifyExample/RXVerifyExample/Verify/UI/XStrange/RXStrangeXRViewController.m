//
//  RXStrangeXRViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/13.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXStrangeXRViewController.h"
#import "RXStrangeXRPlayerView.h"
#import "RXStrangeXRBottomView.h"
#import <Masonry/Masonry.h>
@interface RXStrangeXRViewController ()

@property (nonatomic, strong) RXStrangeXRPlayerView *playerView;

@property (nonatomic, strong) RXStrangeXRBottomView *bottomView;


@end

@implementation RXStrangeXRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.playerView = [RXStrangeXRPlayerView new];
    self.bottomView  = [RXStrangeXRBottomView new];
    
    [self.view addSubview:self.playerView];
    [self.view addSubview:self.bottomView];
    
    [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.top.equalTo(@0);
    }];
    
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(@0);
        make.height.equalTo(@86);
    }];
    
    
    NSURL *url = [NSURL URLWithString:@"http://vfx.mtime.cn/Video/2019/03/12/mp4/190312083533415853.mp4"];
    url = [NSURL URLWithString:@"http://txmov2.a.yximgs.com/upic/2019/09/18/15/BMjAxOTA5MTgxNTUxNTJfMTQ5ODMwODc2OF8xNzYwNjEzNjg3OF8wXzM=_b_B7c40c649e4681a256247b5d1328af5c7.mp4?tag=1-1572487517-unknown-0-opkt7csk1v-dfdc6647a552aee6&type=hot"];
    [self.playerView setURL:url];
    
    [self.playerView play];
    

//    self.bottomView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    self.bottomView.backgroundColor = [[UIColor greenColor] colorWithAlphaComponent:0.7];
//    self.bottomView.backgroundColor = [UIColor blackColor];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
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
