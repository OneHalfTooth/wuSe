//
//  MMLoginViewController.m
//  WuSeFang
//
//  Created by 马扬 on 16/8/26.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "MMLoginManagerViewController.h"
#import "VideoView.h"
#import "MMLoginTools.h"
#import <AVFoundation/AVFoundation.h>
#import "MMLoginViewController.h"
#import "MMRegistViewController.h"



@interface MMLoginManagerViewController ()<TencentSessionDelegate,TencentApiInterfaceDelegate,TCAPIRequestDelegate>{
    TencentOAuth * _oauth;
}


/** 承载播放器的View */
@property (nonatomic,retain)VideoView * video;
@property (nonatomic,retain)UIImageView * imageView;
@property (nonatomic,retain)UIButton * loginButton;
@property (nonatomic,retain)UIButton * registButton;
@property (nonatomic,retain)UILabel * loginTitle;

@end

@implementation MMLoginManagerViewController

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
    [self.video.player play];
}
- (void)viewDidDisappear:(BOOL)animated{
    [super viewDidDisappear:animated];
    [self.video.player pause];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];
}
- (void)createView{
    [self createBackVideo];
    [self createImageVIew];
    [self createLoginButton];
    [self createRegistButton];
    [self createTitle];
    [self createThreeLoginButton];
}


- (void)createImageVIew{
    self.imageView = [[UIImageView alloc]init];
    self.imageView.image = [UIImage imageNamed:@"login_slogen"];
    [self.view addSubview:self.imageView];
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@237);
        make.height.equalTo(@116);
        make.centerY.equalTo(self.view.mas_centerY).with.offset(-116);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
}
- (void)createLoginButton{
    self.loginButton = [MMLoginTools createButtonWithTitle:@"登录"];
    [self.view addSubview:self.loginButton];
    [self.loginButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.width.equalTo(@250);
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY).with.offset(20);
    }];
    [[self.loginButton rac_signalForControlEvents:UIControlEventTouchUpInside] subscribeNext:^(id x) {
        MMLoginViewController * login = [[MMLoginViewController alloc]init];
        [self.navigationController pushViewController:login animated:YES];
    }];
}
- (void)createRegistButton{
    self.registButton = [MMLoginTools createButtonWithTitle:@"注册"];
    [self.view addSubview:self.registButton];
    [self.registButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@40);
        make.width.equalTo(@250);
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(self.loginButton.mas_bottom).with.offset(20);
    }];
    [[self.registButton rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        MMRegistViewController * registVc = [[MMRegistViewController alloc]init];
        [self.navigationController pushViewController:registVc animated:YES];
    }];
}
- (void)createBackVideo{
    self.video = [[VideoView alloc]init];
    [self.navigationController.view insertSubview:self.video atIndex:0];
    [self.video mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.right.left.equalTo(@0);
    }];
    [self.video.player play];
}
- (void)createTitle{
    UILabel *thirdLabel = [[UILabel alloc] init];
    thirdLabel.text = @"第三方登录";
    thirdLabel.textAlignment = NSTextAlignmentCenter;
    thirdLabel.font = [UIFont systemFontOfSize:14];
    thirdLabel.textColor = [UIColor whiteColor];
    [self.view addSubview:thirdLabel];
    [thirdLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.registButton.mas_bottom).with.offset(30);
        make.height.equalTo(@15);
        make.centerX.equalTo(self.view.mas_centerX);
    }];
    
    self.loginTitle = thirdLabel;
    
    UIView *leftLineView = [[UIView alloc] init];
    leftLineView.backgroundColor = RGB(240, 240, 240);
    [self.view addSubview:leftLineView];
    [leftLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.registButton.mas_left);
        make.right.equalTo(thirdLabel.mas_left).with.offset(-10);
        make.height.equalTo(@0.5);
        make.centerY.equalTo(thirdLabel.mas_centerY);
    }];
    
    
    UIView *rightLineView = [[UIView alloc] init];
    
    rightLineView.backgroundColor = RGB(240, 240, 240);
    [self.view addSubview:rightLineView];
    [rightLineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(thirdLabel.mas_right).with.offset(10);
        make.right.equalTo(self.registButton.mas_right);
        make.height.equalTo(@0.5);
        make.centerY.equalTo(thirdLabel.mas_centerY);
    }];
}
- (void)createThreeLoginButton{
    UIButton *wechatButon = [UIButton buttonWithType:UIButtonTypeCustom];
    [wechatButon setImage:[UIImage imageNamed:@"login_wechat"] forState:UIControlStateNormal];
    [self.view addSubview:wechatButon];
    [wechatButon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.registButton.mas_left);
        make.top.equalTo(self.loginTitle.mas_bottom).with.offset(30);
        make.width.height.equalTo(@50);
    }];
    
    UIButton *qqButon = [UIButton buttonWithType:UIButtonTypeCustom];
    [qqButon setImage:[UIImage imageNamed:@"login_qq"] forState:UIControlStateNormal];
    [self.view addSubview:qqButon];
    [qqButon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.top.equalTo(wechatButon.mas_top);
        make.width.height.equalTo(@50);
    }];
    /** 调用QQ第三方登录 */
    __weak typeof(self)weakself = self;
    [[qqButon rac_signalForControlEvents:UIControlEventTouchUpInside]subscribeNext:^(id x) {
        _oauth = [MMLoginTools loginByQQ:weakself];
    }];
    UIButton *weiboButon = [UIButton buttonWithType:UIButtonTypeCustom];
    [weiboButon setImage:[UIImage imageNamed:@"login_weibo"] forState:UIControlStateNormal];
    [self.view addSubview:weiboButon];
    [weiboButon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.registButton.mas_right);
        make.top.equalTo(wechatButon.mas_top);
        make.width.height.equalTo(@50);
    }];
}

- (void)tencentDidLogin{
    NSLog(@"完成登录");
}
- (void)tencentDidNotLogin:(BOOL)cancelled{
    NSLog(@"%d",cancelled);
}
- (void)tencentDidNotNetWork{
    NSLog(@"网络原因登录失败");
}


@end
