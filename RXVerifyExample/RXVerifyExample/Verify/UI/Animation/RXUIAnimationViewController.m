//
//  RXUIAnimationViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/9/28.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXUIAnimationViewController.h"
#import "UIView+RXUtility.h"

@interface RXUIAnimationViewController ()

@property (nonatomic, strong) UIView *animationView;

@property (nonatomic, assign) BOOL expand;

@end

@implementation RXUIAnimationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // https://blog.csdn.net/yang2735/article/details/39008381
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.animationView = [[UIView alloc] initWithFrame:CGRectMake(100, 200, 200, 200)];
    self.animationView.backgroundColor = [UIColor redColor];
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 150, 100)];
    v1.backgroundColor = [UIColor greenColor];
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(0, 100, 150, 100)];
    v2.backgroundColor = [UIColor blueColor];
    
    [self.animationView addSubview:v1];
    [self.animationView addSubview:v2];
    self.animationView.clipsToBounds = YES;
    
    
    [self.view rx_addGestureRecognizerWithTarget:self action:@selector(viewAction)];
    [self.view addSubview:self.animationView];
}

- (void)viewAction {
    self.expand = !self.expand;
}

- (void)setExpand:(BOOL)expand {
    _expand = expand;
    
    if (expand) {
        [UIView animateWithDuration:1 animations:^{
            self.animationView.rx_top = 200;
            self.animationView.rx_height = 200;
        } completion:^(BOOL finished) {
            
        }];
    } else {
        
        [UIView animateWithDuration:1 animations:^{
            self.animationView.rx_top = 300;
            self.animationView.rx_height = 100;
        } completion:^(BOOL finished) {
            
        }];
        
    }
    
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
