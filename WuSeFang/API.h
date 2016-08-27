//
//  API.h
//  WuSe
//
//  Created by ZhaoMing on 16/8/18.
//  Copyright © 2016年 guiyongdong. All rights reserved.
//

#ifndef API_h
#define API_h


///注册验证码
#define REGIST_CODE_URL @"http://www.abaitu.com:54688//server/v2.0/smsCode"
///注册接口
#define REGIST_URL @"http://www.abaitu.com:54688//login/v2.4/mobileRegTx"
///注册上传头像
#define REGIST_UPLOADIMAGGE_URL @"http://www.abaitu.com:54688//user/v2.0/uploadFile"
///注册验证信息
#define REGIST_RELOAD_USERIMAGE_URL @"http://www.abaitu.com:54688//user/v2.0/updateUserHeadUrl"
///注册上传信息
#define REGIST_UPLOAD_USERINFO_URL @"http://www.abaitu.com:54688//user/v2.4/updateUserInfo"
///登录
#define LOGIN_URL @"http://www.abaitu.com:54688//login/v2.4/mobileLoginTx"
///首页直播数据
#define HOMEPAGE_LIVE_URL @"http://www.abaitu.com:54688//channel/v2.4/txChannelList"
//首页动态
#define HOMEPAGE_DYNAMICS_URL @"http://www.abaitu.com:54688//user/v2.0/dynList"
//首页关注
#define HOMEPAGE_FOUCS_URL @"http://www.abaitu.com:54688//user/v2.0/followDynList"
//喜欢
#define LIKE_URL @"http://www.abaitu.com:54688//like/v2.0/addLike"
//关注视频详情
#define DYPLAY_URL @"http://www.abaitu.com:54688//user/v2.0/dynInfo"
//关注视频详情关注人列表
#define DYPLAY_LIKE_LIST_URL @"http://www.abaitu.com:54688//user/v2.0/likeList"
//用户信息
#define PROFILE_USERINFO_URL @"http://www.abaitu.com:54688//user/v2.0/userInfo"
//关注
#define ADD_FOUCS_URL @"http://www.abaitu.com:54688//user/v1.1/follow"
//评论列表
#define COMMENT_LIST_URL @"http://www.abaitu.com:54688//discuss/v2.0/list"
//添加评论
#define COMMENT_ADD_URL @"http://www.abaitu.com:54688//discuss/v2.0/add"
//搜索用户
#define SEARCH_USER_URL @"http://www.abaitu.com:54688//user/v2.0/searchUser"
//直播信息
#define LIVE_USERINFO_URL @"http://www.abaitu.com:54688//channel/v2.0/channelInfo"


#endif /* API_h */
