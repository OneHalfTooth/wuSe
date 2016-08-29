//
//  MMHomeTableViewCell.m
//  WuSeFang
//
//  Created by 马扬 on 16/8/29.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "MMHomeTableViewCell.h"

@interface MMHomeTableViewCell ()

@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLable;
@property (weak, nonatomic) IBOutlet UILabel *statNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *userAddressLabel;
@property (weak, nonatomic) IBOutlet UILabel *onLineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *mainImageView;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UILabel *desLabel;


@end

@implementation MMHomeTableViewCell

- (void)updateController:(MMHomeLiveModel *)dic{
    [self.userImageView sd_setImageWithURL:[NSURL URLWithString:dic.userHeadUrl]];
    self.userNameLable.text = dic.userNickName;
    [self.mainImageView sd_setImageWithURL:[NSURL URLWithString:dic.userBigHeadUrl]];
    self.statNumberLabel.text = [NSString stringWithFormat:@"%ld",dic.userClass];
    self.onLineLabel.text = [NSString stringWithFormat:@"%ld在线",dic.onlineNum];
    self.userAddressLabel.text = dic.userArea;
    self.contentLabel.text = dic.userDescript;
}


- (void)awakeFromNib {
    [super awakeFromNib];
    self.desLabel.layer.masksToBounds = YES;
    self.desLabel.layer.cornerRadius = 20.f;
    self.desLabel.alpha = 0.6;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
