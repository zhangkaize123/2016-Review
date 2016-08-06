//
//  ZKZStatic.c
//  11.29static与extern的使用
//
//  Created by 张凯泽 on 15/11/29.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include "ZKZStatic.h"

void test()
{
    testStatic();
}
void testStatic()
{
    printf("this is static test");
}