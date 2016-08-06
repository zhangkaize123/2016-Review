//
//  main.c
//  指向结构体的指针
//
//  Created by 张凯泽 on 15/11/27.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    struct Person {
        char *name;
        int age;
        char sex[40];
    };
    struct Person person = {"ios",24};
    //printf("%s,%d\n",person.name,person.age);
    //定义结构体的指针
    struct Person *p = &person;
    //访问指针变量p指向的存储空间中的age 属性
    //person ->age = 56;
    p -> age = 25;
    p -> name = "java";
    p -> name = "ios";
    
    printf("%s,%d\n",person.name,person.age);

    printf("%d,%s\n",p ->age,p ->name);
    printf("p = %p\n",p);
    printf("p->name =%p\n",&(p->name));
    return 0;
}
