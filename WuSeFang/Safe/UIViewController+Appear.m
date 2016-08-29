//
//  UIViewController+Appear.m
//  WuSeFang
//
//  Created by 马扬 on 16/8/29.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <objc/runtime.h>


@implementation UIViewController (Appear)

//+(void)load{
//    Method method = class_getClassMethod([UIViewController class], @selector(viewWillAppear:));
//    Method customMethod = class_getClassMethod([UIViewController class], @selector(customViewWillAppear:));
//    method_exchangeImplementations(method, customMethod);
//}
//- (void)customViewWillAppear:(BOOL)animated{
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
//    [self customViewWillAppear:animated];
//}

@end
