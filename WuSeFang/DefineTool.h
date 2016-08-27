//
//  DefineTool.h
//  WuSe
//
//  Created by ZhaoMing on 16/8/18.
//  Copyright © 2016年 guiyongdong. All rights reserved.
//

#ifndef DefineTool_h
#define DefineTool_h


#ifdef DEBUG
#define NSLog(...)  NSLog(__VA_ARGS__)
#define debugMethod()
#else
#define NSLog(...)
#define debugMethod()
#endif


#define WindowWidth ([[UIScreen mainScreen] bounds].size.width)
#define WindowHeight ([[UIScreen mainScreen] bounds].size.height)

#define iOS7Later ([[UIDevice currentDevice].systemVersion doubleValue] >= 7.0)
#define iOS8_2Later ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.2)
#define RGB(r, g, b) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1.0]
#define RGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]

///结束svp的展示
#define NOSHOWSVP(time) \
dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(time * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ \
[SVProgressHUD dismiss]; \
});







#endif /* DefineTool_h */
