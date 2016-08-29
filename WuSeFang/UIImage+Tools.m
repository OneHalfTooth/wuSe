//
//  UIImage+Tools.m
//  roctet_rac
//
//  Created by 马扬 on 16/8/20.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "UIImage+Tools.h"

@implementation UIImage (Tools)

/** 通过名字返回一个固定大小的图片 */
+ (UIImage *)imageWithName:(NSString *)imageName Size:(CGSize)size{
    UIImage * image = [UIImage imageNamed:imageName];
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    CGRect imageRect = CGRectMake(0.0, 0.0, size.width, size.height);
    [image drawInRect:imageRect];
    image = UIGraphicsGetImageFromCurrentImageContext();
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    UIGraphicsEndImageContext();
    return image;
}

@end
