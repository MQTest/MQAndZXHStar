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
+ (void)getTableViewHeaderViewDataWithBlock:(void(^)(NSArray *dataArr))myBlock;
//获取表头数据限时数据
+ (void)getTableViewHeaderViewTimeLimitDataWithBlock:(void(^)(NSArray *dataArr))myBlock;




@end
