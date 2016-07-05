//
//  TableHeaderViewModel.h
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/4.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableHeaderViewModel : NSObject

@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, copy)NSString *picUrl;
@property (nonatomic, copy)NSString *img_index;
@property (nonatomic,copy)NSString *origin_price;
@property (nonatomic,copy)NSString *price;


@property (nonatomic, assign)CGFloat curHeight;



- (instancetype)initModelWithDic:(NSDictionary *)dic;

@end
