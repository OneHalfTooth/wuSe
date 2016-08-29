//
//  MMHomeTools.m
//  WuSeFang
//
//  Created by 马扬 on 16/8/29.
//  Copyright © 2016年 马扬. All rights reserved.
//

#import "MMHomeTools.h"
#import "WuSeTools.h"

@implementation MMHomeTools


+ (RACSignal *)requestDataFromService{
    NSMutableDictionary * dic = [[NSMutableDictionary alloc]init];
    
    [dic setObject:[WuSeTools getDeviceId] forKey:@"imei"];
    [dic setObject:@(2.4) forKey:@"ver"];
    [dic setObject:@(412250) forKey:@"userId"];
    [dic setObject:@"a3a4579ed0a6cf1b3c427d4b27a17e99" forKey:@"userToken"];
    
    RACSignal * singl = [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
        AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
        manager.requestSerializer.timeoutInterval = 10.f;
        [manager POST:HOMEPAGE_LIVE_URL parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
            
        } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            [subscriber sendNext:responseObject];
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            [subscriber sendNext:error];
        }];
        return [RACDisposable disposableWithBlock:^{
            NSLog(@"结束了");
        }];
    }];
    return singl;
    
}

@end
