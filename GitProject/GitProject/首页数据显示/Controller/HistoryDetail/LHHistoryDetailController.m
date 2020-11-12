//
//  LHHistoryDetailController.m
//  LiheC
//
//  Created by Apple on 2020/11/12.
//  Copyright © 2020 me. All rights reserved.
//

#import "LHHistoryDetailController.h"
#import "LHGitDataShowCell.h"
@interface LHHistoryDetailController ()
<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong)CommonTable * myTableview;
@end

@implementation LHHistoryDetailController

static NSString *ReuseID = @"GitDataCellID";


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColorFromRGB(0xffffff);
    [self setTableview];
}

-(void)setTableview{
    self.myTableview = [[CommonTable alloc]initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height)];
    self.myTableview.delegate = self;
    self.myTableview.dataSource  = self;
    [self.view addSubview:self.myTableview];
    [self.myTableview registerNib:[UINib nibWithNibName:NSStringFromClass([LHGitDataShowCell class]) bundle:nil] forCellReuseIdentifier:ReuseID];
    _myTableview.showsVerticalScrollIndicator = NO;
}

//数据传递
-(void)setDatearray:(NSMutableArray *)datearray{
    _datearray = datearray;
    [self.myTableview reloadData];
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
@end
