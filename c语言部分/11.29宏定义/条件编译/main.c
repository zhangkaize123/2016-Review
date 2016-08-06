//
//  main.c
//  条件编译
//
//  Created by 张凯泽 on 15/11/29.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
//#define A 1
int main(int argc, const char * argv[]) {
    
    int a = 1;
#if 1 ==a
    printf("123\n");
#elif a==4
    printf("456\n");
#else
    printf("789\n");
#endif//结束标志符
#warning mark--在这里打印 789 因为a 是局部变量程序运行时才会有，而＃if是在编译的时候进行判断,条件判断一般跟随宏定义一起出现
    
    
//方式1.
#if A ==1
    printf("123\n");
#elif a==4
    printf("456\n");
#else
    printf("789\n");
#endif//结束标志符

 //方式2
#ifdef A//这句话的意思就是如果宏定义A被定义了就打印
    printf("宏定义A被定义了\n");
#endif
//方式3
#ifndef A//如果没有定义宏定义A 。
#define A
#endif
//方式4
#if defined(A)
    printf("定义了宏A\n");
#endif
#if !defined(A)
    printf("没有定义宏A\n");
#endif
    return 0;
}
