//
//  MMLoginTools.h
//  WuSeFang
//
//  Created by 马扬 on 16/8/26.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <TencentOpenAPI/TencentMessageObject.h>
#import <TencentOpenAPI/TencentOAuthObject.h>
#import <TencentOpenAPI/TencentOAuth.h>
#import <TencentOpenAPI/TencentApiInterface.h>



@interface MMLoginTools : NSObject


/** 创建button */
+ (UIButton *)createButtonWithTitle:(NSString *)title;
/** 用户第三方登录 */
+ (TencentOAuth *)loginByQQ:(id<TencentSessionDelegate>)delegate;
/** 返回一张模糊的图片 */
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur;
/** 截屏 */
+ (UIImage *)captureView:(UIView *)view;
/** 根据颜色大小生成一个图片 */
+ (UIImage *)createImageByColor:(UIColor *)color Size:(CGSize)size;
/** 登录按钮被点击 */
+ (RACSignal *)loginDidClickUserName:(NSString *)userName PassWord:(NSString *)passWord;

@end
