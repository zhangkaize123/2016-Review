//
//  main.c
//  带参数的宏定义
//
//  Created by 张凯泽 on 15/11/29.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
/**
 *  1.括号里边的参数不需要写参数类型
    2.括号和后面的替换格式之间一定要有空格。
    3.预处理指令后边是不用加分号（；）
 */
#define SUM(v1,v2) (v1+v2)
#define PF(v) ((v)*(v))//在定义宏定义的时候一般对每一个参数也要加上括号
int main(int argc, const char * argv[]) {
    int sum =SUM(30, 40);//在编译成0或1的时候替换成 （30 ＋ 40）
    printf("sum = %d",sum);
    return 0;
}
