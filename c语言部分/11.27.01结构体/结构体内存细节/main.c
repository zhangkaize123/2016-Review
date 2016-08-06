//
//  main.c
//  结构体内存细节
//
//  Created by 张凯泽 on 15/11/27.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    //定义结构体类型的时候不会分配内存空间
    struct Date {
        int year;
        int month;
        int day;
    };
    //通过结构体类型构建结构体变量的时候才会分配空间，。
    struct Date date = {2015,11,27};
#warning mark--zkz----- 第一个成员变量的地址就是这个结构体的地址
    
    printf("&date = %p\n",&date);//0x7fff5fbff7d0
     printf("&(date.year) = %p\n",&(date.year));//&(date.year) = 0x7fff5fbff7d0
    printf("&(date.month) = %p\n",&(date.month));//&(date.month) = 0x7fff5fbff7d4
    printf("&(date.day) = %p\n",&(date.day));//&(date.day) = 0x7fff5fbff7d8
    
    
    struct Date date2;
    date2 = date;//把date中的成员对应赋值给date2，属于值得拷贝
    printf("year = %d,month = %d,day = %d\n",date2.year,date2.month,date2.day);
    printf("&(date2.year) = %p\n",&(date2.year));//&(date2.year) = 0x7fff5fbff7c0
    
    struct Student {
        //结构体分配存储空间是按照补齐算法，分配的存储空间必须是占用字节最大的成员的倍数。(char*)的倍数
        int age;
        char * name;
        
    };
    struct Student student;
    //
    printf("%lu\n",sizeof(student));//16
    
    return 0;
}
