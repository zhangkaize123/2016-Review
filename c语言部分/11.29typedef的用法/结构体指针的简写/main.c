//
//  main.c
//  结构体指针的简写
//
//  Created by 张凯泽 on 15/11/29.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
struct Person
{
    int age;
};
//简写结构体指针的方法1:
typedef struct Person * pointer;
// 简写结构体指针方法2:
typedef struct People
{
    int age;
} * pointer2;//－－－－－－在这里使用typedef等同于 struct People{int age}*用pointer2 代替
//所以在下边定义的使用要使用pointer2   point ＝ &person
int main(int argc, const char * argv[]) {
    
    struct Person person = {33};
    struct Person *p = &person;
    p -> age = 44;
    printf("%d\n",person.age);
    pointer pp =&person;
    pp ->age = 56;
printf("%d\n",person.age);
    struct People people ={.age = 89};
    pointer2 ppp = &people;
    ppp -> age = 87;
    printf("people.age = %d\n",people.age);
    
    return 0;
}
