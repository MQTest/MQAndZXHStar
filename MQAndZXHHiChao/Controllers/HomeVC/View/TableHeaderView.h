//
//  TableHeaderView.h
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/4.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableHeaderView : UIView

//初始化方法
- (instancetype)initWithFrame:(CGRect)frame withTopDataArr:(NSArray *)topDataArr withBottomDataArr:(NSArray *)bottomDataArr;

//按钮返回的block
- (void)scrollViewButtonClick:(CallBackMessageBlock)buttonBlock;


@end
