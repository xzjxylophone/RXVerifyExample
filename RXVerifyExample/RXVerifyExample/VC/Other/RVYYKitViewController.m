//
//  RVYYKitViewController.m
//  RXVerifyExample
//
//  Created by ceshi on 16/6/27.
//  Copyright © 2016年 Rush.D.Xzj. All rights reserved.
//

#import "RVYYKitViewController.h"
#import "YYLabel.h"

@interface RVYYKitViewController ()

@end

@implementation RVYYKitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self test_YYLable];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - Private
- (void)test_YYLable
{
    YYLabel *label = [[YYLabel alloc] initWithFrame:CGRectMake(100, 100, 200, 100000)];
    label.text = @"我们一起测试aaa";
    label.verticalForm = YES;
    label.font = [UIFont systemFontOfSize:17];
    label.backgroundColor = [UIColor redColor];
    label.textColor = [UIColor blackColor];
    
    [label sizeToFit];
    
    /*
    UIFont *font = [UIFont systemFontOfSize:17];
    UIColor *textColor = [UIColor blackColor];
    
    NSString *content = label.text;
    
    CGFloat fontSize = font.pointSize;
    NSString *fontName = font.fontName;
    CTFontRef fontRef = CTFontCreateWithName((CFStringRef)fontName, fontSize, NULL);
    CGFloat lineSpace = 0;
    const CFIndex kNumbberOfSettings = 3;
    CTParagraphStyleSetting settings[kNumbberOfSettings] = {
        {kCTParagraphStyleSpecifierLineSpacingAdjustment, sizeof(CGFloat), &lineSpace},
        {kCTParagraphStyleSpecifierMaximumLineSpacing, sizeof(CGFloat), &lineSpace},
        {kCTParagraphStyleSpecifierMinimumLineSpacing, sizeof(CGFloat), &lineSpace},
    };
    
    CTParagraphStyleRef paragraphStyleRef = CTParagraphStyleCreate(settings, kNumbberOfSettings);
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
//    dic[(id)kCTForegroundColorAttributeName] = (id)textColor.CGColor;
//    dic[(id)kCTFontAttributeName] = (__bridge id)fontRef;
    dic[(id)kCTParagraphStyleAttributeName] = (__bridge id)paragraphStyleRef;
    
    CFRelease(paragraphStyleRef);
    CFRelease(fontRef);
    
    if (textColor != nil) {
        dic[(id)kCTForegroundColorAttributeName] = (id)textColor.CGColor;
    }
    if (font != nil) {
        CGFloat fontSize = font.pointSize;
        CTFontRef fontRef = CTFontCreateWithName((CFStringRef)font.fontName, fontSize, NULL);
        dic[(id)kCTFontAttributeName] = (__bridge id)fontRef;
        CFRelease(fontRef);
    }
    NSAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:content attributes:dic];
    
    CTFramesetterRef framesetterRef = CTFramesetterCreateWithAttributedString((CFAttributedStringRef)attributedString);
    // 获得要绘制的区域的高度
    CGSize restrictSize = CGSizeMake(18, CGFLOAT_MAX); // 限制的区域
    CGSize coreTextSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetterRef, CFRangeMake(0, 0), nil, restrictSize, nil);
    CGFloat textHeight = coreTextSize.height;
    
    
    label.frame = CGRectMake(100, 100, coreTextSize.width, textHeight);
    
    
    */
    

//    [label sizeThatFits:CGSizeMake(18, 100000)];
    
//    NSDictionary *attribute = @{NSFontAttributeName:label.font};
//    CGRect tmpRect = [label.text boundingRectWithSize:CGSizeMake(18, 1000000) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading | NSStringDrawingTruncatesLastVisibleLine attributes:attribute context:nil];
//    CGFloat labelWidth = tmpRect.size.width;
//    CGFloat labelHeight = tmpRect.size.height;
//    
//    label.frame = CGRectMake(100, 100, labelWidth, labelHeight);
    
    [self.view addSubview:label];
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
