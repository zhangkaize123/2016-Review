//
//  main.c
//  11.26返回指针的函数
//
//  Created by 张凯泽 on 15/11/26.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
/**
 *  方法1.
 *
  */
int myLenth(char *nameArr);
/**
 *  方法2
 *
 */
int myLenth1(char *nameArr);
int main(int argc, const char * argv[]) {
   
    char *name = "zkz";
    int lenth = myLenth(name);
    printf("方法1lenth=%d\n",lenth);
    int lenth1 = myLenth1(name);
    printf("方法2lenth1=%d\n",lenth1);
    return 0;
}
//方法1.
int myLenth(char *nameArr)
{
    int len = 0;
    while (*nameArr != '\0') {//‘\0’代表数字0，在c 语言中0为假，非零为真。while 循环中条件为假就会结束。
        nameArr ++;
        len ++;
        
    }
    return len;
}
//方法2.
int myLenth1(char *nameArr)
{
    char *strat = nameArr;
    while (*(nameArr++));
    return (int)(nameArr - strat -1);
}
