//
//  main.c
//  函数作为参数练习
//
//  Created by 张凯泽 on 15/11/26.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
/**
 *  转换成大写函数
 */
void upper(char *name)
{
    char temp = *name;
    if (temp >= 'a' && temp <= 'z') {
        temp = temp - ('a' - 'A');
    }
    *name = temp;
}
/**
 *  把函数作为参数进行传递
 *.h中的声明
 *  @param name  转化成大写的传递的字符串
 *  @param upper 回调函数的地址指针
 */

void changeString(char *name,void (*upper)(char *));

int main(int argc, const char * argv[]) {
    /**
     *   给出字符串把空格后面的字符换成大写，使用回调函数实现
     */
    
    char name[100] = "student class";
    //upper(&name);
    // viewController.m里边的调用
    changeString(name,upper);
    printf("转换后:%s\n",name);
    
    
    return 0;
}
//.m中的实现
void changeString(char *name,void (*upper)(char *))
{
    while (*name != '\0' ) {
        if (*name == ' ') {
            name ++;
            upper(name);
        }else {
            name ++;
        }
    }
}
