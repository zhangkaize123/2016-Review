//
//  main.c
//  函数作为参数进行传递
//
//  Created by 张凯泽 on 15/11/26.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
int sum(int value1,int value2)
{
    return value1 + value2;
}
/**
 *  定义参数为函数指针的一个函数，
 */
int demo(int (*pointer)(int ,int ),int a,int b )
{
    return pointer(a,b);
}

int main(int argc, const char * argv[]) {
    //1.定义一个指向sum函数的指针
//    int (*pointer)(int value1,int value2);
//    pointer = sum;
//    int result = demo(pointer,45,50);
    //2.或者
    int result = demo(sum, 30, 40);
    /*
     */
    printf("result=%d",result);
    return 0;
}
