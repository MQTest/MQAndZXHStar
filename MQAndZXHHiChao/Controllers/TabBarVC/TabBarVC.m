//
//  TabBarVC.m
//  MQAndZXHHiChao
//
//  Created by MaQi on 16/7/4.
//  Copyright © 2016年 MQ. All rights reserved.
//

#import "TabBarVC.h"
#import "HomeVC.h"
#import "CollocationVC.h"
#import "CommunityVC.h"
#import "CarVC.h"
#import "MansWearVC.h"

@interface TabBarVC ()
@property (nonatomic, strong)NSArray *iconArr;
@end

@implementation TabBarVC


//懒加载
- (NSArray *)iconArr{
    if (_iconArr == nil) {
        NSString *iconPath = [[NSBundle mainBundle] pathForResource:@"TabBarPlist.plist" ofType:nil];
        _iconArr = [NSArray arrayWithContentsOfFile:iconPath];
    }
    return _iconArr;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor redColor]} forState:UIControlStateSelected];
    self.tabBar.tintColor = [UIColor redColor];
    
    [self setItemWithVC:[HomeVC new] andIndex:0];
    [self setItemWithVC:[CollocationVC new] andIndex:1];
    [self setItemWithVC:[CommunityVC new] andIndex:2];
    [self setItemWithVC:[CarVC new] andIndex:3];
    [self setItemWithVC:[MansWearVC new] andIndex:4];
}

- (void)setItemWithVC:(UIViewController *)aVC andIndex:(NSInteger)index{
    NSDictionary *dic = self.iconArr[index];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:aVC];
    nav.tabBarItem.title = dic[@"title"];
    nav.tabBarItem.image = [UIImage imageNamed:dic[@"image"]];
    nav.tabBarItem.selectedImage = [UIImage imageNamed:dic[@"image_selected"]];
    [self addChildViewController:nav];
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
