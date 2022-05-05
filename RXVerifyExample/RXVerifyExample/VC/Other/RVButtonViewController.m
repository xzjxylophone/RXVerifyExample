//
//  RVButtonViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 16/1/3.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVButtonViewController.h"


@interface RVButtonViewController ()


@property (nonatomic, assign) CGFloat buttonWidth;
@property (nonatomic, assign) CGFloat buttonHeight;
@property (nonatomic, assign) CGFloat buttonX;
@property (nonatomic, assign) CGFloat buttonY;
@property (nonatomic, assign) CGFloat buttonOffset;

@end

@implementation RVButtonViewController

- (void)buttonTouchUpInside:(id)sender
{
    UIButton *button = sender;
    for (UIView *view in button.subviews) {
        NSLog(@"view:%@", view);
    }
}


- (UIButton *)buttonTest
{
    CGFloat width = RX_Window_Width;
    CGFloat buttonHeight = 44;
    CGFloat buttonX = 20;
    CGFloat buttonY = 0;
    CGFloat buttonWidth = width - buttonX * 2;
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(buttonX, buttonY, buttonWidth, buttonHeight);
    button.layer.cornerRadius = 1;
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    
    
    UIImage *image = [[UIColor redColor] rx_imageWithSize:CGSizeMake(24, 24)];
    
    [button setImage:image forState:UIControlStateNormal];
    [button setTitle:@"测试" forState:UIControlStateNormal];
    
    
    
    [button addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    
    return button;
}


- (void)adaptiveAButton:(UIButton *)button
{
    NSArray *views = self.view.subviews;
    CGFloat buttonX = 0;
    CGFloat buttonY = 0;
    if (views.count % 2 == 0) {
        buttonX = self.buttonX;
    } else {
        buttonX = self.buttonX + self.buttonWidth + self.buttonOffset;
    }
    buttonY = self.buttonY + views.count / 2 * (self.buttonHeight + self.buttonOffset);
    
    button.frame = CGRectMake(buttonX, buttonY, self.buttonWidth, self.buttonHeight);
    
    button.layer.cornerRadius = 1;
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = [UIColor grayColor].CGColor;
    
    
    [button addTarget:self action:@selector(buttonTouchUpInside:) forControlEvents:UIControlEventTouchUpInside];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];

    
    [self.view addSubview:button];
}


#pragma mark - initialize UI And Data
- (void)initializeUIAndData
{
    CGFloat width = RX_Window_Width;
    self.buttonX = 30;
    self.buttonY = 30;
    self.buttonOffset = 30;
    self.buttonWidth = (width - self.buttonX * 2 - self.buttonOffset) / 2.0f;
    self.buttonHeight = 44;
    
    UIButton *button0 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self adaptiveAButton:button0];
    
    UIImage *image0 = [[UIColor redColor] rx_imageWithSize:CGSizeMake(24, 24)];
    [button0 setImage:image0 forState:UIControlStateNormal];
    button0.contentEdgeInsets = UIEdgeInsetsMake(0, 5, 0, 0);
    button0.imageEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self adaptiveAButton:button1];
    [button1 setTitle:@"测试" forState:UIControlStateNormal];
    
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self adaptiveAButton:button2];
    UIImage *image2 = [[UIColor redColor] rx_imageWithSize:CGSizeMake(24, 24)];
    [button2 setImage:image2 forState:UIControlStateNormal];
    [button2 setTitle:@"测试" forState:UIControlStateNormal];
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self adaptiveAButton:button3];
    
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self adaptiveAButton:button4];
    
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    [self adaptiveAButton:button5];
    
    


}
- (void)initializeAction
{
    
}


#pragma mark - View Life Cycle


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initializeUIAndData];
    [self initializeAction];
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
