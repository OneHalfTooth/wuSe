//
//  AppDelegate.m
//  WuSeFang
//
//  Created by 马扬 on 16/8/26.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "AppDelegate.h"
#import "MMLoginManagerViewController.h"
#import <TencentOpenAPI/TencentOAuth.h>




@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    MMLoginManagerViewController * loginVC = [[MMLoginManagerViewController alloc]init];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    UINavigationController * nav = [[UINavigationController alloc]initWithRootViewController:loginVC];
    self.window.rootViewController = nav;
    [self.window makeKeyAndVisible];
    
    return YES;
}
- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url{
    return [TencentOAuth HandleOpenURL:url];
}
- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url sourceApplication:(NSString *)sourceApplication annotation:(id)annotation{
    return [TencentOAuth HandleOpenURL:url];
}

@end
