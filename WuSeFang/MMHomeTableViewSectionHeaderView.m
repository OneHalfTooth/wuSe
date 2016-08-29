
//
//  MMHomeTableViewSectionHeaderView.m
//  WuSeFang
//
//  Created by 马扬 on 16/8/29.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "MMHomeTableViewSectionHeaderView.h"

@implementation MMHomeTableViewSectionHeaderView

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

- (void)createView{
    UIImageView * imageView = [[UIImageView alloc]init];
    [self addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.mas_centerY);
        make.height.width.mas_equalTo(20);
        make.left.mas_equalTo(20);
    }];
    imageView.image = [UIImage imageNamed:@"living_list_headView_icon"];
    UILabel * titleLabel = [[UILabel alloc]init];
    titleLabel.text = @"热门直播";
    titleLabel.font = [UIFont systemFontOfSize:16];
    titleLabel.textColor = [UIColor colorWithRed:180 / 255.0 green:180 / 255.0 blue:180 / 255.0 alpha:1];
    [self addSubview:titleLabel];
    [titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(imageView.mas_right).with.offset(10);
        make.width.height.mas_greaterThanOrEqualTo(2);
        make.centerY.equalTo(imageView.mas_centerY);
    }];
}
@end
