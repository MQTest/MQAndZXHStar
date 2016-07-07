//
//  BaseVC.m
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/4.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import "BaseVC.h"

@interface BaseVC (){
    
    UILabel *_titleLabel;
    UIButton *_leftButton;
    UIButton *_midButton;
    UIButton *_rightButton;
    
}


@property (nonatomic, copy)Callback blockHandle;

@end

//typedef enum : NSUInteger {
//    LeftButtonTag = 10,
//    MidButtonTag,
//    RightButtonTag,
//} NavButtonTag;


@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createView];
}

#pragma mark- 创建视图
- (void)createView{

    UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kMainBoundsW, 64)];
    bgView.backgroundColor = MQColor(250, 250, 250);
    [self.view addSubview:bgView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
    label.font = [UIFont systemFontOfSize:20];
    label.textAlignment = NSTextAlignmentCenter;
    [bgView addSubview:label];
    _titleLabel = label;
    
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    leftBtn.frame = CGRectZero;
    [leftBtn addTarget:self action:@selector(leftBtn:) forControlEvents:UIControlEventTouchUpInside];
    leftBtn.tag = LeftButtonTag;
    [bgView addSubview:leftBtn];
    _leftButton = leftBtn;
    
    UIButton *midBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    midBtn.frame = CGRectZero;
    [midBtn addTarget:self action:@selector(midBtn:) forControlEvents:UIControlEventTouchUpInside];
    midBtn.tag = MidButtonTag;
    [bgView addSubview:midBtn];
    _midButton = midBtn;
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    rightBtn.frame = CGRectZero;
    [rightBtn addTarget:self action:@selector(rightBtn:) forControlEvents:UIControlEventTouchUpInside];
    rightBtn.tag = RightButtonTag;
    [bgView addSubview:rightBtn];
    _rightButton = rightBtn;
    
    
}

#pragma mark- 设置标题
- (void)setNavTitle:(NSString *)title leftTitle:(NSString *)leftTitle rightTitle:(NSString *)rightTitle{
    if (title == nil && leftTitle == nil && rightTitle == nil) {
        return;
    }
    if (title) {
        _titleLabel.frame = CGRectMake(50, 27, kMainBoundsW - (30 + 10 + 10)*2, 30);
        _titleLabel.text = title;
    }
    [self setButtonWithTitle:leftTitle andButton:_leftButton];
    [self setButtonWithTitle:rightTitle andButton:_rightButton];
    
}

#pragma mark- 设置button
- (void)setButtonWithTitle:(NSString *)title andButton:(UIButton *)button{
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    if ([title hasSuffix:@"png"] || [title hasSuffix:@"jpg"] || [title hasSuffix:@"jpeg"]) {
        
        [button setBackgroundImage:[UIImage imageNamed:title] forState:UIControlStateNormal];
        
    }else{
        [button setTitle:title forState:UIControlStateNormal];
    }
    if ([button isEqual:_leftButton]) {
        button.frame = CGRectMake(10, 27, 30, 30);
    }else{
        button.frame = CGRectMake(kMainBoundsW - 40, 27, 30, 30);
    }
}
//设置左按钮
- (void)setLeftButtonWithTitle:(NSString *)title andIamge:(NSString *)image andSpace:(CGFloat)space{
    if (title == nil && image == nil) {
        return;
    }
    _leftButton.frame = CGRectMake(10, 27, 30, 30);
    [_leftButton setTitle:title forState:UIControlStateNormal];
    [_leftButton setFont:[UIFont systemFontOfSize:10]];
    [_leftButton setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [_leftButton setImage: [UIImage imageNamed:image] forState:UIControlStateNormal];
    //图片在上
    [_leftButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:space];
    
    
}

//设置右按钮
- (void)setRightButtonWithTitle:(NSString *)title andIamge:(NSString *)image andSpace:(CGFloat)space{
    if (title == nil && image == nil) {
        return;
    }
    _rightButton.frame = CGRectMake(kMainBoundsW - 40, 27, 30, 30);
    [_rightButton setTitle:title forState:UIControlStateNormal];
    [_rightButton setFont:[UIFont systemFontOfSize:10]];
    [_rightButton setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [_rightButton setImage: [UIImage imageNamed:image] forState:UIControlStateNormal];
     //图片在上
    [_rightButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleTop imageTitleSpace:space];
}
 
//设置中间Button
- (void)setMidButtonWithTitle:(NSString *)title andIamge:(NSString *)image andSpace:(CGFloat)space{
    if (title == nil && image == nil) {
        return;
    }
    _midButton.frame = CGRectMake(55, 27, kMainBoundsW - 110, 30);
    _midButton.layer.cornerRadius = 10;
    _midButton.clipsToBounds = YES;
    _midButton.backgroundColor = MQColor(235, 235, 235);
    [_midButton setTitle:title forState:UIControlStateNormal];
    [_midButton setFont:[UIFont systemFontOfSize:14]];
    [_midButton setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
    [_midButton setImage: [UIImage imageNamed:image] forState:UIControlStateNormal];
     //图片在左
    [_midButton layoutButtonWithEdgeInsetsStyle:MKButtonEdgeInsetsStyleLeft imageTitleSpace:space];

    
}


#pragma mark- 按钮点击事件

- (void)leftBtn:(UIButton *)sender{

    if (self.blockHandle) {
        self.blockHandle(sender);
    }
}

- (void)rightBtn:(UIButton *)sender{
    if (self.blockHandle) {
        self.blockHandle(sender);
    }
}

- (void)midBtn:(UIButton *)sender{
    if (self.blockHandle) {
        self.blockHandle(sender);
    }
}

- (void)buttonCallBackBlock:(Callback)buttonBlock{
    if (buttonBlock) {
        self.blockHandle = buttonBlock;
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
