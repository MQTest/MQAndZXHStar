//
//  GuideVC.m
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/4.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import "GuideVC.h"
#import "TabBarVC.h"


@interface GuideVC ()<UIScrollViewDelegate>{
    UIScrollView *_guideScroll;
    UIPageControl *_pageCon;
}

@end

@implementation GuideVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self initView];
}

#pragma mark- 初始化视图
- (void)initView{
    UIScrollView *guideScroll = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    guideScroll.pagingEnabled = YES;
    guideScroll.showsHorizontalScrollIndicator = NO;
    guideScroll.bounces = NO;
    guideScroll.contentSize = CGSizeMake(kMainBoundsW*4, kMainBoundsH);
    guideScroll.delegate = self;
    [self.view addSubview:guideScroll];
    for (NSInteger i = 0; i<4; i++) {
        UIImageView *bgImage = [[UIImageView alloc] initWithFrame:CGRectMake(kMainBoundsW*i, 0, kMainBoundsW, kMainBoundsH)];
        bgImage.image = [UIImage imageNamed:[NSString stringWithFormat:@"960-640-%ld-1.jpg",i+1]];
        [guideScroll addSubview:bgImage];
        
        UIImageView *image = [[UIImageView alloc] initWithFrame:CGRectMake(kMainBoundsW*i, 0, kMainBoundsW, kMainBoundsH)];
        image.image = [UIImage imageNamed:[NSString stringWithFormat:@"960-640-%ld.png",i+1]];
        [guideScroll addSubview:image];
        image.userInteractionEnabled = YES;
        
        if (i==3) {
            NSLog(@"3");
            UIButton *beginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
            beginBtn.frame = CGRectMake(kMainBoundsW/2-70, kMainBoundsH-80, 140, 40);
            beginBtn.backgroundColor = [UIColor clearColor];
            [beginBtn addTarget:self action:@selector(goToTabBar:) forControlEvents:UIControlEventTouchUpInside];
            [image addSubview:beginBtn];
        }
    }
    
    UIPageControl *pageCon = [[UIPageControl alloc] initWithFrame:CGRectMake(kMainBoundsW/2-100, kMainBoundsH-120, 200, 10)];
    pageCon.numberOfPages = 4;
    pageCon.currentPageIndicatorTintColor = [UIColor blueColor];
    pageCon.pageIndicatorTintColor = [UIColor whiteColor];
    pageCon.userInteractionEnabled = YES;
    [self.view addSubview:pageCon];
    
    _guideScroll = guideScroll;
    _pageCon = pageCon;
    
    
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    NSInteger currentpage = scrollView.contentOffset.x/kMainBoundsW;
    _pageCon.currentPage = currentpage;
    
}
- (void)goToTabBar:(UIButton *)sender{
    NSLog(@"1");
    TabBarVC *tabBar = [[TabBarVC alloc] init];
    self.view.window.rootViewController = tabBar;
    [[NSUserDefaults standardUserDefaults] setObject:@"YES" forKey:@"isFirst"];
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
