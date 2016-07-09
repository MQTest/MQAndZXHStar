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
#import "AllOfLibraryView.h"
#import "TableViewCellModel.h"
#import "GoodsTableViewCell.h"
#import "CarVC.h"
#import "UIButton+ImageTitleSpacing.h"
#import "SearchVC.h"
#import "GoodsSectionHeaderView.h"

@interface HomeVC ()<UITableViewDataSource,UITableViewDelegate>{
    UITableView *_tableView;
}

@property (nonatomic, strong)NSMutableArray *libraryDataArr;
@property (nonatomic, strong)NSMutableArray *cellGoodsDataArr;
@property (nonatomic, strong)NSMutableArray *indexArr;
@property (nonatomic, strong)NSMutableArray *goodsCellURLArr;

@end

@implementation HomeVC

#pragma mark- 数组懒加载
- (NSMutableArray *)libraryDataArr{
    if (!_libraryDataArr) {
        _libraryDataArr = [NSMutableArray array];
        
    }
    return _libraryDataArr;
}

- (NSMutableArray *)cellGoodsDataArr{
    if (!_cellGoodsDataArr) {
        _cellGoodsDataArr = [NSMutableArray array];
    }
    return _cellGoodsDataArr;
}

- (NSMutableArray *)indexArr{
    if (!_indexArr) {
        _indexArr = [NSMutableArray arrayWithObjects:[NSMutableArray array],[NSMutableArray array], nil];
        
    }
    return _indexArr;
}

- (NSMutableArray *)goodsCellURLArr{
    if (!_goodsCellURLArr) {
        _goodsCellURLArr = [NSMutableArray arrayWithObjects:@"http://api-v2.mall.hichao.com/sku/list?more_items=1&type=selection&flag=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=EBB6B049-DBD7-42BE-89D2-CA16127B0EBE&gs=1536x2048&gos=9.2.1&access_token=rGus348gpvMnPuIitmg-36Pp2YP8b_L_I5sPEaoOyIA",@"http://api-v2.mall.hichao.com/sku/list?more_items=1&type=selection&flag=&category_ids=38,33,34&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=EBB6B049-DBD7-42BE-89D2-CA16127B0EBE&gs=1536x2048&gos=9.2.1&access_token=rGus348gpvMnPuIitmg-36Pp2YP8b_L_I5sPEaoOyIA",@"http://api-v2.mall.hichao.com/sku/list?more_items=1&type=selection&flag=&category_ids=39,40&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=EBB6B049-DBD7-42BE-89D2-CA16127B0EBE&gs=1536x2048&gos=9.2.1&access_token=rGus348gpvMnPuIitmg-36Pp2YP8b_L_I5sPEaoOyIA",@"http://api-v2.mall.hichao.com/sku/list?more_items=1&type=selection&flag=&category_ids=49,45,48,46,44&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=EBB6B049-DBD7-42BE-89D2-CA16127B0EBE&gs=1536x2048&gos=9.2.1&access_token=rGus348gpvMnPuIitmg-36Pp2YP8b_L_I5sPEaoOyIA", nil];
    }
    return _goodsCellURLArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor redColor];
    [self createViews];
    [self initData];
    
}

#pragma mark- 创建视图
- (void)createViews{
    
    [self setLeftButtonWithTitle:@"分类" andIamge:@"bottom_head_sort@2x.png" andSpace:0];
    [self setRightButtonWithTitle:@"消息" andIamge:@"button_head_massage@2x.png" andSpace:0];
    [self setMidButtonWithTitle:@"单品 / 品牌 / 红人" andIamge:@"mx_search_icon@2x.png" andSpace:5];
    
    // 导航栏按钮点击事件
    [self buttonCallBackBlock:^(UIButton *button) {
        NSInteger tag = button.tag - LeftButtonTag;
        
        switch (tag) {
            case 0:
            {
                NSLog(@"分类");
                break;
            }
            case 1:
            {
                NSLog(@"搜索");
                [self.navigationController pushViewController:[SearchVC new] animated:YES];
                break;
            }
            case 2:
            {
                NSLog(@"消息");
                
                break;
            }
            default:
                break;
        }
 
    }];
    
    
    
    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, kMainBoundsW, kMainBoundsH - 64) style:UITableViewStylePlain];
    tableView.backgroundColor = MQGlobalBg;
    tableView.dataSource = self;
    tableView.delegate = self;
    tableView.showsVerticalScrollIndicator = NO;
    [self.view addSubview:tableView];
    
    [tableView registerClass:[GoodsTableViewCell class] forCellReuseIdentifier:@"cell"];
    [tableView registerClass:[UITableViewHeaderFooterView class] forHeaderFooterViewReuseIdentifier:@"head"];
    
    _tableView = tableView;
}


#pragma mark- 初始化数据
- (void)initData{
    //获取表头数据推荐数据
    [HttpManager getTableViewHeaderViewDataWithBlock:^(NSArray *topDataArr, NSArray *bottomDateArr) {
        dispatch_async(dispatch_get_main_queue(), ^{
            
            TableHeaderView *headView = [[TableHeaderView alloc] initWithFrame:CGRectMake(0, 0, kMainBoundsW, kMainBoundsH - 64 - 49) withTopDataArr:topDataArr withBottomDataArr:bottomDateArr];
            _tableView.tableHeaderView = headView;
            
            //按钮点击事件
            [headView scrollViewButtonClick:^(UIButton *button) {
                
            }];
            [_tableView reloadData];
        });
    }];
    //获得各个区头（各个馆）的数据
    for (NSInteger i = 0; i < 6; i++) {
        [HttpManager getAllOfHoldDataWithURL:[NSString stringWithFormat:@"http://api-v2.mall.hichao.com/mall/region/new?region_id=%ld&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=4BEEB748-8BB4-4FF3-B72B-CC964327A433&gs=640x1136&gos=9.3.2&access_token=",i + 1] withBlock:^(NSArray *dataArr) {
            
            [self.libraryDataArr addObject:dataArr];
            dispatch_async(dispatch_get_main_queue(), ^{

                [_tableView reloadData];
            });
        }];
    }
   //获取最后cell上的数据
    [HttpManager getBottomGoodsDataWithURl:self.goodsCellURLArr[0] withBlock:^(NSArray *dataArr) {
        
        [self.cellGoodsDataArr addObjectsFromArray:dataArr];
        for (NSInteger i = 0; i < self.cellGoodsDataArr.count; i++) {
            if (i%2 == 0) {
                [self.indexArr[0] addObject:[NSNumber numberWithInteger:i]];
            }else{
                [self.indexArr[1] addObject:[NSNumber numberWithInteger:i]];
            }
        }
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [_tableView reloadData];
        });
    }];
    
}

#pragma mark- tableView代理的实现

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.libraryDataArr.count + 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == self.libraryDataArr.count) {
//        NSLog(@"1===%ld,2=====%ld",[self.indexArr[0] count],[self.indexArr[1] count]);
//        return [self.indexArr[0] count] >= [self.indexArr[1] count] ? [self.indexArr[0] count]:[self.indexArr[1] count];
        return self.libraryDataArr.count;
    }else{
        return 0;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    GoodsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    [cell setAllDefault];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.dataArr = self.cellGoodsDataArr;
    cell.index = indexPath.row;
    cell.indexArr = self.indexArr;
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",indexPath.row];
    return cell;
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    if (section == self.libraryDataArr.count) {
        return 42;
    }else{
        return kMainBoundsH;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == self.libraryDataArr.count) {
        return 300;
    }else{
        return 0;
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == self.libraryDataArr.count) {
        GoodsSectionHeaderView *view = [[GoodsSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, kMainBoundsW, 42) withTitleArr:@[@"今日上新",@"上装",@"裙装",@"裤装"]];
        [view setAllDefault];
        [view buttonSendMessage:^(UIButton *button) {
            NSInteger tag = button.tag - TodayButtonTag;
//            NSLog(@"%ld",tag);
            [HttpManager getBottomGoodsDataWithURl:self.goodsCellURLArr[tag] withBlock:^(NSArray *dataArr) {
                [self.cellGoodsDataArr removeAllObjects];
                [self.cellGoodsDataArr addObjectsFromArray:dataArr];
                [self.indexArr[0] removeAllObjects];
                [self.indexArr[1] removeAllObjects];
                for (NSInteger i = 0; i < self.cellGoodsDataArr.count; i++) {
                    if (i%2 == 0) {
                        [self.indexArr[0] addObject:[NSNumber numberWithInteger:i]];
                    }else{
                        [self.indexArr[1] addObject:[NSNumber numberWithInteger:i]];
                    }
                }
                
                dispatch_async(dispatch_get_main_queue(), ^{
                    NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:section];
                    NSIndexPath *path1 = [NSIndexPath indexPathForRow:1 inSection:section];
                    [_tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionTop animated:YES];
                    //刷新数据   只刷新2行 （一屏数据）
                    [_tableView reloadRowsAtIndexPaths:@[path,path1] withRowAnimation:UITableViewRowAnimationNone];
                });
               


            }];
            
//            NSIndexPath *path = [NSIndexPath indexPathForRow:0 inSection:section];
//            [_tableView scrollToRowAtIndexPath:path atScrollPosition:UITableViewScrollPositionTop animated:YES];

        }];

        return view;
    }else{
        AllOfLibraryView *view = [[AllOfLibraryView alloc] initWithFrame:CGRectMake(0, 0, kMainBoundsW, kMainBoundsH) withDataArr:self.libraryDataArr andIndex:section];
        return view;
//        return nil;
    }
    
}

#pragma mark-

- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBarHidden = YES;
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
