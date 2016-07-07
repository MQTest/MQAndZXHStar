//
//  HttpManager.h
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/4.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface HttpManager : NSObject

//获取表头数据推荐数据
+ (void)getTableViewHeaderViewDataWithBlock:(void(^)(NSArray *topDataArr,NSArray *bottomDateArr))myBlock;

//获取各个管的数据
+ (void)getAllOfHoldDataWithURL:(NSString *)url withBlock:(void(^)(NSArray *dataArr))myblock;

//获取最后cell上的数据
+ (void)getBottomGoodsDataWithURl:(NSString *)url withBlock:(void(^)(NSArray *dataArr))myblock;

@end
