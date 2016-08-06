//
//  UIImage+ZKZImage.h
//  新浪博客框架搭建
//
//  Created by 张凯泽 on 15-4-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ZKZImage)
//加载图片
+(UIImage *)imageWithName:(NSString *)name;
//返回一张自由拉伸的图片
+(UIImage*)resizedImagewithName:(NSString *)Imagename;
@end
