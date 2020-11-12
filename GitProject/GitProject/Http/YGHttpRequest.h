//
//  YGHttpRequest.h
//  GitProject
//
//  Created by Apple on 2020/11/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGHttpRequest : NSObject

+  (void)getWithUrl:(NSString *)urlName setParms:(NSDictionary *)params Success:(void (^)(id AJson))successBlock failure:(void(^)(id AJson))failureBlock;
@end

NS_ASSUME_NONNULL_END
