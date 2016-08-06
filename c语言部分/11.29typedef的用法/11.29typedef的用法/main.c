//
//  main.c
//  11.29typedef的用法
//
//  Created by 张凯泽 on 15/11/29.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
//typedef 原类型名称 新类型名称
struct Person
{
    int age;
    char *name;
};
//结构体简写
//方法1:
typedef struct Person Person;
//方法2:
typedef struct MyPerson
{
    int age;
    char *name;
} myPerson;
//方法3:
typedef struct {
    int age;
    char *name;
} MyPeople;

//枚举的简写方法1:
typedef enum Week {
    one,
    two,
    three
} week;
//enum{
//    man,
//    woman,
//    yao
//};
//枚举的简写方法2:
typedef enum{
    man,
    woman,
    yao
} Sex;
int main(int argc, const char * argv[]) {
    //方法1:
    Person p ={23,"zkz"};
    printf("%d\n",p.age);
    //方法2:
    myPerson person = {.age = 22,.name ="ios"};
    //方法3:
    MyPeople people;
    people.age = 21;
    people.name = "java";
    
#pragma mark--zkz----
    Sex s = yao;
    printf("s = %d\n",s);
    
    
    
    
    return 0;
}
