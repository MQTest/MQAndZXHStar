//
//  HomeVC.m
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/4.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import "HomeVC.h"
#import "HttpManager.h"
#import "TableHeaderView.h"
#import "TableHeaderViewModel.h"
@interface HomeVC ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
}

@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor redColor];
    [self createViews];
    [self initData];
}

#pragma mark- 创建视图
- (void)createViews{
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kMainBoundsW, kMainBoundsH - 64) style:UITableViewStylePlain];
    tableView.backgroundColor = MQGlobalBg;
    tableView.dataSource = self;
    tableView.delegate = self;
    [self.view addSubview:tableView];
    
    tableView.tableHeaderView = [[TableHeaderView alloc] init];
    
    
    [tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    [tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"head"];
    
    _tableView = tableView;
}

#pragma mark- 初始化数据
- (void)initData{
    //获取表头数据推荐数据
    [HttpManager getTableViewHeaderViewDataWithBlock:^(NSArray *dataArr) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            _tableView.tableHeaderView = [[TableHeaderView alloc] initWithFrame:CGRectMake(0, 0, kMainBoundsW, kMainBoundsH - 64 - 49) withDataArr:dataArr];
            [_tableView reloadData];
        });
        
    }];
    
    
}

#pragma mark- tableView代理的实现

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 6) {
        return 20;
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == 6) {
        return 40;
    }else{
        return 300;
    }
    
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 6) {
        return nil;
    }else{
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainBoundsW, 300)];
        UILabel *label = [[UILabel alloc] initWithFrame:view.frame];
        label.text = [NSString stringWithFormat:@"%ld",section];
        [view addSubview:label];
        view.backgroundColor = MQRandomColor;
        return view;
    }
    
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
