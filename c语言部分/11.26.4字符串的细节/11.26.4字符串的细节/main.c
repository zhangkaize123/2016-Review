//
//  main.c
//  11.26.4字符串的细节
//
//  Created by 张凯泽 on 15/11/26.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
/**
 *  自定义字符串拷贝
 */
char * myStrcpy(char *dest , const char *src)
{
#warning  mark --zkz---很容易被忽略
    //定义指针变量保存字符串首地址
    char * startPointer = dest;
//    while (*src != '\0') {
//        
//        *dest = *src;
//        dest ++;
//        src ++;
//    }
    //return  dest;这个是错误的因为在dest++过程中地址不是字符串的首地址了。
    //return startPointer;
    while ((*dest++ = *src++)) ;
    return startPointer;
        
    
}
/**
 *  自定义字符串拼接
 *
 *  @param dest 目标容器
 *  @param src
 *
 *  @return 拼接后的字符串
 */
char * myStrcat(char *dest,char *src)
{
    //定义指针变量保存字符串首地址
    char * startPointer = dest;
    
    while (*dest != '\0') {
        printf("%p\n",dest);
        dest ++;
    }
    while (*src != '\0') {
        *dest = *src;
        dest ++;
        src ++;
    }
    return startPointer;
}
int main(int argc, const char * argv[]) {
#pragma mark--zkz--字符串的拷贝
    char dest[5];
    printf("拷贝前：dest ＝%s\n",dest);
    char src[4] = "zkz";
    char *result = myStrcpy(dest,src);
    printf("拷贝后：dest ＝%s\n",dest);
    printf("result = %s\n",result);
#pragma mark--zkz--字符串的拼接
    char destCat[10] = "lt";
    printf("拼接前：destCat ＝%s\n",destCat);
    char srcCat[4] = "zkz";
    char * resultCat = myStrcat(destCat, srcCat);
    printf("拼接后：dest ＝%s\n",destCat);
    printf("resultCat = %s\n",resultCat);
    return 0;
}
