//
//  ZKZBadgeButton.m
//  新浪博客框架搭建
//
//  Created by 张凯泽 on 15-4-5.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "ZKZBadgeButton.h"

@implementation ZKZBadgeButton
-(instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self) {
        //bagdeButton 字体的尺寸
        self.titleLabel.font=[UIFont systemFontOfSize:11];

        self.userInteractionEnabled=NO;
        self.hidden=YES;
        //设置背景图片
        [self setBackgroundImage:[UIImage resizedImagewithName:@"main_badge"] forState:UIControlStateNormal];
    }
    return self;
}
//重写set方法
-(void)setBadgeValue:(NSString *)badgeValue
{
    _badgeValue=[badgeValue copy];
    //设置提醒数字
    if (badgeValue) {
        self.hidden=NO;
        //设置文字
        [self setTitle:badgeValue forState:UIControlStateNormal];
        //按钮文字的尺寸frame
        CGRect frame=self.frame;
        
        CGFloat bagdeButtonW=self.currentBackgroundImage.size.width;
        //当bagdeButton的文字长度大于1时
        if (badgeValue.length>1) {
            CGSize badgeSize=[badgeValue sizeWithFont:self.titleLabel.font];
            bagdeButtonW=badgeSize.width+10;
        }
        CGFloat bagdeButtonH=self.currentBackgroundImage.size.height;
        frame.size.width=bagdeButtonW;
        frame.size.height=bagdeButtonH;
        self.frame=frame;
}else{
    self.hidden=YES;
}




}
@end
