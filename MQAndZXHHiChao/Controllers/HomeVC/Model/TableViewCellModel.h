//
//  TableViewCellModel.h
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/5.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TableViewCellModel : NSObject

@property (nonatomic, assign)CGFloat height;
@property (nonatomic, assign)CGFloat width;
@property (nonatomic, copy)NSString *picUrl;
@property (nonatomic,copy)NSString *country;
@property (nonatomic,copy)NSString *nationalFlag;
@property (nonatomic,copy)NSString *myDescription;
@property (nonatomic,copy)NSString *price;
@property (nonatomic,copy)NSString *origin_price;
@property (nonatomic,copy)NSString *stateMessage;

@property (nonatomic, assign)CGFloat curHeight;

- (instancetype)initModelWithDic:(NSDictionary *)dic;



@end
