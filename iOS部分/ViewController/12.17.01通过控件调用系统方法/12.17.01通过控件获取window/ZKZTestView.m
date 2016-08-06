//
//  ZKZTestView.m
//  12.17.01通过控件获取window
//
//  Created by 张凯泽 on 15/12/17.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#import "ZKZTestView.h"

@implementation ZKZTestView
/**
 *  当控件添加到父控件的时候就会调用
 */
-(void)didMoveToSuperview
{
    NSLog(@"didMoveToSuperview");
    
}
/**
 *  当控件的frame发生改变的时候就会调用，必须调用父类的[super layoutSubviews]方法
 */
-(void)layoutSubviews
{
    NSLog(@"layoutSubviews");
    [super layoutSubviews];
}

@end
