//
//  main.c
//  11.20指针注意事项
//
//  Created by 张凯泽 on 15/11/20.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    #pragma mark-zkz--- p 保存的变量指针是可以改变的，而且是指针保存一个变量的地址。
    int a =10;
    int * p = &a;
    int c = 20;
    p = &c;
    printf("*p = %d\n",*p);
#pragma mark-zkz--- 清空指针的操作
    
    int b = 40;
    int * p1 =&b;
    p1 = NULL;
    
#pragma mark--zkz---指向指针的指针
    return 0;
}
