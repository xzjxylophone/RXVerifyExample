//
//  RXMaskViewViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/6/21.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMaskViewViewController.h"

@interface RXMaskViewViewController ()
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic, assign) CGFloat imageWidth;
@property (nonatomic, assign) CGFloat imageHeight;

@end

@implementation RXMaskViewViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *image = [UIImage imageNamed:@"logo250"];
    self.imageWidth = 300;
    self.imageHeight = 200;
    
    self.bgView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, self.imageWidth, self.imageHeight)];
    self.bgView.backgroundColor = [UIColor blackColor];
    
    self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(100, 100, self.imageWidth, self.imageHeight)];
    self.imageView.image = image;
    
    
    [self.view addSubview:self.bgView];
    [self.view addSubview:self.imageView];
    
//    [self test1];
//    [self test2];
//    [self test3];
    [self test4];
}

- (CGRect)layerFrame {
    CGFloat squareWidth = MIN(self.imageWidth, self.imageHeight);
    CGFloat x = (self.imageWidth - squareWidth) / 2.0f;
    CGFloat y = (self.imageHeight - squareWidth) / 2.0f;
    return CGRectMake(x, y, squareWidth, squareWidth);
}

- (CAShapeLayer *)triangleShapeLayer {
    CGRect layerFrame = [self layerFrame];
    CGFloat width = layerFrame.size.width;
    CGFloat halfWidth = width / 2.0;
    CGFloat x = layerFrame.origin.x;
    CGFloat y = layerFrame.origin.y;
    
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, x, halfWidth + y);
    CGPathAddLineToPoint(path, NULL, x + width, 0 + y);
    CGPathAddLineToPoint(path, NULL, x + width, width + y);
    CGPathAddLineToPoint(path, NULL, x, halfWidth + y);
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.bounds = CGRectMake(0, 0, width, width);
    shapeLayer.fillColor = [[UIColor purpleColor] CGColor];
    shapeLayer.position = CGPointMake(halfWidth, halfWidth);
    shapeLayer.path = path;
    return shapeLayer;
}
- (CAShapeLayer *)circleShapeLayer {
    CGRect layerFrame = [self layerFrame];
    CGFloat width = layerFrame.size.width;
    CGFloat halfWidth = width / 2.0;
    CGSize newSize = layerFrame.size;
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:layerFrame byRoundingCorners:UIRectCornerAllCorners cornerRadii:newSize];
    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.bounds = CGRectMake(0, 0, width, width);
    shapeLayer.fillColor = [[UIColor purpleColor] CGColor];
    shapeLayer.position = CGPointMake(halfWidth, halfWidth);
    shapeLayer.path = path.CGPath;
    return shapeLayer;
}


- (void)test1 {
    CAShapeLayer *shapeLayer = [self triangleShapeLayer];
    [self.imageView.layer addSublayer:shapeLayer];
}
- (void)test2 {
    CAShapeLayer *shapeLayer = [self triangleShapeLayer];
    self.imageView.layer.mask = shapeLayer;
}
- (void)test3 {
    CAShapeLayer *shapeLayer = [self circleShapeLayer];
    [self.imageView.layer addSublayer:shapeLayer];
}
- (void)test4 {
    CAShapeLayer *shapeLayer = [self circleShapeLayer];
    self.imageView.layer.mask = shapeLayer;
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
