//
//  WuSeTools.m
//  WuSeFang
//
//  Created by 马扬 on 16/8/27.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "WuSeTools.h"

@implementation WuSeTools




/** 获取UUID */
+ (NSString *)getDeviceId
{
    NSString * currentDeviceUUIDStr = nil;
    if (currentDeviceUUIDStr == nil || [currentDeviceUUIDStr isEqualToString:@""])
    {
        NSUUID * currentDeviceUUID  = [UIDevice currentDevice].identifierForVendor;
        currentDeviceUUIDStr = currentDeviceUUID.UUIDString;
    }
    return currentDeviceUUIDStr;
}


@end
