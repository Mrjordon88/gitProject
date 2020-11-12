//
//  PublicTools.h
//  GitProject
//
//  Created by Apple on 2020/11/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PublicTools : NSObject

+(instancetype)GetPublickTools;
//获取当前时间
-(NSString*)getCurrentTimes;
@end

NS_ASSUME_NONNULL_END
