//
//  MMHomeNavigationView.m
//  WuSeFang
//
//  Created by 马扬 on 16/8/29.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "MMHomeNavigationView.h"

@interface MMHomeNavigationView ()

/** 按钮底部的那条线 */
@property (nonatomic,retain)UIView * bottomLine;


@end

@implementation MMHomeNavigationView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createView];
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}
- (void)createView{
    [self createCenterButton];
    [self createLeftButton];
    [self createRightButton];
    [self createSearchButton];
    [self createBottomLine];
    [self createAction];
}
- (void)createAction{
    __weak typeof(self) weakself = self;
    [[self.centerButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        [weakself buttonDidClick:x];
    }];
    [[self.rightButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        [weakself buttonDidClick:x];
    }];
    [[self.leftButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        [weakself buttonDidClick:x];
    }];
}
- (void)createBottomLine{
    self.bottomLine = [[UIView alloc]init];
    self.bottomLine.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.bottomLine];
    [self.bottomLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(2);
        make.top.mas_equalTo(self.centerButton.mas_bottom);
        make.width.mas_equalTo(60);
        make.left.equalTo(self.centerButton.mas_left);
    }];
}
- (void)createLeftButton{
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.leftButton];
    [self.leftButton setTitle:@"关注" forState:UIControlStateNormal];
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(43);
        make.right.equalTo(self.centerButton.mas_left);
    }];
}
- (void)createRightButton{
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.rightButton];
    [self.rightButton setTitle:@"动态" forState:UIControlStateNormal];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(43);
        make.left.equalTo(self.centerButton.mas_right);
    }];
}
- (void)createCenterButton{
    self.centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self addSubview:self.centerButton];
    [self.centerButton setTitle:@"直播" forState:UIControlStateNormal];
    [self.centerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.width.mas_equalTo(60);
        make.height.mas_equalTo(43);
        make.centerX.equalTo(self.mas_centerX);
    }];
}
- (void)createSearchButton{
    UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageWithName:@"center_search" Size:CGSizeMake(18, 18)] forState:UIControlStateNormal];
    [self addSubview:button];
    [button mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-20);
        make.centerY.equalTo(self.mas_centerY).with.offset(12);
        make.width.mas_equalTo(40);
        make.height.mas_equalTo(40);
    }];
}
- (void)buttonDidClick:(UIButton *)button{
    [UIView animateWithDuration:1 animations:^{
       [self.bottomLine mas_remakeConstraints:^(MASConstraintMaker *make) {
           make.height.mas_equalTo(2);
           make.top.mas_equalTo(button.mas_bottom);
           make.width.mas_equalTo(60);
           make.left.equalTo(button.mas_left);
       }];
        [self.bottomLine layoutIfNeeded];
    }];
}
@end
