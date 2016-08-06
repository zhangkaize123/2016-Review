//
//  ZKZTabbar.h
//  新浪博客框架搭建
//
//  Created by 张凯泽 on 15-4-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ZKZTabbar;
@protocol ZKZTabbardelegate <NSObject>
-(void)tabBar:(ZKZTabbar*)tabbar didSelectedButtonFrom:(int )from to:(int )to;
@end
@interface ZKZTabbar : UIView
@property(nonatomic,weak)id <ZKZTabbardelegate>delegate;
-(void)addTabBarButtonWith:(UITabBarItem *)item;
@end
