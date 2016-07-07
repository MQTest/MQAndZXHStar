//
//  GoodsSectionHeaderView.m
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/6.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import "GoodsSectionHeaderView.h"

@interface GoodsSectionHeaderView (){
    UIView *_bgView;
    UILabel *_lineLabel;
    NSInteger _oldTag;
}


@property (nonatomic, strong)NSArray *titleArr;
@property (nonatomic, copy)CallBackMessageBlock buttonBlock;

@end

@implementation GoodsSectionHeaderView



- (instancetype)initWithFrame:(CGRect)frame withTitleArr:(NSArray *)titleArr
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleArr = [NSArray arrayWithArray:titleArr];
        
    }
    return self;
}


- (void)setCount:(NSInteger)count{
    if (_count != count) {
        _count = count;
        
        [self setNeedsLayout];
    }
}


- (void)layoutSubviews{
    [super layoutSubviews];
    [self createView];
}


- (void)createView{
//    NSLog(@"1");
    
    UIView *bgView = [[UIView alloc] initWithFrame:self.frame];
    [self addSubview:bgView];
    _bgView = bgView;
    
    for (NSInteger i = 0; i < 4; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(kMainBoundsW/4*i, 0, kMainBoundsW/4, self.frame.size.height - 2);
        button.tag = TodayButtonTag + i;
        button.backgroundColor = [UIColor whiteColor];
        [button setTitle:self.titleArr[i] forState:UIControlStateNormal];
        [button setFont:[UIFont systemFontOfSize:15]];
        if (i == self.count) {
            button.selected = YES;
        }
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [button addTarget:self action:@selector(getGoods:) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:button];
        
        
    }
//    UILabel *lineLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, self.frame.size.height - 2, kMainBoundsW/4, 2)];
//    lineLabel.backgroundColor = [UIColor redColor];
//    [bgView addSubview:lineLabel];
//    _lineLabel = lineLabel;
//    
    
}

- (void)getGoods:(UIButton *)sender{
    
    NSInteger NewTag = sender.tag - TodayButtonTag;
    
    if (sender.selected) {
        
    }else{
        sender.selected = YES;
        UIButton *oldBtn = [self viewWithTag:_oldTag + TodayButtonTag];
        oldBtn.selected = NO;
        if (self.buttonBlock) {
            self.buttonBlock(sender);
        }
    }
     _oldTag = NewTag;
//    [UIView animateWithDuration:0.5 animations:^{
//       _lineLabel.frame = CGRectMake(kMainBoundsW/4 * self.count, 40, kMainBoundsW/4, 2);
//    }];
    
    
}

- (void)setAllDefault{
    [_bgView removeFromSuperview];
    _bgView = nil;
    [self createView];
}



- (void)buttonSendMessage:(CallBackMessageBlock)buttonBlock{
    if (buttonBlock) {
        self.buttonBlock = buttonBlock;
    }
}

@end
