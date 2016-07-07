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

//设置左按钮
- (void)setLeftButtonWithTitle:(NSString *)title andIamge:(NSString *)image andSpace:(CGFloat)space;

//设置右按钮
- (void)setRightButtonWithTitle:(NSString *)title andIamge:(NSString *)image andSpace:(CGFloat)space;

//设置中间按钮
- (void)setMidButtonWithTitle:(NSString *)title andIamge:(NSString *)image andSpace:(CGFloat)space;



@property (nonatomic, strong)UIView *mqLeftView;
@property (nonatomic, strong)UIView *mqTitleView;
@property (nonatomic, strong)UIView *mqRightView;


@end
