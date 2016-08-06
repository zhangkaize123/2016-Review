//
//  main.c
//  指针作为返回值的注意事项
//
//  Created by 张凯泽 on 15/11/26.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
char * retutnPoint();
int main(int argc, const char * argv[]) {
    
    char *result = retutnPoint();
    printf("result=%s\n",result);
    printf("_______\n");
    return 0;
}
char * retutnPoint()
{
#pragma mark---zkz--情况1:
    //char name[4]="zkz";
    /**
     *  当用数组保存字符串的时候，数据是保存到栈里边的，根据函数的作用域当大括号结束后数据就会被释放。
     */
#pragma mark---zkz--情况2:    
    char *name = "zkz";
    /**
     *  当用指针定义字符串时，数据是放到常量区的，跟函数的作用域没有关系。
     */
    return name;
}