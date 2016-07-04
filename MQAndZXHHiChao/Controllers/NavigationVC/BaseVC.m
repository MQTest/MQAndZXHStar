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
    UIButton *_rightButton;
    
}


@property (nonatomic, copy)Callback blockHandle;

@end

typedef enum : NSUInteger {
    LeftButtonTag = 10,
    RightButtonTag,
} NavButtonTag;


@implementation BaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationController.navigationBarHidden = YES;
    self.view.backgroundColor = [UIColor redColor];
    
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

- (void)buttonCallBackBlock:(Callback)buttonBlock{
    self.blockHandle = buttonBlock;
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
