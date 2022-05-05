//
//  RXHeatMapView.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2021/12/20.
//  Copyright © 2021 Rush.D.Xzj. All rights reserved.
//

#import "RXHeatMapView.h"

@implementation RXHeatMapView


- (void)loadData {
    NSBundle *sdkBundle = [NSBundle mainBundle];
    NSString *filePath = [[sdkBundle.bundlePath stringByAppendingPathComponent:@"heatMap"] stringByAppendingPathExtension:@"txt"];
    if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]) {
        NSString *content = [[NSString alloc] initWithContentsOfFile:filePath encoding:NSUTF8StringEncoding error:nil];
        NSArray *ary = [content componentsSeparatedByString:@"\n"];
        NSLog(@"ary:%@", ary);
    }
//    return resultDict;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
