//
//  MMLoginTools.m
//  WuSeFang
//
//  Created by 马扬 on 16/8/26.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "MMLoginTools.h"
#import "WuSeTools.h"
#import "NSString+MD5.h"


@implementation MMLoginTools
/** QQ登录 */
+ (TencentOAuth *)loginByQQ:(id<TencentSessionDelegate>)delegate{
    NSArray* permissions = [NSArray arrayWithObjects:
                            kOPEN_PERMISSION_GET_OTHER_INFO,
                            kOPEN_PERMISSION_GET_USER_INFO,
                            kOPEN_PERMISSION_GET_SIMPLE_USER_INFO,
                            kOPEN_PERMISSION_CHECK_PAGE_FANS,
                            nil];
    TencentOAuth *_tencentOAuth =
    [[TencentOAuth alloc]initWithAppId:@"1104865611" andDelegate:delegate];
    [_tencentOAuth authorize:permissions inSafari:NO];
    return _tencentOAuth;
}


+ (UIButton *)createButtonWithTitle:(NSString *)title {
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:title forState:UIControlStateNormal];
    button.layer.cornerRadius = 5;
    button.layer.masksToBounds = YES;
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    button.layer.borderWidth = 2.0;
    button.titleLabel.font = [UIFont systemFontOfSize:15];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    return button;
}
/** 返回一张模糊的图片 */
+ (UIImage *)blurryImage:(UIImage *)image withBlurLevel:(CGFloat)blur{
    CIImage *inputImage = [CIImage imageWithCGImage:image.CGImage];
    CIFilter *filter = [CIFilter filterWithName:@"CIGaussianBlur"];
    [filter setValue:inputImage forKey:kCIInputImageKey];
    [filter setValue:@(blur) forKey:@"inputRadius"];
    CIImage *outputImage = filter.outputImage;
    CGImageRef outImage = [[CIContext contextWithOptions:nil] createCGImage:outputImage
                                             fromRect:[outputImage extent]]; 
    return [UIImage imageWithCGImage:outImage];
}
/** 截屏 */
+ (UIImage *)captureView:(UIView *)view{
    UIImage * image = nil;
    UIGraphicsBeginImageContextWithOptions(CGSizeMake(view.frame.size.width, view.frame.size.height), NO, 0);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [view.layer renderInContext:UIGraphicsGetCurrentContext()];
    [view.layer renderInContext:context];
    image = UIGraphicsGetImageFromCurrentImageContext();
    return image;
}
/** 根据颜色大小生成一个图片 */
+ (UIImage *)createImageByColor:(UIColor *)color Size:(CGSize)size{
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}
/** 登录按钮被点击 */
+ (RACSignal *)loginDidClickUserName:(NSString *)userName PassWord:(NSString *)passWord{
    
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    [dic setObject:[WuSeTools getDeviceId] forKey:@"imei"];
    [dic setObject:userName forKey:@"mobile"];
    [dic setObject:[NSString md5:passWord] forKey:@"password"];
    [dic setObject:@(2.4) forKey:@"ver"];

   
    
    RACSignal * signal = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 10.f;
        [manager POST:LOGIN_URL parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [subscriber sendNext:responseObject];
            NSLog(@"%@",responseObject);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendNext:error];
        }];
        return [RACDisposable disposableWithBlock:^{
        }];
    }];
    return signal;
}
@end
