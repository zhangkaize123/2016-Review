//
//  ZKZTabBarButton.m
//  新浪博客框架搭建
//
//  Created by 张凯泽 on 15-4-5.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZTabBarButton.h"
#import "ZKZBadgeButton.h"
//图标的比例
#define ZKZTabBarButtonImageRatio 0.6
//按钮默认文字颜色
#define ZKZTabBarButtonTitleColor (IOS7?[UIColor blackColor]:[UIColor whiteColor])
//按钮的选中文字颜色
#define ZKZTabBarButtonSelectedTitleColor (IOS7? ZKZColor(234, 103, 7):ZKZColor(248, 139, 0))
@interface ZKZTabBarButton ()
//提醒数字
@property(nonatomic,weak)ZKZBadgeButton *bagdeButton;
@end
@implementation ZKZTabBarButton
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        //按钮图片居中
        self.imageView.contentMode=UIViewContentModeCenter;
        //按钮的文字居中
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        //按钮的文字字体
        self.titleLabel.font=[UIFont systemFontOfSize:11];
        [self setTitleColor: ZKZTabBarButtonTitleColor forState:UIControlStateNormal];
        [self setTitleColor:ZKZTabBarButtonSelectedTitleColor forState:UIControlStateSelected];
        if(!IOS7)
        {
            //选中的时候增加背景图片
            [self setBackgroundImage:[UIImage imageWithName:@"tabbar_slider"] forState:UIControlStateSelected];
        }
        //添加一个提醒数字
        ZKZBadgeButton *bagdeButton=[[ZKZBadgeButton alloc]init];
        [self addSubview:bagdeButton];
        self.bagdeButton=bagdeButton;
        //左边和下边进行拉伸
        bagdeButton.autoresizingMask=UIViewAutoresizingFlexibleLeftMargin|UIViewAutoresizingFlexibleBottomMargin;

    }
    return self;
}
//不显示高亮
-(void)setHighlighted:(BOOL)highlighted
{}
//重写set方法
-(void)setItem:(UITabBarItem *)item
{
    _item=item;
    //KVO  self监听item属性(:@"badgeValue" )发生改变
    [item addObserver:self forKeyPath:@"badgeValue" options:0 context:nil];
    [self observeValueForKeyPath:nil ofObject:nil change:nil context:nil];
    


}
-(void)dealloc
{
    [self.item removeObserver:self forKeyPath:@"badgeValue"];
}
//监听到了某个对象的属性改变了，就会调用
//@"badgeValue" 这个属性发生改变就会自动调用这个方法
/*
 KeyPath:属性名
 Object:哪个对象的属性被改变了
 object change:属性发生的改变
 */
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    //设置文字
    [self setTitle:self.item.title forState:UIControlStateNormal];
    //设置图片
     [self setImage:self.item.image forState:UIControlStateNormal];
     [self setImage:self.item.selectedImage forState:UIControlStateSelected];
    // 设置提醒数字
    self.bagdeButton.badgeValue=self.item.badgeValue;
    
    //设置提醒数字的位置
    CGRect frame=self.bagdeButton.frame;
    CGFloat bagdeButtonY=0;
    CGFloat bagdeButtonW=self.bagdeButton.currentBackgroundImage.size.width;
    //当bagdeButton的文字长度大于1时
    if (self.item.badgeValue.length>1) {
        CGSize badgeSize=[self.item.badgeValue sizeWithFont:self.bagdeButton.titleLabel.font];
        bagdeButtonW=badgeSize.width+10;
    }
    CGFloat bagdeButtonX=self.frame.size.width-bagdeButtonW;
    frame.origin.x=bagdeButtonX;
    frame.origin.y=bagdeButtonY;
    self.bagdeButton.frame=frame;


    
}
//图片的frame
-(CGRect)imageRectForContentRect:(CGRect)contentRect
{//contentRect代表的是按钮的frame
    
    CGFloat imageW=contentRect.size.width;
    CGFloat imageH=contentRect.size.height*ZKZTabBarButtonImageRatio;
    return CGRectMake(0, 0, imageW, imageH);
}
//文字的frame
-(CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGFloat titleY=contentRect.size.height*ZKZTabBarButtonImageRatio;
    CGFloat titleW=contentRect.size.width;
    CGFloat titleH=contentRect.size.height-titleY;
    return CGRectMake(0, titleY, titleW, titleH);
}
@end
