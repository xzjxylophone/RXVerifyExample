//
//  RVLayerViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/6/27.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVLayerViewController.h"

@interface RVLayerViewController ()

@end

@implementation RVLayerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self testLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



- (void)testLayer
{
    CGFloat width = RX_Window_Width;
    CGFloat height = RX_Window_Height - 64;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.frame = CGRectMake(0, 0, width, height);
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    //  设置虚线颜色为blackColor
    shapeLayer.strokeColor = [UIColor blackColor].CGColor;
    //  设置虚线宽度
    shapeLayer.lineWidth = 8.0f;
    shapeLayer.lineJoin = kCALineJoinRound;
//    shapeLayer.lineCap = kCALineCapSquare;
    //  设置线宽，线间距
    shapeLayer.lineDashPattern = @[@(0.5), @(0.25)];
    //  设置路径
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 0, 100);
    CGPathAddLineToPoint(path, NULL, width, 100);
    CGPathAddLineToPoint(path, NULL, width - 10, 200);
    [shapeLayer setPath:path];
    CGPathRelease(path);
    //  把绘制好的虚线添加上来
    [self.view.layer addSublayer:shapeLayer];
    
}


@end
