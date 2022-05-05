//
//  RXMasonryTestViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/24.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryTestViewController.h"
#import "RXMasonryCaseObject.h"


// http://tutuge.me/tags/Masonry/
// https://www.sunyazhou.com/2019/09/26/20190926MasonryPanViewDemo/





@interface RXMasonryTestViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) IBOutlet UITableView *tableView;

@property (nonatomic, copy) NSArray *dataArray;

@end

@implementation RXMasonryTestViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    NSArray *ary = @[
        @"抗拉伸与抗压缩", @"几个View整体居中，可以任意显示、隐藏", @"子View的宽度始终是父级View的一半（或者任意百分比）",
        @"变高UITableViewCell", @"topLayoutGuide和bottomLayoutGuide", @"自定义baseline",
        @"Parallax Header", @"动态变高度的UITableViewCell", @"两种方式实现等间距",
        @"用约束优先级保证可移动View的内容可见性", @"Autolayout的约束=控件间位置关系的“动态绑定”", @"利用layoutIfNeeded控制约束的生效时机",
        @"UITableViewCell中多个变高的Label", @"StairView自定义View实现intrinsicContentSize", @"给同一个属性添加多重约束，实现复杂关系",
        @"旷量移动"
    ];
    NSMutableArray *dataArray = [NSMutableArray new];
    for (NSInteger i = 0; i < ary.count; i++) {
        RXMasonryCaseObject *obj = [RXMasonryCaseObject new];
        obj.index = i;
        obj.subTitle = ary[i];
        [dataArray addObject:obj];
    }
    self.dataArray = dataArray;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self _gotoVCWithIndex:15];
    });
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *clsStr = @"UITableViewCell";
    UITableViewCell *cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:clsStr];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:clsStr];
    }
    RXMasonryCaseObject *obj = self.dataArray[indexPath.row];
    cell.textLabel.text = obj.title;
    cell.detailTextLabel.text = obj.subTitle;
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self _gotoVCWithIndex:indexPath.row];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

#pragma mark - Private
- (void)_gotoVCWithIndex:(NSInteger)index {
    if (index >= self.dataArray.count) {
        return;
    }
    RXMasonryCaseObject *obj = self.dataArray[index];
    Class cls = NSClassFromString(obj.caseViewControllerClassString);
    if (cls != nil) {
        UIViewController *vc = [cls new];
        if (index == 4) {
            UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
            [self.navigationController presentViewController:nc animated:YES completion:nil];
        } else {
            [self.navigationController pushViewController:vc animated:YES];
        }
    }
}
@end
