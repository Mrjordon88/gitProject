//
//  LiheC
//
//  Created by Apple on 2020/11/12.
//  Copyright © 2020 me. All rights reserved.

#import "LHGitDataShowController.h"
#import "LHGitDataShowCell.h"
#import "LHHistoryDataController.h"
@interface LHGitDataShowController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)CommonTable * myTableview;
@property(nonatomic,strong)NSMutableArray * datearray;
@end
@implementation LHGitDataShowController

static NSString *ReuseID = @"GitDataCellID";

- (void)viewDidLoad {
    [super viewDidLoad];
    [self AddNotif];
    [self lodSechLef];
    self.view.backgroundColor = UIColorFromRGB(0xffffff);
    [self setTableview];
    [self GetData];
    self.navigationItem.title = @"数据页";
}

-(void)setTableview{
    self.myTableview = [[CommonTable alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height - kBottomSafeHeight)];
    self.myTableview.delegate = self;
    self.myTableview.dataSource  = self;
    [self.view addSubview:self.myTableview];
    [self.myTableview registerNib:[UINib nibWithNibName:NSStringFromClass([LHGitDataShowCell class]) bundle:nil] forCellReuseIdentifier:ReuseID];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    LHGitDataShowCell * cell = [tableView dequeueReusableCellWithIdentifier:ReuseID];
    if (cell == nil) {
        cell = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([LHGitDataShowCell class]) owner:nil options:nil].firstObject;
    }
    if (self.datearray.count != 0) {
        NSString * dicStr = self.datearray[indexPath.row];
        cell.textLabel.text = dicStr;
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 75;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.datearray.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
        
}

//数据刷新通知
-(void)AddNotif{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(GetData) name:ReloadDataGitNotification object:nil];
}

//获取已有数据
-(void)GetData{
    HSKStorage *storage = [[HSKStorage alloc]initWithPath:AccountPath];
    NSDictionary * JsonDic = (NSDictionary *)[storage hsk_objectForKey:GitCacheData];
    NSMutableArray *dicToArray = [NSMutableArray array];
    [JsonDic enumerateKeysAndObjectsUsingBlock:^(id _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        [dicToArray addObject:[NSString stringWithFormat:@"%@=%@",key,obj]];}
     ];
    self.datearray = [NSMutableArray arrayWithArray:dicToArray];
    [self.myTableview reloadData];
    
}

//添加历史记录入口
- (void)lodSechLef
{
    UIBarButtonItem *rightItem =  [UIBarButtonItem itemRightWithButtonTitle:@"历史记录" color:[UIColor whiteColor] target:self action:@selector(WatchHistory)];
    UIBarButtonItem *space = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    space.width = 10;
    self.navigationItem.rightBarButtonItems = @[rightItem,space];
}

#pragma mark- 历史记录
-(void)WatchHistory{
    LHHistoryDataController * LHHistoryDataC = [[LHHistoryDataController alloc] init];
    [self.navigationController pushViewController:LHHistoryDataC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end

