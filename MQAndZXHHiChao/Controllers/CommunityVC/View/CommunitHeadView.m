//
//  CommunitHeadView.m
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/7.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import "CommunitHeadView.h"
#import "TableHeaderViewModel.h"
@interface CommunitHeadView ()<UIScrollViewDelegate>{
    NSMutableArray *_dataArr;
    UIScrollView *_bgScroll;
    UIPageControl *_pageCon;
}

@end

@implementation CommunitHeadView


- (instancetype)initWithFrame:(CGRect)frame withData:(NSArray *)dataArr
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataArr = [NSMutableArray arrayWithArray:dataArr];
        [self createView];
    }
    return self;
}

- (void)createView{
    
    if (_dataArr) {
        
        TableHeaderViewModel *firstModel = [_dataArr firstObject];
        TableHeaderViewModel *lastModel = [_dataArr lastObject];
        [_dataArr insertObject:lastModel atIndex:0];
        [_dataArr addObject:firstModel];
        
        UIScrollView *bgScroll = [[UIScrollView alloc] initWithFrame:self.frame];
        bgScroll.showsHorizontalScrollIndicator = NO;
        bgScroll.pagingEnabled = YES;
        bgScroll.delegate = self;
        bgScroll.contentSize = CGSizeMake(kMainBoundsW * _dataArr.count, 0);
        [self addSubview:bgScroll];
        _bgScroll = bgScroll;
        
        for (NSInteger i = 0; i < _dataArr.count; i++) {
            TableHeaderViewModel *model = _dataArr[i];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(kMainBoundsW * i, 0, kMainBoundsW, model.curHeight);
            //        button.tag = TopScrollViewButtonTag + i;
            [button addTarget:self action:@selector(topScrollViewButton:) forControlEvents:UIControlEventTouchUpInside];
            //        NSLog(@"%@",model.picUrl);
            [button sd_setBackgroundImageWithURL:[NSURL URLWithString:model.picUrl] forState:UIControlStateNormal];
            [bgScroll addSubview:button];
            
        }
        [self initPageControll];
    }
   
    
}

- (void)topScrollViewButton:(UIButton *)sender{
    
}

#pragma mark- 创建UIPageControl
- (void)initPageControll{
    UIPageControl *pageCon = [[UIPageControl alloc] initWithFrame:CGRectMake(kMainBoundsW/2 - 50, _bgScroll.frame.size.height - 30, 100, 10)];
    pageCon.numberOfPages = _dataArr.count - 2;
    pageCon.pageIndicatorTintColor = [UIColor whiteColor];
    pageCon.currentPageIndicatorTintColor = [UIColor redColor];
    [self addSubview:pageCon];
    _pageCon = pageCon;
}

#pragma mark- scrollView代理的实现
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSInteger curX = scrollView.contentOffset.x/kMainBoundsW;
    _pageCon.currentPage = curX - 1;
    if (scrollView.contentOffset.x == kMainBoundsW * (_dataArr.count - 1)) {
        _pageCon.currentPage = 0;
        scrollView.contentOffset = CGPointMake(kMainBoundsW, 0);
    }
    if (scrollView.contentOffset.x == 0) {
        _pageCon.currentPage = _pageCon.numberOfPages;
        scrollView.contentOffset = CGPointMake(kMainBoundsW * _pageCon.numberOfPages, 0);
    }
}


@end
