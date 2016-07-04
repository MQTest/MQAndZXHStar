//
//  BaseVC.h
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/4.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^Callback)(UIButton *button);

@interface BaseVC : UIViewController


- (void)setNavTitle:(NSString *)title leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle;

//按钮点击回调的block方法
- (void)buttonCallBackBlock:(Callback)buttonBlock;

@end
