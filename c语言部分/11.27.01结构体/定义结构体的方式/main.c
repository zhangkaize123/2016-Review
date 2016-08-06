//
//  main.c
//  定义结构体的方式
//
//  Created by 张凯泽 on 15/11/27.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    //方式1:先定义结构体类型，再定义结构体变量
    struct Person {
        int age;
        char *name;
    };
    struct Person p;
    //方式2:在定义结构体类型的同时，定义了结构体变量
    struct Student {
        int num;
        char *name;
    }student;
    student.name="";
    student.num = 23;
    //方式3:匿名结构体
    //在定义结构体类型的同时，定义了结构体变量,并且省略了结构体类型名称
    
    struct{
        int number;
        char *name;
    }s;
    //方式4:
    struct {
        int age;
        char *name;
    }ss = {.name="ss",.age = 23};
    
    return 0;
}
