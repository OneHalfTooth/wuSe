//
//  MMHomeTabbarView.m
//  WuSeFang
//
//  Created by 马扬 on 16/8/29.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "MMHomeTabbarView.h"

@interface MMHomeTabbarView()



@end

@implementation MMHomeTabbarView

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
    [self createLine];
    [self createLeftButton];
    [self createRightButton];
    [self createCenterButton];
}
- (void)createLine{
    UIView * line = [[UIView alloc]init];
    [self addSubview:line];
    line.backgroundColor = [UIColor whiteColor];
    [line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.left.top.mas_equalTo(0);
        make.height.mas_equalTo(1);
    }];
}
- (void)createLeftButton{
    self.leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.leftButton setImage:[UIImage imageWithName:@"navi_discovery" Size:CGSizeMake(21, 39)] forState:UIControlStateNormal];
    [self addSubview:self.leftButton];
    [self.leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.mas_equalTo(0);
        CGFloat width = ([UIScreen mainScreen].bounds.size.width - 60) / 2.0;
        make.width.mas_equalTo(width);
    }];
}
- (void)createRightButton{
    self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.rightButton setImage:[UIImage imageWithName:@"navi_userCenter" Size:CGSizeMake(21, 39)] forState:UIControlStateNormal];
    [self addSubview:self.rightButton];
    [self.rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.mas_equalTo(0);
        CGFloat width = ([UIScreen mainScreen].bounds.size.width - 60) / 2.0;
        make.width.mas_equalTo(width);
    }];
}
- (void)createCenterButton{
    UIView * view = [[UIView alloc]init];
    [self addSubview:view];
    view.backgroundColor = [UIColor blackColor];
    view.layer.masksToBounds = YES;
    view.layer.cornerRadius = 35.f;
    view.layer.borderColor = [UIColor whiteColor].CGColor;
    view.layer.borderWidth = 1.0f;
    [view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(70);
        make.bottom.mas_equalTo(0);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(70);
    }];
    UIView * fontView = [[UIView alloc]init];
    [self addSubview:fontView];
    fontView.backgroundColor = [UIColor blackColor];
    [fontView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(48);
        make.width.mas_equalTo(70);
        make.centerX.equalTo(self.mas_centerX);
        make.bottom.mas_equalTo(0);
    }];
    self.centerButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.centerButton setImage:[UIImage imageWithName:@"navi_publish" Size:CGSizeMake(50, 50)] forState:UIControlStateNormal];
    [self addSubview:self.centerButton];
    [self.centerButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(-10);
        make.centerX.mas_equalTo(self.mas_centerX);
        make.width.mas_equalTo(50);
        make.height.mas_equalTo(50);
    }];
}
@end
