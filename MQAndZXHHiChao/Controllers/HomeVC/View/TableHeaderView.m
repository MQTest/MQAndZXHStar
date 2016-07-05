//
//  TableHeaderView.m
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/4.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import "TableHeaderView.h"
#import "TableHeaderViewModel.h"

typedef enum : NSUInteger {
    TopScrollViewButtonTag = 20,

} TOPScrollViewButtonTag;

@interface TableHeaderView ()<UIScrollViewDelegate>{
    NSArray *_arr;
    UIScrollView *_topScrollView;
    UIPageControl *_pageCon;
}

@property (nonatomic, strong)TableHeaderViewModel *model;


@end


@implementation TableHeaderView

- (instancetype)initWithFrame:(CGRect)frame withDataArr:(NSArray *)arr
{
    self = [super initWithFrame:frame];
    if (self) {
        _arr = arr;
        self.backgroundColor = MQGlobalBg;
        [self createView];
    }
    return self;
}

- (void)createView{
    
    // 表头顶部scrollView
    //为了获取不失真图片的高度
    TableHeaderViewModel *model = _arr[0];
    UIScrollView *topScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kMainBoundsW, model.curHeight)];
    topScrollView.delegate = self;
    topScrollView.pagingEnabled = YES;
    topScrollView.showsHorizontalScrollIndicator = NO;
    topScrollView.contentSize = CGSizeMake(kMainBoundsW * _arr.count, 0);
    
    [self addSubview:topScrollView];
    _topScrollView = topScrollView;
    
    for (NSInteger i = 0; i < _arr.count; i++) {
        TableHeaderViewModel *model = _arr[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(kMainBoundsW * i, 0, kMainBoundsW, model.curHeight);
        button.tag = TopScrollViewButtonTag + i;
        [button addTarget:self action:@selector(topScrollViewButton:) forControlEvents:UIControlEventTouchUpInside];
//        NSLog(@"%@",model.picUrl);
        [button sd_setBackgroundImageWithURL:[NSURL URLWithString:model.picUrl] forState:UIControlStateNormal];
        [topScrollView addSubview:button];
        
    }
    
    [self initPageControll];
    
    //表头限时的button
    
    for (NSInteger i = 0; i < 2; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.cornerRadius = 10;
        button.clipsToBounds = YES;
        button.frame = CGRectMake(15 + (kMainBoundsW/2 - 20 + 10)*(i%2), _topScrollView.frame.size.height + 10, (kMainBoundsW - 40)/2, kMainBoundsH - _topScrollView.frame.size.height - 20 - 64 - 49);
        button.backgroundColor = [UIColor redColor];
        [self addSubview:button];
    }
    
}

- (void)initPageControll{
    UIPageControl *pageCon = [[UIPageControl alloc] initWithFrame:CGRectMake(kMainBoundsW/2 - 50, _topScrollView.frame.size.height - 30, 100, 10)];
    pageCon.numberOfPages = _arr.count;
    pageCon.pageIndicatorTintColor = [UIColor whiteColor];
    pageCon.currentPageIndicatorTintColor = [UIColor redColor];
    [self addSubview:pageCon];
    _pageCon = pageCon;
}

- (void)topScrollViewButton:(UIButton *)sender{
    NSLog(@"buttonTag = %ld",sender.tag - 20);
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger curX = scrollView.contentOffset.x/kMainBoundsW;
    _pageCon.currentPage = curX;
}

@end
