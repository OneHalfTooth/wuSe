//
//  MMHomeTableView.h
//  WuSeFang
//
//  Created by 马扬 on 16/8/29.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMHomeTableView : UITableView<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,retain)RACSubject * subject;

@property (nonatomic,retain)NSArray * dataSourceArray;

@end
