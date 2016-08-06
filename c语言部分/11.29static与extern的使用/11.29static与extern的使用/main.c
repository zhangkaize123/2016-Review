//
//  main.c
//  11.29static与extern的使用
//
//  Created by 张凯泽 on 15/11/29.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
#include "ZKZExtern.h"
/**
 *  1.外部函数：------>extern
 特点：定义的函数能被本文件和其他文件访问，默认情况下所有的函数都是外部函数
 2.内部函数：-------->static
 特点：只能在本文件中访问
 */
int main(int argc, const char * argv[]) {
    sum(2, 3);
   
    return 0;
}
