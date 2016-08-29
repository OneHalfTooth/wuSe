//
//  MMHomeViewController.m
//  WuSeFang
//
//  Created by 马扬 on 16/8/29.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "MMHomeViewController.h"
#import "MMHomeNavigationView.h"
#import "MMHomeTabbarView.h"
#import "MMHomeTableView.h"
#import "MMHomeTableHeaderView.h"
#import "MMHomeTools.h"
#import "MMPlayerViewController.h"

@interface MMHomeViewController ()

@property (nonatomic,retain)MMHomeTabbarView * tabbarView;
@property (nonatomic,retain)MMHomeNavigationView * homeNav;
@property (nonatomic,retain)MMHomeTableView * tableView;

@property (nonatomic,retain)NSDictionary * dataSourceDic;

@end

@implementation MMHomeViewController

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.homeNav.centerButton.enabled = YES;
    __weak typeof(self) weakself = self;
    [[MMHomeTools requestDataFromService] subscribeNext:^(id x) {
        NSInteger stats = [[x objectForKey:@"stat"] integerValue];
        if (stats == 0) {
            weakself.dataSourceDic = x;
            weakself.tableView.dataSourceArray = [[[x objectForKey:@"content"] objectForKey:@"list"] objectForKey:@"channelList"];
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self createView];
    
}
- (void)createView{
    [self createNavigation];
    [self createTableView];
    [self createTabbarView];
    [self createTableViewHeaderView];
    [self createAction];
}
- (void)createAction{
    __weak typeof(self)weakself = self;
    [self.tableView.subject subscribeNext:^(id x) {
        NSLog(@"%@",x);
        
    }];
    MMPlayerViewController * playerVC = [[MMPlayerViewController alloc]init];

}
- (void)createTableViewHeaderView{
    MMHomeTableHeaderView * headerView = [[MMHomeTableHeaderView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 100)];
    self.tableView.tableHeaderView = headerView;
}
- (void)createTableView{
    self.tableView = [[MMHomeTableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.homeNav.mas_bottom);
        make.bottom.equalTo(self.view.mas_bottom).with.offset(-49);
        make.right.left.mas_equalTo(0);
    }];
}
- (void)createTabbarView{
    self.tabbarView = [[MMHomeTabbarView alloc]init];
    [self.view addSubview:self.tabbarView];
    [self.tabbarView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.left.mas_equalTo(0);
        make.height.equalTo(@49);
    }];
}
- (void)createNavigation{
    MMHomeNavigationView * homeNav = [[MMHomeNavigationView alloc]init];
    [self.view addSubview:homeNav];
    [homeNav mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(0);
        make.right.left.mas_equalTo(0);
        make.height.mas_equalTo(64);
    }];
    self.homeNav = homeNav;
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
