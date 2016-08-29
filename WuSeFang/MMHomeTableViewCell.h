//
//  MMHomeTableViewCell.h
//  WuSeFang
//
//  Created by 马扬 on 16/8/29.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMHomeLiveModel.h"

@interface MMHomeTableViewCell : UITableViewCell

- (void)updateController:(MMHomeLiveModel *)dic;

@end
