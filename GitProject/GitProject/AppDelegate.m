//
//  AppDelegate.m
//  GitProject
//
//  Created by Apple on 2020/11/12.
//

#import "AppDelegate.h"
#import "BaseTabbarViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    //app启动5秒进行数据请求
    [self CircularMethod];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    BaseTabbarViewController *tabbarVC = [[BaseTabbarViewController alloc]init];
    self.window.rootViewController = tabbarVC;
    [self.window makeKeyWindow];
    //设置全局导航栏样式
    [self setupNavgationBarStyle];
    return YES;
}

//5s请求api
-(void)CircularMethod{
    WS(weakSelf);
    static dispatch_source_t _timer;
    NSTimeInterval period = 5.f;
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    _timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(_timer, dispatch_walltime(NULL, 0), period * NSEC_PER_SEC, 0);
    dispatch_source_set_event_handler(_timer, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakSelf ApiRequest];
        });
    });
    dispatch_resume(_timer);
}

-(void)ApiRequest{
//  网络请求数据
    [self NetWorkRequest];
//  本地请求数据
//    [self LoadLocalData];
}

//网络请求
-(void)NetWorkRequest{
    WS(weakSelf);
    //目前只有一个链接 没有主域名 这里临时只写死一个请求
    [YGHttpRequest getWithUrl:nil setParms:nil Success:^(id AJson) {
        NSDictionary * JsonDic = AJson;
        if ([JsonDic isEqual:[NSNull null]] || [JsonDic allKeys].count == 0) {
            return;;
        }
        HSKStorage *storage = [[HSKStorage alloc]initWithPath:AccountPath];
        [storage hsk_setObject:JsonDic forKey:GitCacheData];
        
        NSMutableArray *dicToArray = [NSMutableArray array];
        [JsonDic enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [dicToArray addObject:[NSString stringWithFormat:@"%@=%@",key,obj]];}
         ];
        //添加历史记录
        [weakSelf addHistoryWith:dicToArray];
        [[NSNotificationCenter defaultCenter] postNotificationName:ReloadDataGitNotification object:nil];
        } failure:^(id AJson) {
    
        }];
    
}

//加载本地数据
-(void)LoadLocalData{
    NSMutableDictionary * TempDic = [NSMutableDictionary dictionary];
    for (int i = 0; i< 30 ; i++) {
    NSString * formStr = [NSString stringWithFormat:@"%@-----%d",[[PublicTools GetPublickTools] getCurrentTimes],arc4random_uniform(10000)];
    [TempDic setValue:formStr forKey:[NSString stringWithFormat:@"数据%d",i]];
    }
    HSKStorage *storage = [[HSKStorage alloc]initWithPath:AccountPath];
        [storage hsk_setObject:TempDic forKey:GitCacheData];
    
    NSMutableArray *dicToArray = [NSMutableArray array];
    [TempDic enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [dicToArray addObject:[NSString stringWithFormat:@"%@=%@",key,obj]];}
     ];
    
    [self addHistoryWith:dicToArray];
    //全局数据更新通知
    [[NSNotificationCenter defaultCenter] postNotificationName:ReloadDataGitNotification object:nil];
}

//请求完成后 记录数据历史
-(void)addHistoryWith:(NSMutableArray * )DataArray{
    NSMutableArray * HistroyArray  = [NSMutableArray array];
    HSKStorage *HistoryStorage = [[HSKStorage alloc]initWithPath:CurrentTimePath];
    NSMutableArray * TempArray =(NSMutableArray *)[HistoryStorage hsk_objectForKey:GitHistroyData];
    if (TempArray.count != 0) {
        HistroyArray = [NSMutableArray arrayWithArray:TempArray];
    }
    NSString * timeStr = [[PublicTools GetPublickTools] getCurrentTimes];
    NSDictionary * HistroyDic = @{timeStr:DataArray};
    if (HistroyArray.count == 0) {
        [HistroyArray addObject:HistroyDic];
    }else{
        [HistroyArray insertObject:HistroyDic atIndex:0];
    }

    [HistoryStorage hsk_setObject:HistroyArray forKey:GitHistroyData];
    //历史更新通知
    [[NSNotificationCenter defaultCenter] postNotificationName:ReloadHistoryDataGitNotification object:nil];
}


// 全局设置导航栏默认外观属性
- (void)setupNavgationBarStyle {
    [[UINavigationBar appearance] setBarTintColor:[UIColor orangeColor]];
    [[UINavigationBar appearance] setTintColor:[UIColor grayColor]];
    
    // 设置标题颜色和字号大小
    [[UINavigationBar appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor purpleColor],NSFontAttributeName:[UIFont fontWithName:@"PingFangSC-Medium" size:18]}];
//    [[UINavigationBar appearance] setHidden:YES];//TODO 为啥写这么一句
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
