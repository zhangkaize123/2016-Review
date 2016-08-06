//
//  ZKZTabViewController.m
//  新浪博客框架搭建
//
//  Created by 张凯泽 on 15-4-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZTabViewController.h"
#import "HomeTableViewController.h"
#import "MessgeTableViewController.h"
#import "DiscoverTableViewController.h"
#import "MeTableViewController.h"
#import "UIImage+ZKZImage.h"
#import "ZKZTabbar.h"//自定义Tabbar
#import "ZKZNavigationController.h"//自定义导航控制器
@interface ZKZTabViewController ()<ZKZTabbardelegate>
@property(nonatomic,weak)ZKZTabbar *customTabBar;
@end

@implementation ZKZTabViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    //初始化tabbar
    [self setupTabbar];
    //初始化所有的子控件
    [self setupAllChildViewController];
    

}
#pragma mark----初始化tabbar
-(void)setupTabbar
{
    ZKZTabbar *customTabBar=[[ZKZTabbar alloc]init];
    customTabBar.delegate=self;
    customTabBar.frame=self.tabBar.bounds;
    [self.tabBar addSubview:customTabBar];
    self.customTabBar=customTabBar;
    
    
}
#pragma mark----ZKZTabbar里的代理方法
-(void)tabBar:(ZKZTabbar *)tabbar didSelectedButtonFrom:(int)from to:(int)to
{
    //选中的控制器
    self.selectedIndex=to;
}
#pragma mark------删除原来UITabBar里边的UITabBarButton
-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    for (UIView *child in self.tabBar.subviews) {
        //UITabBarButton 的父类是UIControl
        if ([child isKindOfClass:[UIControl class]]) {
            //删除原来UITabBar里边的UITabBarButton
            [child removeFromSuperview];
            
        }
    }
}
#pragma mark----初始化所有子控制器
-(void)setupAllChildViewController
{
    //首页
    HomeTableViewController *home=[[HomeTableViewController alloc]init];
    [self setupChildViewController:home title:@"首页" imageName:@"tabbar_home" selectedimageName:@"tabbar_home_selected"];
    //消息
    MessgeTableViewController *message=[[MessgeTableViewController alloc]init];
    [self setupChildViewController:message title:@"消息" imageName:@"tabbar_message_center" selectedimageName:@"tabbar_message_center_selected"];
    //广场
    DiscoverTableViewController *discover=[[DiscoverTableViewController alloc]init];
    [self setupChildViewController:discover title:@"广场" imageName:@"tabbar_discover" selectedimageName:@"tabbar_discover_selected"];
    //我
    MeTableViewController *me=[[MeTableViewController alloc]init];
    [self setupChildViewController:me title:@"我" imageName:@"tabbar_profile" selectedimageName:@"tabbar_profile_selected"];
    
}
#pragma mark----初始化一个子控制器
//初始化一个子控制器
-(void)setupChildViewController:(UIViewController *)vc title:(NSString *)name imageName:(NSString *)imageName selectedimageName:(NSString *)selectName
{
    //设置属性
    vc.title=name;
    vc.tabBarItem.image=[UIImage imageWithName:imageName];
    UIImage *selectedImage=[UIImage imageWithName:selectName];
    if (IOS7) {
        vc.tabBarItem.selectedImage=[selectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    }
    else{
        //ios6 没有渲染颜色
        vc.tabBarItem.selectedImage=selectedImage;
    }
    //不需要渲染
    vc.tabBarItem.selectedImage=[[UIImage imageWithName:selectName]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    //包装导航控制器---自定义导航控制器
    ZKZNavigationController *homenav=[[ZKZNavigationController alloc]initWithRootViewController:vc];
    //添加到tab里边去
    [self addChildViewController:homenav];
    //添加自定义tabbar里边的空间
    [self.customTabBar addTabBarButtonWith:vc.tabBarItem];
    
}

@end
