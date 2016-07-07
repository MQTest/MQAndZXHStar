//
//  GoodsTableViewCell.h
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/6.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TableViewCellModel.h"

@interface GoodsTableViewCell : UITableViewCell

@property (nonatomic, strong)NSMutableArray *dataArr;
@property (nonatomic, strong)NSMutableArray *indexArr;
@property (nonatomic, assign)NSInteger index;

- (void)setAllDefault;

@end
