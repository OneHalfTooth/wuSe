//
//  UIImage+Tools.h
//  roctet_rac
//
//  Created by 马扬 on 16/8/20.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Tools)

/** 通过名字返回一个固定大小的图片 */
+ (UIImage *)imageWithName:(NSString *)imageName Size:(CGSize)size;

@end
