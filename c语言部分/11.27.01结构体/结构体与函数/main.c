//
//  main.c
//  结构体与函数
//
//  Created by 张凯泽 on 15/11/28.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
struct Person {
    int age;
    char *name;
}p;
//以结构为参数的传递，无法改变里边变量的值
void testStruct(struct Person pp)
{
    pp . name = "ios";
}
//传递结构体指针
void testStruct1(struct Person *pointer)
{
    //方式1:
    //pointer -> name ="c++";
    //方式2:
    (*pointer).name ="java";
}
int main(int argc, const char * argv[]) {
    
    p.name = "php";
    p.age = 21;
    //以结构为参数的传递，无法改变里边变量的值
    testStruct(p);
    printf("%s\n",p.name);
    //传递结构体指针
    testStruct1(&p);
    printf("%s\n",p.name);
    return 0;
}
