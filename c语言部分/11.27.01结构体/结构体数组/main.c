//
//  main.c
//  结构体数组
//
//  Created by 张凯泽 on 15/11/27.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    struct Student {
        int age;
        char *name;
    }t;
    struct Student tt = {26,"java"};
    //printf("%p\n",&tt);
    //定义结构体数组
    struct Student students[3] = {
        {23,"ios"},
        {24,"php"},
        {25,"c++"}
    };
    //第一种赋值方式：
    students[0] = tt;
    //第二种赋值方式：
//    students[0].age = tt.age;
//    students[0].name = tt.name;
//    printf("%p\n",&students[0]);
//    printf("%p\n",&(students[0].age));
//    printf("%p\n",students);
    for (int i = 0; i<3; i++) {
        printf("%s,%d\n",students[i].name,students[i].age);
    }
    return 0;
}
