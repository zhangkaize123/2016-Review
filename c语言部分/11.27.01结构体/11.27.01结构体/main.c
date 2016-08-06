//
//  main.c
//  11.27.01结构体
//
//  Created by 张凯泽 on 15/11/27.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    //定义结构体类型
    struct person {
        int age;
        int  height;
        char *name;
    };
    // 方法1.构建结构体变量
    struct person p;
    p.age = 10;
    p.height = 1.82;
    p.name = "zkz";
    //方法2:构建结构体变量
    struct person p1 = {32,1.67,"lro"};
    //方法3:构建结构体变量
    struct person p2 = {.age = 23,.height = 1.78,.name = "rgo"};
    
    //错误写法：
#warning  mark--zkz--因为  p3 是这个结构体变量的地址，不能对地址进行赋值，所以在构建结构体变量的时候一次性赋值。
    /*
    struct person p3;
    p3 = {32,1.67,"lro"};
     */
    printf("%lu",sizeof(struct person));//16
    int ages[3]={1,2,3};
    printf("ages=%p\n",ages);
    return 0;
}
