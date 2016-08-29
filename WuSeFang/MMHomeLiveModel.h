//
//  MMHomeLiveModel.h
//  WuSeFang
//
//  Created by 马扬 on 16/8/29.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MMHomeLiveModel : NSObject








@property (nonatomic,retain)NSString * channelId;
@property (nonatomic,retain)NSString * channelName;
@property (nonatomic,retain)NSString * endTime;
@property (nonatomic,assign)NSInteger likeNum;
@property (nonatomic,assign)NSInteger lookNum;
@property(nonatomic,assign)NSInteger onlineNum;
@property(nonatomic,assign)NSInteger redNum;
@property (nonatomic,assign)NSInteger roomId;
@property (nonatomic,retain)NSString * startTime;
@property (nonatomic,retain)NSString * userArea;
@property (nonatomic,retain)NSString * userBigHeadUrl;
@property(nonatomic,assign)NSInteger userClass;
@property (nonatomic,retain)NSString * userDescript;
@property (nonatomic,retain)NSString * userHeadUrl;
@property (nonatomic,assign)NSInteger userId;
@property (nonatomic,retain)NSString * userNickName;
@property (nonatomic,assign)NSInteger * userPayFlag;
@property (nonatomic,assign)NSInteger * userXfFlag;
@end
