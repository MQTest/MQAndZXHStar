//
//  CommunityVC.m
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/4.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import "CommunityVC.h"
#import "HttpManager.h"
#import "CommunitHeadView.h"
#import "TableHeaderViewModel.h"
#import "CommunitGoodsCell.h"
@interface CommunityVC ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
}

@property (nonatomic, strong)NSMutableArray *dataArr;

@end

@implementation CommunityVC



- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setNavTitle:@"社区" leftTitle:nil rightTitle:nil];
//    self.view.backgroundColor = MQGlobalBg;
    
    [self initData];
    [self createViews];
    
    
}


#pragma mark- 初始化视图
- (void)createViews{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kMainBoundsW, kMainBoundsH - 64)];
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.showsVerticalScrollIndicator = NO;
    tableView.backgroundColor = MQGlobalBg;
    [self.view addSubview:tableView];
    _tableView = tableView;
    
    [tableView registerClass:[CommunitGoodsCell class] forCellReuseIdentifier:@"cell"];
}

#pragma mark- 初始化数据

- (void)initData{
    [HttpManager getCommunitHeadViewDataWithBlock:^(NSArray *dataArr) {
        TableHeaderViewModel *model = dataArr[0];
        _tableView.tableHeaderView = [[CommunitHeadView alloc] initWithFrame:CGRectMake(0, 0, kMainBoundsW, model.curHeight) withData:dataArr];
    }];
    
    [HttpManager getCommunitCellDataWithBlock:^(NSArray *dataArr) {
        [self.dataArr addObjectsFromArray:dataArr];
        NSLog(@"++++++++++%ld",self.dataArr.count);
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_tableView reloadData];
        });
    }];
    
    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return section == 0 ? 0 : self.dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return indexPath.section == 0 ? 0 : kMainBoundsH * 1.5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    CommunitGoodsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
//    cell.userInteractionEnabled = YES;
    [cell setAllDefault];
    if (self.dataArr.count > 0) {
        CommunitItems *model = [CommunitItems modelObjectWithDictionary:self.dataArr[indexPath.row]];
        cell.dataModel = model;
    }
    
    return cell;

}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
