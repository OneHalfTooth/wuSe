//
//  VideoView.m
//  WuSeFang
//
//  Created by 马扬 on 16/8/26.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "VideoView.h"
#import <AVFoundation/AVFoundation.h>


@implementation VideoView
-(instancetype)init{
    self = [super init];
    if (self) {
        [self createPlayer];
    }
    return self;
}

+ (Class)layerClass{
    /** 这里return什么类型self。layer就会拿到什么类型 */
    return [AVPlayerLayer class];
}

- (void)replay{
    [self.player seekToTime:CMTimeMake(0, 1)];
    [self.player play];
}

- (void)setLayerBy:(AVPlayer *)layer{
    AVPlayerLayer * player = (AVPlayerLayer *)self.layer;
    player.videoGravity = AVLayerVideoGravityResizeAspectFill;
    [player setPlayer:layer];
}
/** 创建视频播放层 */
- (void)createPlayer{
    /** 获取到视频资源 */
    NSString * path = [[NSBundle mainBundle]pathForResource:@"loginmovie" ofType:@"mp4"];
    /** 转化成URL*/
    NSURL * url = [NSURL fileURLWithPath:path];
    /** AVAsset 存放了视频的各种信息 */
    /** 获取视频的所有信息 */
    AVAsset * avset = [AVAsset assetWithURL:url];
    /** 预加载视频 通过 @“tracks”加载视频的信息 */
    [avset loadValuesAsynchronouslyForKeys:@[@"tracks"] completionHandler:^{
        /** 通过 key获取当前视频 预加载的状态 */
        /** 返回值是个枚举不能用* */
        AVKeyValueStatus status =  [avset statusOfValueForKey:@"tracks" error:nil];
        /** 判断预加载状态 */
        if (status == AVKeyValueStatusLoaded) {/** 加载完成 */
            /** AVPlayerItem获取视频的所有信息，包裹播放进度，视频的总时间，类型 */
            AVPlayerItem * item = [AVPlayerItem playerItemWithAsset:avset];
            /** 通过itme创建一个播放器 */
            /** 通过itme就能获取视频的所有信息 */
            self.player = [[AVPlayer alloc]initWithPlayerItem:item];
            /** 必须创建一个view去承载这个播放器，因为avplayer是layer层，必须放在layer层，但是self。view。layer不能承载avplayerlayer 所以需要在里边写+（Class）layerClass 所以必须创建一个view */
            [self setLayerBy:self.player];
            [self.player play];
        }
    }];
    __weak typeof(self) weakself = self;
    [[[NSNotificationCenter defaultCenter]rac_addObserverForName:AVPlayerItemDidPlayToEndTimeNotification object:nil] subscribeNext:^(id x) {
        [weakself replay];
    }];
}

@end
