//
//  UIImage+ZKZImage.m
//  新浪博客框架搭建
//
//  Created by 张凯泽 on 15-4-4.
//  Copyright (c) 2015年 wyzc. All rights reserved.
//

#import "UIImage+ZKZImage.h"

@implementation UIImage (ZKZImage)
+(UIImage*)imageWithName:(NSString *)name
{
    //是ios7
    if (IOS7) {
        NSString *newName=[name stringByAppendingString:@"_ios7"];
        UIImage *image=[UIImage imageNamed:newName];
        //如果没有ios7后缀
        if (image==nil) {
            image=[UIImage imageNamed:name];
        }
        return image;
    }
    //非ios7
    UIImage *image=[UIImage imageNamed:name];
    return image;
    
}
+(UIImage*)resizedImagewithName:(NSString *)Imagename
{
    UIImage *image=[self imageWithName:Imagename];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
    
}
@end
