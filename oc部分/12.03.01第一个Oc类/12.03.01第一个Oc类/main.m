//
//  main.m
//  12.03.01第一个Oc类
//
//  Created by 张凯泽 on 15/12/3.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.


/*
/// 类的声明
@interface 自己定义的类名 : 继承的父类

@end
//类的实现
@implementation 自己定义的类名

<#methods#>

@end
*/
#import <Foundation/Foundation.h>
#import "Iphone.h"
int main(int argc, const char * argv[]) {
    /**
     *  做三件事情：
     1.开辟存储空间。
     2.初始化成员变量（属性）。
     3.返回指针地址。
     */
    Iphone *p;//局部变量，放到栈里边
    //定义一个指针变量p指向了Iphone类型的对象
    p =[Iphone new];//在堆内存中分配存储空间
    //通过 -> 设置变量的值
    p -> _size = 4.7;
    p -> color = kGlodColor;
    return 0;
}
