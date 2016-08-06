//
//  main.c
//  11.26.3指向函数的指针
//
//  Created by 张凯泽 on 15/11/26.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
#warning mark--zkz--函数名就是函数的地址，数组名就是数组的地址
void test()
{
    printf("Hello World\n");
}
int sum (int value1 ,int value2)
{
    return value1 + value2;
}
int main(int argc, const char * argv[]) {
    /**
     *  void (*pointer)();
     (*pointer):固定写法只要这样写就代表着，将来定义出来的指针指向的是一个函数。
     void      :代表指针变量pointer将来指向的函数没有返回值。
     （）       :代表指针变量pointer将来指向的函数没有形参。
     */
    /**
     * 1. 定义一个指向函数的指针，这个指针 将来指向的函数没有返回值没有形参。
     */
    void (*pointer)() = test;
    test();//直接访问
    (*pointer)();//间接访问
    pointer();//间接访问
    /**
     *  2.定义一个指向函数的指针，这个指针将来指向的函数有形参，有返回值
     */
    int (*pointer1)(int ,int );
    pointer1 = sum;
    sum(10, 20);
    pointer1(20,30);
    (*pointer1)(30,40);
    
    return 0;
}
