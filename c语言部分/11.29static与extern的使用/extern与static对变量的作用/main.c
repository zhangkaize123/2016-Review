//
//  main.c
//  extern与static对变量的作用
//
//  Created by 张凯泽 on 15/11/29.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
#include "ZKZSTatic.h"

int main(int argc, const char * argv[]) {
#warning mark---zkz--使用extern 修饰声明这个变量是外部文件的变量
    extern int num;
    num =40;
    int *p = &num;
    *p =30;
    
    test();
    
    return 0;
}
