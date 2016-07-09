//
//  HttpManager.m
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/4.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import "HttpManager.h"
#import "TableHeaderViewModel.h"
#import "TableViewCellModel.h"

 static AFHTTPSessionManager *_manager;



@implementation HttpManager


+ (void)getManager{
    _manager = [AFHTTPSessionManager manager];
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
}

//获取表头数据推荐数据
+ (void)getTableViewHeaderViewDataWithBlock:(void(^)(NSArray *topDataArr,NSArray *bottomDateArr))myBlock{
    
    NSMutableArray *topDataArr = [NSMutableArray array];
    NSMutableArray *bottomDateArr = [NSMutableArray array];
    [HttpManager getManager];
    
    //获得表头底部信息
    [_manager GET:@"http://api-v2.mall.hichao.com/active/flash/list?method=%2Factive%2Fflash%2Flist&data=eyJnYSI6Imh0dHA6Ly9hcGktdjIubWFsbC5oaWNoYW8uY29tIn0%3D&sign=6102fc4961e311e3e2e16e234ed895be&ga=http%3A%2F%2Fapi-v2.mall.hichao.com&source=mxyc_adr&version=6.6.3.32" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (dic) {
            
            NSArray *arr = dic[@"response"][@"data"][@"items"];
            for (NSDictionary *tempDic in arr) {
                TableHeaderViewModel *model = [[TableHeaderViewModel alloc] initModelWithDic:tempDic[@"component"]];
                [bottomDateArr addObject:model];
            }
            
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    //获得表头顶部信息
    [_manager GET:@"http://api-v2.mall.hichao.com/mall/banner?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=EBB6B049-DBD7-42BE-89D2-CA16127B0EBE&gs=1536x2048&gos=9.2.1&access_token=rGus348gpvMnPuIitmg-36Pp2YP8b_L_I5sPEaoOyIA" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
        //        NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (dic) {
            
            NSArray *arr = dic[@"data"][@"items"];
            for (NSDictionary *tempDic in arr) {
                TableHeaderViewModel *model = [[TableHeaderViewModel alloc] initModelWithDic:tempDic[@"component"]];
                [topDataArr addObject:model];
            }
            
            if (myBlock) {
                myBlock(topDataArr,bottomDateArr);
            }
            
        }
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
}

//获取各个管的数据
+ (void)getAllOfHoldDataWithURL:(NSString *)url withBlock:(void(^)(NSArray *dataArr))myblock{
    [HttpManager getManager];
    [_manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (dic) {
            NSMutableArray *dataArr = [NSMutableArray array];
            NSDictionary *rootDic = dic[@"data"];
            
            /*------------------------馆中分四个部分   创建四个数组分别存放数据--------------------------*/
            
            //馆名数据数组
            NSMutableArray *nameArr = [NSMutableArray array];
            NSArray *nameTempArr = rootDic[@"region_name"];
            TableHeaderViewModel *nameModel = [[TableHeaderViewModel alloc] initModelWithDic:[nameTempArr lastObject][@"component"]];
//            NSLog(@"请求中%@",nameModel.picUrl);
//            NSLog(@"gao %.f",nameModel.curHeight);
            [nameArr addObject:nameModel];
            [dataArr addObject:nameArr];
            
            //馆中品牌数据数组
            NSMutableArray *brandsArr = [NSMutableArray array];
            NSArray *brandsTempArr = rootDic[@"region_brands"];
            for (NSDictionary *tempDic in brandsTempArr) {
                TableHeaderViewModel *brandsModel = [[TableHeaderViewModel alloc] initModelWithDic:tempDic[@"component"]];
                [brandsArr addObject:brandsModel];
            }
            [dataArr addObject:brandsArr];
            
            //馆中中部大图片数据信息
            NSMutableArray *picturesArr = [NSMutableArray array];
            NSArray *picturesTempArr = rootDic[@"region_pictures"];
            for (NSDictionary *tempDic in picturesTempArr) {
                TableHeaderViewModel *picturesModel = [[TableHeaderViewModel alloc] initModelWithDic:tempDic[@"component"]];
                [picturesArr addObject:picturesModel];
            }
            [dataArr addObject:picturesArr];
            
            //馆中库存数据信息
            NSMutableArray *skusArr = [NSMutableArray array];
            NSArray *skusTempArr = rootDic[@"region_skus"];
            for (NSDictionary *tempDic in skusTempArr) {
                TableHeaderViewModel *skusModel = [[TableHeaderViewModel alloc] initModelWithDic:tempDic[@"component"]];
                [skusArr addObject:skusModel];
            }
            [dataArr addObject:skusArr];
            
            if (myblock) {
//                NSLog(@"dataArr===%ld",dataArr.count);
                myblock(dataArr);
            }
            
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

//获取最后cell上的数据
+ (void)getBottomGoodsDataWithURl:(NSString *)url withBlock:(void(^)(NSArray *dataArr))myblock{
    
    [HttpManager getManager];
    [_manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (dic) {
            
            NSMutableArray *dataArr = [NSMutableArray array];
            NSArray *arr = dic[@"data"][@"items"];
            for (NSDictionary *tempDic in arr) {
                
                TableViewCellModel *model = [[TableViewCellModel alloc] initModelWithDic:tempDic];
                [dataArr addObject:model];
                
            }
            if (myblock) {
                myblock(dataArr);
            }
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

}

//获取社区表头信息请求的方法
+ (void)getCommunitHeadViewDataWithBlock:(void(^)(NSArray *dataArr))myBlock{
    [HttpManager getManager];
    [_manager GET:@"http://api-v2.mall.hichao.com/forum/banner?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=377BD2CF-3DEA-46A4-8BE2-2B65FDA4E94C&gs=640x1136&gos=9.3.1&access_token=" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (dic) {
            NSMutableArray *dataArr = [NSMutableArray array];
            NSArray *arr = dic[@"data"][@"items"];
            for (NSDictionary *tempDic in arr) {
                TableHeaderViewModel *model = [[TableHeaderViewModel alloc] initModelWithDic:tempDic[@"component"]];
                [dataArr addObject:model];
            }
            if (myBlock) {
                myBlock(dataArr);
            }
            
        }
        
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
}

//获取社区cell的信息
+ (void)getCommunitCellDataWithBlock:(void(^)(NSArray *dataArr))myBlock{
    [HttpManager getManager];
    [_manager GET:@"http://api-v2.mall.hichao.com/forum/timeline?nav_id=5&nav_name=%E7%83%AD%E9%97%A8&flag=&user_id=&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=377BD2CF-3DEA-46A4-8BE2-2B65FDA4E94C&gs=640x1136&gos=9.3.1&access_token=" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        if (dic) {
//            NSMutableArray *dataArr = [NSMutableArray array];
            
            NSDictionary *dataDic = dic[@"data"];
            NSArray *itemsArr = dataDic[@"items"];
            NSLog(@"itemsArr======%ld",itemsArr.count);
            if (myBlock) {
                myBlock(itemsArr);
            }
            
        }
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
    }];
}




@end
