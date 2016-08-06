//
//  ZKZNavigationController.m
//  新浪博客框架搭建
//
//  Created by 张凯泽 on 15-4-6.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZNavigationController.h"

@implementation ZKZNavigationController
#pragma mark-------initialize
//第一次使用这个类的时候会调用（一个类只会调用一次）
+(void)initialize
{
    //1.导行栏的主题
    [self setUpNavbarTheme];
    //按钮的主题
    [self setUpNavbarButtonTheme];
    
    
    
}
#pragma mark-----设置导行栏按钮的主题
+(void)setUpNavbarButtonTheme
{
    UIBarButtonItem *item=[UIBarButtonItem appearance];
    //设置背景
    //按钮正常状态下图片
    if(!IOS7)
    {
    [item setBackButtonBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    //按钮高亮状态下
    [item setBackButtonBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_pushed"] forState:UIControlStateHighlighted barMetrics:UIBarMetricsDefault];
    //按钮Disabled
    [item setBackButtonBackgroundImage:[UIImage imageWithName:@"navigationbar_button_background_disable"] forState:UIControlStateDisabled barMetrics:UIBarMetricsDefault];
    }
    //设置按钮的字体属性
    //设置标题的属性
    NSMutableDictionary *textAttri=[NSMutableDictionary dictionary];
    //设置字体的颜色
    textAttri[NSForegroundColorAttributeName]=IOS7?[UIColor orangeColor]:[UIColor blackColor];
    //设置阴影－－阴影是个枚举用value包装一下
    textAttri[UITextAttributeTextShadowOffset]=[NSValue valueWithUIOffset:UIOffsetZero];
    //设置字体
    textAttri[NSFontAttributeName]=[UIFont systemFontOfSize:IOS7 ?13:11];
    [item setTitleTextAttributes:textAttri forState:UIControlStateNormal];
    //选中的阴影
    [item setTitleTextAttributes:textAttri forState:UIControlStateSelected];


}
#pragma mark-----设置导行栏的主题
+(void)setUpNavbarTheme
{
    //1.导行栏的主题
    //取出appearance
    UINavigationBar *navBar=[UINavigationBar appearance];
    //设置背景
    if (!IOS7) {
        [navBar setBackgroundImage:[UIImage imageWithName:@"navigationbar_background"] forBarMetrics:UIBarMetricsDefault];
        //设置状态栏
        [UIApplication sharedApplication].statusBarStyle=UIStatusBarStyleBlackOpaque;
    }
    //设置标题的属性
    NSMutableDictionary *textAttri=[NSMutableDictionary dictionary];
    //设置字体的颜色
    textAttri[UITextAttributeTextColor]=[UIColor blackColor];
    //设置阴影－－阴影是个枚举用value包装一下
    textAttri[UITextAttributeTextShadowOffset]=[NSValue valueWithUIOffset:UIOffsetZero];
    //设置字体
    //[textAttri setObject:[UIFont systemFontOfSize:11] forKey:UITextAttributeFont];
    textAttri[UITextAttributeFont]=[UIFont systemFontOfSize:15];
    [navBar setTitleTextAttributes:textAttri];
}
#pragma mark----重写push方法
//重写push方法
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //当导航控制起的子控制器的个数大于零时就会隐藏，因为initWithRootViewController:时相当于调用了pushViewController,所以在第一次的时候不应该隐藏标签栏
    if (self.viewControllers.count>0) {
        //当push viewController时会隐藏下边的导航栏
        viewController.hidesBottomBarWhenPushed=YES;
    }
    
    [super pushViewController:viewController animated:YES];

    //
}
@end
