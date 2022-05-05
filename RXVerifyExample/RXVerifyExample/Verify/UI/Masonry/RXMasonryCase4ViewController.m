//
//  RXMasonryCase4ViewController.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2019/12/25.
//  Copyright © 2019 Rush.D.Xzj. All rights reserved.
//

#import "RXMasonryCase4ViewController.h"
#import <Masonry/Masonry.h>
#import "RXMasonryCase4Cell.h"
#import "RXMasonryCase4Entity.h"

// 注释掉下面的宏定义，就是用“传统”的模板Cell计算高度
//#define IOS_8_NEW_FEATURE_SELF_SIZING

@interface RXMasonryCase4ViewController () <UITableViewDelegate, UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;



@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation RXMasonryCase4ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.tableView.estimatedRowHeight = 80.0f;

#ifdef IOS_8_NEW_FEATURE_SELF_SIZING
    // iOS 8 的Self-sizing特性
    if ([UIDevice currentDevice].systemVersion.integerValue > 7) {
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        NSLog(@"UITableViewAutomaticDimension:%.5f", UITableViewAutomaticDimension);
    }
#endif

    // 注册Cell
    [self.tableView registerClass:[RXMasonryCase4Cell class] forCellReuseIdentifier:NSStringFromClass([RXMasonryCase4Cell class])];
    [self generateData];
    [self.tableView reloadData];
}


#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RXMasonryCase4Cell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RXMasonryCase4Cell class]) forIndexPath:indexPath];
    [cell setupData:self.dataArray[(NSUInteger) indexPath.row]];
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 150;
    #ifdef IOS_8_NEW_FEATURE_SELF_SIZING
        // iOS 8 的Self-sizing特性
        return UITableViewAutomaticDimension;
    #else
        static RXMasonryCase4Cell *tmpCell;
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            tmpCell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([RXMasonryCase4Cell class])];
        });
        // 获取对应的数据
        RXMasonryCase4Entity *dataEntity = self.dataArray[(NSUInteger) indexPath.row];
        // 判断高度是否已经计算过
        if (dataEntity.cellHeight <= 0) {
            // 填充数据
            [tmpCell setupData:dataEntity];
            // 根据当前数据，计算Cell的高度，注意+1
            dataEntity.cellHeight = [tmpCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize].height + 1;
            NSLog(@"Calculate: %ld, height: %g", (long) indexPath.row, dataEntity.cellHeight);
        } else {
            NSLog(@"Get cache: %ld, height: %g", (long) indexPath.row, dataEntity.cellHeight);
        }
        return dataEntity.cellHeight;
    #endif
}
#pragma mark - Private
- (NSString *)getText:(NSString *)text withRepeat:(int)repeat {
    NSMutableString *tmpText = [NSMutableString new];
    for (int i = 0; i < repeat; i++) {
        [tmpText appendString:text];
    }
    return tmpText;
}

// 生成数据
- (void)generateData {
    NSMutableArray *dataArray = [NSMutableArray new];
    for (int i = 0; i < 20; i++) {
        RXMasonryCase4Entity *dataEntity = [RXMasonryCase4Entity new];
        dataEntity.avatar = [UIImage imageNamed:[NSString stringWithFormat:@"bluefaces_%d", (i % 4) + 1]];
        dataEntity.title = [NSString stringWithFormat:@"Title: %d", i];
        dataEntity.content = [self getText:@"content-" withRepeat:i * 2 + 1];
        [dataArray addObject:dataEntity];
    }
    self.dataArray = dataArray;
}

@end
