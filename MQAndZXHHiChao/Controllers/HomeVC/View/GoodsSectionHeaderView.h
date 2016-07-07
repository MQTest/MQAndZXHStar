//
//  GoodsSectionHeaderView.h
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/6.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GoodsSectionHeaderView : UIView

@property (nonatomic, assign)NSInteger count;

- (instancetype)initWithFrame:(CGRect)frame withTitleArr:(NSArray *)titleArr;

- (void)buttonSendMessage:(CallBackMessageBlock)buttonBlock;

- (void)setAllDefault;

@end
