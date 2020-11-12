//
//  LHHistoryDataController.m
//  LiheC
//
//  Created by Apple on 2020/11/12.
//  Copyright © 2020 me. All rights reserved.
//

#import "LHHistoryDataController.h"
#import "LHGitDataShowCell.h"
#import "LHHistoryDetailController.h"
#import "FFToast.h"
#import "NSString+FFToast.h"
#import "UIImage+FFToast.h"
@interface LHHistoryDataController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)CommonTable * myTableview;
@property(nonatomic,strong)NSMutableArray * datearray;
//更新标示
@property(nonatomic,assign)BOOL HasNew;
@property(nonatomic,strong)FFToast *popView;
@end
@implementation LHHistoryDataController

static NSString *ReuseID = @"GitDataCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"历史记录";
    [self AddNotif];
    self.view.backgroundColor = UIColorFromRGB(0xffffff);
    [self setTableview];
    [self ReloadDataMethod];
}

-(void)setTableview{
    self.myTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - kBottomSafeHeight)];
    self.myTableview.delegate = self;
    self.myTableview.dataSource  = self;
    [self.view addSubview:self.myTableview];
    [self.myTableview registerNib:[UINib nibWithNibName:NSStringFromClass([LHGitDataShowCell class]) bundle:nil] forCellReuseIdentifier:ReuseID];
    _myTableview.showsVerticalScrollIndicator = NO;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LHGitDataShowCell * cell = [tableView dequeueReusableCellWithIdentifier:ReuseID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([LHGitDataShowCell class]) owner:nil options:nil].firstObject;
    }
    if (self.datearray.count != 0) {
        NSDictionary * dic  = self.datearray[indexPath.row];
        NSString * dicStr = dic.allKeys.firstObject;
        cell.textLabel.text = dicStr;
        if (indexPath.row == 0 && self.HasNew ) {
            cell.textLabel.textColor = [UIColor redColor];
        }else{
            cell.textLabel.textColor = [UIColor blackColor];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datearray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    LHHistoryDetailController * LHHistoryDetailC = [[LHHistoryDetailController alloc] init];
    NSDictionary * dic  = self.datearray[indexPath.row];
    NSString * dicStr = dic.allKeys.firstObject;
    LHHistoryDetailC.datearray =dic[dicStr];
    [self.navigationController pushViewController:LHHistoryDetailC animated:YES];
}

//数据刷新通知
-(void)AddNotif{
[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ReloadNewDataMethod) name:ReloadHistoryDataGitNotification object:nil];
}

//更新界面数据 记录新消息
-(void)ReloadNewDataMethod{
    self.HasNew = YES;
    [self ReloadDataMethod];
    [self.popView show];
}

#pragma mark- 页面数据
-(void)ReloadDataMethod{
    HSKStorage *storage = [[HSKStorage alloc]initWithPath:CurrentTimePath];
    NSMutableArray *HistoryArray= (NSMutableArray *)[storage hsk_objectForKey:GitHistroyData];
    NSMutableArray *DataArray = [NSMutableArray array];
    for (int i = 0; i< HistoryArray.count; i++) {
        NSDictionary * dic = HistoryArray[i];
        [DataArray addObject:dic];
    }
    self.datearray = [NSMutableArray arrayWithArray:DataArray];
    [self.myTableview reloadData];
}

//自定义消息弹框
-(FFToast *)popView {
    if (!_popView) {
        _popView = [[FFToast alloc]initToastWithTitle:@"您有最新的消息" message:@"现在有最新的数据" iconImage:nil];
        _popView.duration = 0.5f;
        _popView.toastPosition = FFToastPositionDefault;//显示的位置
        _popView.toastType = FFToastTypeInfo;
    }
    return _popView;
}

@end
