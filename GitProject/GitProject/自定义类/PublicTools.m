//
//  PublicTools.m
//  GitProject
//
//  Created by Apple on 2020/11/13.
//

#import "PublicTools.h"

@implementation PublicTools

+(instancetype)GetPublickTools{
    static PublicTools *tools = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tools = [[PublicTools alloc]init];
    });
    return tools;
}


-(NSString*)getCurrentTimes{

    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"YYYY-MM-dd-HH:mm:ss"];
    NSDate *datenow = [NSDate date];
    NSString *currentTimeString = [formatter stringFromDate:datenow];
    return currentTimeString;

}
@end
