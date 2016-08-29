//
//  MMHomeTableView.m
//  WuSeFang
//
//  Created by 马扬 on 16/8/29.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "MMHomeTableView.h"
#import "MMHomeTableViewSectionHeaderView.h"
#import "MMHomeTableViewCell.h"
#import "MMHomeLiveModel.h"


@implementation MMHomeTableView

-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style{
    self = [super initWithFrame:frame style:style];
    if (self) {
        self.dataSource = self;
        self.delegate = self;
        [self registerNib:[UINib nibWithNibName:@"MMHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"MMHomeTableViewCell"];
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSourceArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MMHomeTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"MMHomeTableViewCell"];
    NSDictionary * dic = [self.dataSourceArray objectAtIndex:indexPath.row];
    MMHomeLiveModel * model = [MMHomeLiveModel yy_modelWithJSON:dic];
    [cell updateController:model];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath{
    return 447.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 40.f;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1f;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    MMHomeTableViewSectionHeaderView * headerView = [[MMHomeTableViewSectionHeaderView alloc]initWithFrame:CGRectMake(0, 0, self.bounds.size.width, 40)];
    return headerView;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSDictionary * dic = [self.dataSourceArray objectAtIndex:indexPath.row];
    MMHomeLiveModel * model = [MMHomeLiveModel yy_modelWithJSON:dic];
    [self.subject sendNext: model];
}


-(void)setDataSourceArray:(NSArray *)dataSourceArray{
    _dataSourceArray = dataSourceArray;
    [self reloadData];
}
@end
