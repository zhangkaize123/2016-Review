//
//  main.c
//  typedef简化函数指针
//
//  Created by 张凯泽 on 15/11/29.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
int sum (int a , int b)
{
    return  a + b;
}
/**
 *  给 int myPointer (int  , int ) 这个类型起一个别名为 myPointer
 *
 */
typedef int (* myPointer) (int  , int );//
// 方法二
typedef int (myPointer1)(int,int);
int main(int argc, const char * argv[]) {
    //定义函数指针
    //int (* pointer)(int,int );
    //pointer = sum;
    //int a = pointer(4,5);
    //printf("a = %d",a);
    myPointer p = sum;
    printf("p = %p\n",p);
    int result = p(5, 7);
    printf("result = %d\n",result);
    myPointer1 * p1 = sum;
    int result1 = p1(7,8);
    printf("result1 = %d\n",result1);
    return 0;
}
