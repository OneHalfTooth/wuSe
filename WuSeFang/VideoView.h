//
//  VideoView.h
//  WuSeFang
//
//  Created by 马扬 on 16/8/26.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface VideoView : UIView
/** 视频播放 */
@property (nonatomic,retain)AVPlayer * player;

- (void)setLayerBy:(AVPlayer *)layer;

@end
