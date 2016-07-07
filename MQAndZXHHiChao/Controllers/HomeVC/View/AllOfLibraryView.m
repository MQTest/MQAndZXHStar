//
//  AllOfLibraryView.m
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/5.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import "AllOfLibraryView.h"
#import "TableHeaderViewModel.h"
@interface AllOfLibraryView ()<UIScrollViewDelegate>{
    NSArray *_dataArr;
    NSInteger _index;
    UIScrollView *_picturesScroll;
    UIPageControl *_pageCon;
}

@end

@implementation AllOfLibraryView

- (instancetype)initWithFrame:(CGRect)frame withDataArr:(NSArray *)dataArr andIndex:(NSInteger)index
{
    self = [super initWithFrame:frame];
    if (self) {
        _dataArr = dataArr;
        _index = index;
        self.backgroundColor = MQGlobalBg;
        [self createViews];
    }
    return self;
}

- (void)createViews{
    
    if (_dataArr.count != 0) {
        NSArray *libraryArr = [NSArray arrayWithArray:_dataArr[_index]];
        
        //馆中顶部馆名button
        UIButton *nameButton = [UIButton buttonWithType:UIButtonTypeCustom];
        TableHeaderViewModel *nameModel = libraryArr[0][0];
        nameButton.frame = CGRectMake(0, 0, kMainBoundsW, nameModel.curHeight);
        [nameButton sd_setBackgroundImageWithURL:[NSURL URLWithString:nameModel.picUrl] forState:UIControlStateNormal];
        [self addSubview:nameButton];
        
        //馆中品牌ScrollView
        TableHeaderViewModel *brandsModel = libraryArr[1][0];
        CGFloat height = nameModel.curHeight - 20;
        CGFloat weight = height/brandsModel.height * brandsModel.width;
        
        UIScrollView *brandsScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, nameModel.curHeight + 1, kMainBoundsW,nameModel.curHeight)];
        brandsScroll.backgroundColor = [UIColor whiteColor];
        brandsScroll.showsHorizontalScrollIndicator = NO;
        brandsScroll.contentSize = CGSizeMake((weight + 10)* [libraryArr[1] count] + 10, 0);
        [self addSubview:brandsScroll];
        
        for (NSInteger i = 0; i < [libraryArr[1] count]; i++) {
            TableHeaderViewModel *model = libraryArr[1][i];
            UIButton *brandsBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            brandsBtn.frame = CGRectMake(10 + (weight + 10)*i, 10, weight, height);
            [brandsBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:model.picUrl] forState:UIControlStateNormal];
            [brandsScroll addSubview:brandsBtn];
        }
        
        //馆中大图片ScrollView
        TableHeaderViewModel *picturesModel = libraryArr[2][0];
        UIScrollView *picturesScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, nameModel.curHeight * 2 + 2, kMainBoundsW, picturesModel.curHeight)];
        picturesScroll.pagingEnabled = YES;
        picturesScroll.showsHorizontalScrollIndicator = NO;
        picturesScroll.delegate = self;
        picturesScroll.contentSize = CGSizeMake(kMainBoundsW * [libraryArr[2] count], 0);
        picturesScroll.tag = 10000;
        [self addSubview:picturesScroll];
        _picturesScroll = picturesScroll;
        
        for (NSInteger i = 0; i < [libraryArr[2] count]; i++) {
            TableHeaderViewModel *model = libraryArr[2][i];
            UIButton *pictureBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            pictureBtn.frame = CGRectMake(kMainBoundsW * i, 0, kMainBoundsW, picturesModel.curHeight);
            [pictureBtn sd_setBackgroundImageWithURL:[NSURL URLWithString:model.picUrl] forState:UIControlStateNormal];
            [picturesScroll addSubview:pictureBtn];
        }
        [self initPageControll];
        
        //馆中库存ScrollView
        CGFloat viewWidth = (kMainBoundsW - 40)/3.5;
        UIScrollView *skusScroll = [[UIScrollView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(picturesScroll.frame), kMainBoundsW, self.frame.size.height - CGRectGetMaxY(picturesScroll.frame) - 10)];
        skusScroll.backgroundColor = [UIColor whiteColor];
        skusScroll.showsHorizontalScrollIndicator = NO;
        skusScroll.contentSize = CGSizeMake((10 + viewWidth) * [libraryArr[3] count], 0);
        [self addSubview:skusScroll];
        
        for (NSInteger i = 0; i < [libraryArr[3] count]; i++) {
            TableHeaderViewModel *model = libraryArr[3][i];
            //
            UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(10 + (viewWidth + 10)*i, 0, viewWidth, skusScroll.frame.size.height)];
//            bgView.backgroundColor = [UIColor cyanColor];
            [skusScroll addSubview:bgView];
            
            
            //图片
            UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 10, viewWidth, viewWidth)];
            [imageView sd_setImageWithURL:[NSURL URLWithString:model.picUrl]];
            [bgView addSubview:imageView];
            
            //标题
            UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, viewWidth + 20, viewWidth, 20)];
            titleLabel.text = model.title;
//            titleLabel.backgroundColor = [UIColor yellowColor];
            titleLabel.textAlignment = NSTextAlignmentCenter;
            titleLabel.font = [UIFont systemFontOfSize:10];
            [bgView addSubview:titleLabel];
            
            //现价
            UILabel *priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, viewWidth + 40, viewWidth, 30)];
            priceLabel.text = [NSString stringWithFormat:@"¥%@",model.price];
//            priceLabel.backgroundColor = [UIColor yellowColor];
            priceLabel.textColor = [UIColor redColor];
            priceLabel.textAlignment =NSTextAlignmentCenter;
            priceLabel.font = [UIFont systemFontOfSize:18];
            [bgView addSubview:priceLabel];
            
            //原价
            UILabel *origin_priceLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, viewWidth + 70, viewWidth, 20)];
            origin_priceLabel.text = [NSString stringWithFormat:@"¥%@",model.origin_price];
//            origin_priceLabel.backgroundColor = [UIColor yellowColor];
            origin_priceLabel.textAlignment =NSTextAlignmentCenter;
            origin_priceLabel.font = [UIFont systemFontOfSize:12];
            origin_priceLabel.textColor = [UIColor lightGrayColor];
            [bgView addSubview:origin_priceLabel];
            
            //原价的字符的长度
            CGSize priceSize = [origin_priceLabel.text boundingRectWithSize:CGSizeMake(viewWidth, 0) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:10]} context:nil].size;
//            NSLog(@"width===%.f",priceSize.width);
            UILabel *lineLabel = [[UILabel alloc] init];
            lineLabel.bounds = CGRectMake(0, 0, priceSize.width, 1);
            lineLabel.backgroundColor = [UIColor lightGrayColor];
            lineLabel.center = origin_priceLabel.center;
            [bgView addSubview:lineLabel];
 
        }
        
        
 
    }
    
    
    
    
    
}

#pragma mark- PageControll
- (void)initPageControll{

    UIPageControl *pageCon = [[UIPageControl alloc] initWithFrame:CGRectMake(kMainBoundsW/2 - 50, _picturesScroll.frame.size.height + _picturesScroll.frame.origin.y - 20, 100, 10)];
    pageCon.numberOfPages = [_dataArr[_index][2] count];
    pageCon.pageIndicatorTintColor = [UIColor whiteColor];
    pageCon.currentPageIndicatorTintColor = [UIColor redColor];
    [self addSubview:pageCon];
    _pageCon = pageCon;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    if (scrollView.tag == 10000) {
        NSInteger curX = scrollView.contentOffset.x/kMainBoundsW;
        _pageCon.currentPage = curX;
    }
   
}


@end
