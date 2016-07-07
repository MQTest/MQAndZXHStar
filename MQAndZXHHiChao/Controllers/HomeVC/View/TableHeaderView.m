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
    NSMutableArray *_topArr;
    NSMutableArray *_bottomArr;
    UIScrollView *_topScrollView;
    UIPageControl *_pageCon;
}

@property (nonatomic, copy)CallBackMessageBlock buttonBlock;

@end



@implementation TableHeaderView

- (instancetype)initWithFrame:(CGRect)frame withTopDataArr:(NSArray *)topDataArr withBottomDataArr:(NSArray *)bottomDataArr
{
    self = [super initWithFrame:frame];
    if (self) {
        _topArr = [NSMutableArray arrayWithArray:topDataArr];
//        NSLog(@"数组1====%ld",topDataArr.count);
//        NSLog(@"数组2====%ld",bottomDataArr.count);
        _bottomArr = [NSMutableArray arrayWithArray:bottomDataArr];
        self.backgroundColor = MQGlobalBg;
        [self createView];
    }
    return self;
}

- (void)createView{
    
   
    
    if (_topArr) {
        
        // 表头顶部scrollView
        //为了获取不失真图片的高度
        TableHeaderViewModel *firstModel = [_topArr firstObject];
        TableHeaderViewModel *lastModel = [_topArr lastObject];
        [_topArr insertObject:lastModel atIndex:0];
        [_topArr addObject:firstModel];
        
        UIScrollView *topScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kMainBoundsW, firstModel.curHeight)];
        topScrollView.delegate = self;
        topScrollView.pagingEnabled = YES;
        topScrollView.showsHorizontalScrollIndicator = NO;
        topScrollView.contentSize = CGSizeMake(kMainBoundsW * _topArr.count, 0);
        topScrollView.contentOffset = CGPointMake(kMainBoundsW, 0);
        [self addSubview:topScrollView];
        _topScrollView = topScrollView;
        
        for (NSInteger i = 0; i < _topArr.count; i++) {
            TableHeaderViewModel *model = _topArr[i];
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            button.frame = CGRectMake(kMainBoundsW * i, 0, kMainBoundsW, model.curHeight);
            button.tag = TopScrollViewButtonTag + i;
            [button addTarget:self action:@selector(topScrollViewButton:) forControlEvents:UIControlEventTouchUpInside];
            //        NSLog(@"%@",model.picUrl);
            [button sd_setBackgroundImageWithURL:[NSURL URLWithString:model.picUrl] forState:UIControlStateNormal];
            [topScrollView addSubview:button];
            
        }
        
        [self initPageControll];
    }
    
    
    //表头限时的button
    
    for (NSInteger i = 0; i < _bottomArr.count;i++) {
        TableHeaderViewModel *model = _bottomArr[i];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.layer.cornerRadius = 10;
        button.clipsToBounds = YES;
        button.frame = CGRectMake(15 + (kMainBoundsW/2 - 20 + 10)*(i%2), _topScrollView.frame.size.height + 10, (kMainBoundsW - 40)/2, kMainBoundsH - _topScrollView.frame.size.height - 20 - 64 - 49);
        [button sd_setBackgroundImageWithURL:[NSURL URLWithString:model.img_index] forState:UIControlStateNormal];
        [self addSubview:button];
    }
    
}

#pragma mark- 创建UIPageControl
- (void)initPageControll{
    UIPageControl *pageCon = [[UIPageControl alloc] initWithFrame:CGRectMake(kMainBoundsW/2 - 50, _topScrollView.frame.size.height - 30, 100, 10)];
    pageCon.numberOfPages = _topArr.count - 2;
    pageCon.pageIndicatorTintColor = [UIColor whiteColor];
    pageCon.currentPageIndicatorTintColor = [UIColor redColor];
    [self addSubview:pageCon];
    _pageCon = pageCon;
}

#pragma mark- ScrollViewButton点击事件
- (void)topScrollViewButton:(UIButton *)sender{
    NSLog(@"222");
    
    if (self.buttonBlock) {
        self.buttonBlock(sender);
    }
}

- (void)scrollViewButtonClick:(CallBackMessageBlock)buttonBlock{
    
    if (buttonBlock) {
        NSLog(@"======block");
      self.buttonBlock = buttonBlock;
    }
    
    
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger curX = scrollView.contentOffset.x/kMainBoundsW;
    _pageCon.currentPage = curX - 1;
}

//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//    NSInteger curX = scrollView.contentOffset.x/kMainBoundsW;
//    _pageCon.currentPage = curX - 1;
//    
//    if (scrollView.contentOffset.x > kMainBoundsW * (_topArr.count - 1.5)) {
//        _pageCon.currentPage = 0;
//    }
//    if (scrollView.contentOffset.x < kMainBoundsW * 0.5) {
//        _pageCon.currentPage = _pageCon.numberOfPages - 1;
//    }
//}

- (void)dealloc{
    self.buttonBlock = nil;
    NSLog(@"dealooc=======");
}

@end
