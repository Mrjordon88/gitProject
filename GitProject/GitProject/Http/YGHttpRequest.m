//
//  YGHttpRequest.m
//  GitProject
//
//  Created by Apple on 2020/11/13.
//

#import "YGHttpRequest.h"

@implementation YGHttpRequest

+ (void)getWithUrl:(NSString *)urlName setParms:(id)params Success:(void (^)(id))successBlock failure:(void (^)(id))failureBlock
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:
                                                         @"text/json",
                                                         @"text/html",
                                                         @"application/json",
                                                         @"text/javascript",
                                                         @"text/css", nil];
      manager.requestSerializer.cachePolicy =NSURLRequestReloadIgnoringLocalAndRemoteCacheData;
    // 验证HTTP+SSL证书
//    [manager setSecurityPolicy:[self customSecurityPolicy]];
    //目前写死的一个请求链接
    NSString * tempUrl = @"https://api.github.com/";
    [manager GET:tempUrl parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        FTLog(@"--%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        FTLog(@"请求成功--%@---%@",params,responseObject);
        successBlock(responseObject);
  
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
     FTLog(@"error--%@--url---%@",error,urlName);
        failureBlock(error);
      
    }];
}
@end
