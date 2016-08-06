//
//  main.c
//  11.25指针与数组
//
//  Created by 张凯泽 on 15/11/25.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
void printArray(int array[]);
int main(int argc, const char * argv[]) {
    int ages[5] = {1,3,5,7,8};
    //1.
    /**
     *  重点：指针变量加1代表加的这个指针类型的字节数。
     */
    int *p;
    p = ages;
    //2.
    /**
     *  访问数组元素的3种方式
     1.数组名[角标]
     int age = ages[0]
     2.指针变量名[角标]
     int age = p[0]
     3.*(指针变量名 + 角标)
     int age = * (p+1)
     */
    //printf("%d",p[0]);
    //3. 数组作为函数参数
    int array[5] = {1,3,5,7,9};
    printf("前：%lu\n",sizeof(array));
    printArray(array);
    return 0;
}
/**
 *  当数组作为函数参数时会自动转换为指针
 *
 *
 */
void printArray(int *array)//int *array = ages
{
    printf("%lu\n",sizeof(array));
    printf("%d\n",*(array+3));
}
