//
//  main.c
//  文件包含
//
//  Created by 张凯泽 on 15/11/29.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
#include "gaolan.h"//它代表拷贝：
/*
#ifndef GAOLAN
#define GAOLAN
int sum (int a,int b);
#endif
 */

int main(int argc, const char * argv[]) {
    int c = sum(4, 5);
    printf("%d",c);
    return 0;
}
