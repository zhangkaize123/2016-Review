//
//  main.c
//  static的用法
//
//  Created by 张凯泽 on 15/11/29.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
#include "ZKZStatic.h"
/**
 *  1.外部函数：
 特点：定义的函数能被本文件和其他文件访问，默认情况下所有的函数都是外部函数
 */
int main(int argc, const char * argv[]) {
#warning mark--zkz---不能定义 testStatic() 函数因为在ZKZStatic 中定它为内部函数
    //testStatic();
    //test();
#warning mark--zkz--可以有同名的内部函数，在这里可以调用 testStatic()因为在main 函数下边已经实现了该方法。
    testStatic();
    return 0;
}
#warning mark--zkz--可以有同名的内部函数
static void testStatic()
{
    printf("test1");
}