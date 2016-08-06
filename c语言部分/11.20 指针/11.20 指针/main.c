//
//  main.c
//  11.20 指针
//
//  Created by 张凯泽 on 15/11/20.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
void change1(int number);
void change(int * num);//传递指针
int main(int argc, const char * argv[]) {
    int n =100;
    change1(n);//在这里传递过来的是值，而不是地址，
    printf("n = %d\n",n);
#pragma mark--使用指针
    int n1 = 22;
    change(&n1);
    printf("n1 = %d\n",n1);
    
    
//2.
    /*
     （1.）"*"指针变量的标识。
     （2.）指针变量占8个字节，指针变量就是用来存储地址的。
     （3.）当一个指针变量保存了某一个变量的地址，就称之为指向了这个变量。
     
     */
    int n3 = 45;
    
    int * pointer;
    pointer = &n3;
    *pointer=60;//*pointer就是访问指针变量，指向的地址空间，并把60 赋值给*pinter指向的地址空间
     printf("n3 = %d\n",n3);
    printf("*pointer = %d",*pointer);//*pointer在这里的意思就是取指针变量指向那块变量地址的值
    printf("pointer = %p\n",pointer);
    printf("n3的地址 = %p\n",&n3);
    return 0;
}


void change(int * num)
{
    *num=55;
}
void change1(int number)
{
    number=55;
}