//
//  RXCornerRadiusTableViewImpl.m
//  RXVerifyExample
//
//  Created by Rush.D.Xzj on 2018/6/20.
//  Copyright © 2018 Rush.D.Xzj. All rights reserved.
//

#import "RXCornerRadiusTableViewImpl.h"
#import "RXImageCell.h"
@implementation RXCornerRadiusTableViewImpl
- (id)init
{
    if (self = [super init]) {
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    }
    return self;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identify = @"abc123";
    RXImageCell *cell = (RXImageCell *)[tableView dequeueReusableCellWithIdentifier:identify];
    if (cell == nil) {
        cell = [[RXImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    cell.demoImageView.image = [UIImage imageNamed:@"logo250"];
    cell.demoImageView.layer.masksToBounds = YES;
    cell.demoImageView.layer.cornerRadius = 30;
    cell.demoImageView.layer.shadowOffset = CGSizeMake(10, 10);
    return cell;
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [RXImageCell cellHeight];
}
@end







