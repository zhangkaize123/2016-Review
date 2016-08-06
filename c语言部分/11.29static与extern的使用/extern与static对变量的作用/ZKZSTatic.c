//
//  ZKZStatic.c
//  11.29static与extern的使用
//
//  Created by 张凯泽 on 15/11/29.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include "ZKZSTatic.h"
int num;
static int value;
void test()

{
    
    printf("num = %d\n",num);
    printf("value = %d\n",value);
}