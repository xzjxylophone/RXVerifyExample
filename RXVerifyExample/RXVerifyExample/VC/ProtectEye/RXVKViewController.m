//
//  RXVKViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/5/23.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXVKViewController.h"
#import "RXFunctionItem.h"
#import "VKProtectEyeManager.h"

// https://www.jianshu.com/p/9373a7e0e34e
@interface RXVKViewController () <UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *funArray;


@property (nonatomic, strong) NSTimer *timer;

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIAlertView *alertView;

@end

@implementation RXVKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NSArray *titleArray = @[@"添加护眼", @"取消护眼", @"添加AlertView",  @"添加AlertController", @"添加ActionSheet", @"添加ActionSheetController", @"添加自定义View到window", @"关闭自定义View到window", @"开启定时器", @"关闭定时器"];
    NSArray *actionArray = @[@"openProtectEye", @"closeProtectEye", @"addAlertView", @"addAlertController", @"addActionSheet", @"addActionSheetController", @"addViewToWindow", @"closeView", @"startTimerAction", @"stopTimerAction"];
    NSMutableArray *ary = [NSMutableArray new];
    for (NSInteger i = 0; i < titleArray.count; i++) {
        RXFunctionItem *item = [RXFunctionItem new];
        item.title = titleArray[i];
        item.action = NSSelectorFromString(actionArray[i]);
        [ary addObject:item];
    }
    
    self.funArray = ary;
    
    self.tableView = [UITableView new];
    self.tableView.frame = CGRectMake(0, 0, RX_Window_Width, RX_Window_Height);
    self.tableView.tableFooterView = [UIView new];
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:self.tableView];
    
    
    
    
    
}

#pragma mark - Action

- (void)timerAction {
//    if (self.alertView) {
//        UIView *view = self.alertView.superview;
//        NSLog(@"11");
//    }
//    UIInputSetContainerView
    NSArray *windows = [UIApplication sharedApplication].windows;
    NSLog(@"----------------");
    for (NSInteger i = 0; i < windows.count; i++) {
        UIWindow *window = windows[i];
        NSArray *views = window.subviews;
        NSLog(@"window index:%ld, windowlevel:%.1f, isKey:%d, window.subviews.count:%ld", i, window.windowLevel, window.isKeyWindow, views.count);
        for (NSInteger j = 0; j < views.count; j++) {
            UIView *view = views[j];
            NSLog(@"view index:%ld, view class:%@", j, [view class]);
        }
    }
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    RXFunctionItem *item = self.funArray[indexPath.row];
    if ([self respondsToSelector:item.action]) {
        
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [self performSelector:item.action];
#pragma clang diagnostic pop
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.funArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identify = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    RXFunctionItem *item = self.funArray[indexPath.row];
    cell.textLabel.text = item.title;
    cell.backgroundColor = [UIColor clearColor];
    cell.contentView.backgroundColor = [UIColor clearColor];
    cell.textLabel.textColor = [UIColor blackColor];
    return cell;
}

#pragma mark - Action
- (void)openProtectEye {
    [[VKProtectEyeManager sharedInstance] open];
}
- (void)closeProtectEye {
    [[VKProtectEyeManager sharedInstance] close];
}
- (void)addAlertView {
    UIAlertView *av = [[UIAlertView alloc] initWithTitle:@"提示" message:[self getDateString] delegate:nil cancelButtonTitle:@"取消" otherButtonTitles:@"确定", nil];
    self.alertView = av;
    [av show];
}
- (void)addAlertController {
    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"提示" message:[self getDateString] preferredStyle:UIAlertControllerStyleAlert];
    [ac addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击取消");
    }]];
    [ac addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"点击确认");
    }]];
    [self presentViewController:ac animated:YES completion:nil];
    
}
- (void)addActionSheet {
    UIActionSheet *as = [[UIActionSheet alloc] initWithTitle:[self getDateString] delegate:nil cancelButtonTitle:@"取消" destructiveButtonTitle:@"红色按钮" otherButtonTitles:@"确定1", @"确定2", nil];
    [as showInView:self.view];
}
- (void)addActionSheetController {
    // https://blog.csdn.net/wei78008023/article/details/86150431  好坑啊
//    UIAlertController *ac = [UIAlertController alertControllerWithTitle:@"提示" message:[self getDateString] preferredStyle:UIAlertControllerStyleActionSheet];
//    [ac addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"点击取消");
//    }]];
//    [ac addAction:[UIAlertAction actionWithTitle:@"确定1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"点击确认1");
//    }]];
//    [ac addAction:[UIAlertAction actionWithTitle:@"确定2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"点击确认2");
//    }]];
//    [self presentViewController:ac animated:YES completion:nil];
}
- (void)addViewToWindow {
    [self closeView];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 500, 100)];
    label.backgroundColor = [UIColor whiteColor];
    label.layer.borderWidth = 1.0f;
    label.layer.borderColor = [UIColor blackColor].CGColor;
    label.text = [self getDateString];
    self.label = label;
    [[UIApplication sharedApplication].keyWindow addSubview:label];
}
- (void)closeView {
    [self.label removeFromSuperview];
    self.label = nil;
}
- (void)startTimerAction {
    [self stopTimerAction];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(timerAction) userInfo:nil repeats:YES];
}
- (void)stopTimerAction {
    [self.timer invalidate];
    self.timer = nil;
}

#pragma mark - Private

- (NSString *)getDateString {
    NSDate *date = [NSDate new];
    NSDateFormatter *df = [NSDateFormatter new];
    df.dateFormat = @"yyyy-MM-dd HH:mm:ss SSS";
    return [df stringFromDate:date];
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
