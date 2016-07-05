//
//  HttpManager.m
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/4.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import "HttpManager.h"
#import "TableHeaderViewModel.h"


 static AFHTTPSessionManager *_manager;



@implementation HttpManager


+ (void)getManager{
    _manager = [AFHTTPSessionManager manager];
    _manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    _manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html",@"application/json", nil];
}

//获取表头数据推荐数据
+ (void)getTableViewHeaderViewDataWithBlock:(void(^)(NSArray *dataArr))myBlock{
    NSMutableArray *dataArr = [NSMutableArray array];
    [HttpManager getManager];
    [_manager GET:@"http://api-v2.mall.hichao.com/mall/banner?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=EBB6B049-DBD7-42BE-89D2-CA16127B0EBE&gs=1536x2048&gos=9.2.1&access_token=rGus348gpvMnPuIitmg-36Pp2YP8b_L_I5sPEaoOyIA" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
//        NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (dic) {
            NSMutableArray *topScrollArr = [NSMutableArray array];
            NSArray *arr = dic[@"data"][@"items"];
            for (NSDictionary *tempDic in arr) {
                TableHeaderViewModel *model = [[TableHeaderViewModel alloc] initModelWithDic:tempDic[@"component"]];
                [topScrollArr addObject:model];
            }
            [dataArr addObject:topScrollArr];
            if (myBlock) {
                myBlock(dataArr);
            }
            
        }
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    [_manager GET:@"http://api-v2.mall.hichao.com/active/flash/list?method=%2Factive%2Fflash%2Flist&data=eyJnYSI6Imh0dHA6Ly9hcGktdjIubWFsbC5oaWNoYW8uY29tIn0%3D&sign=6102fc4961e311e3e2e16e234ed895be&ga=http%3A%2F%2Fapi-v2.mall.hichao.com&source=mxyc_adr&version=6.6.3.32" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        if (dic) {
            NSArray *arr = dic[@"response"][@"data"][@"items"];
            for (NSDictionary *tempDic in arr) {
                TableHeaderViewModel *model = [[TableHeaderViewModel alloc] initModelWithDic:tempDic[@"component"]];
                [dataArr addObject:model];
            }
        }
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
    
    
}

//获取表头数据限时数据
+ (void)getTableViewHeaderViewTimeLimitDataWithBlock:(void(^)(NSArray *dataArr))myBlock{
    [HttpManager getManager];
    [_manager GET:@"http://api-v2.mall.hichao.com/active/flash/list?method=%2Factive%2Fflash%2Flist&data=eyJnYSI6Imh0dHA6Ly9hcGktdjIubWFsbC5oaWNoYW8uY29tIn0%3D&sign=6102fc4961e311e3e2e16e234ed895be&ga=http%3A%2F%2Fapi-v2.mall.hichao.com&source=mxyc_adr&version=6.6.3.32" parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",[[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}




@end
