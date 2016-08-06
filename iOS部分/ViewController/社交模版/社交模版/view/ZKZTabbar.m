//
//  ZKZTabbar.m
//  新浪博客框架搭建
//
//  Created by 张凯泽 on 15-4-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZTabbar.h"
#import "ZKZTabBarButton.h"
@interface ZKZTabbar ()
@property(nonatomic,weak)ZKZTabBarButton *selectedButton;
@property(nonatomic,weak)UIButton *plusButton;
@property(nonatomic,strong)NSMutableArray *buttons;//放ZKZTabBarButton的数组
@end
@implementation ZKZTabbar
-(NSMutableArray*)buttons
{
    if (_buttons==nil) {
        _buttons=[NSMutableArray array];
    }
    return _buttons;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        if(!IOS7)
        {
        self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageWithName:@"tabbar_background"]];
        }
        //添加加号按钮
        UIButton *plusButton=[[UIButton alloc]init];
        [self addSubview:plusButton];
        self.plusButton=plusButton;
        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button"] forState:UIControlStateNormal];
        [plusButton setBackgroundImage:[UIImage imageWithName:@"tabbar_compose_button_highlighted"] forState:UIControlStateHighlighted];
        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add"] forState:UIControlStateNormal];
        [plusButton setImage:[UIImage imageWithName:@"tabbar_compose_icon_add_highlighted"] forState:UIControlStateHighlighted];
        //设置frame
        CGFloat plusW = plusButton.currentBackgroundImage.size.width;
        CGFloat plusH = plusButton.currentBackgroundImage.size.height;
        plusButton.bounds=CGRectMake(0, 0, plusW, plusH);
        
    }
    return self;
}
-(void)addTabBarButtonWith:(UITabBarItem *)item
{
    //创建按钮

    ZKZTabBarButton * button=[[ZKZTabBarButton alloc]init];
    [self addSubview:button];
    [self.buttons addObject:button];
    //设置数据
    button.item=item;
    //监听按钮监听
    [button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchDown];
    //默认选中第一按钮
    if (self.buttons.count==1) {
        [self buttonClick:button];
    }
    
    
}
#pragma mark------监听按钮点击
-(void)buttonClick:(ZKZTabBarButton *)button
{
    //通知代理－－－－－》必须放在     //设置选中按钮    的前边
    [self.delegate tabBar:self didSelectedButtonFrom:(int)self.selectedButton.tag to:(int)button.tag];
    //设置选中按钮
    self.selectedButton.selected=NO;
    button.selected=YES;
    self.selectedButton=button;
}
-(void)layoutSubviews
{
    [super layoutSubviews];
    //调整加号按钮的位置
    CGFloat centerX=self.frame.size.width*0.5;
    CGFloat centerY=self.frame.size.height*0.5;
    self.plusButton.center=CGPointMake(centerX, centerY);
    //设置frame
    CGFloat buttonY=0;
    CGFloat buttonW=self.frame.size.width/self.subviews.count;
    CGFloat buttonH=self.frame.size.height;
    for (int i=0; i<self.buttons.count; i++) {
        //取出按钮
        UIButton *button=self.buttons[i];
        CGFloat buttonX=i *buttonW;
        if (i>1) {
            buttonX+=buttonW;
        }
        
        
        button.frame=CGRectMake(buttonX, buttonY, buttonW, buttonH);
        //绑定tag
        button.tag=i;
    }
}
@end
