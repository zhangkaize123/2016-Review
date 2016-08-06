//
//  main.c
//  11.29宏定义
//
//  Created by 张凯泽 on 15/11/29.
//  Copyright (c) 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>
//宏定义
#define COUNT 4

int main(int argc, const char * argv[]) {
    // insert code here...
    printf("Hello, World!\n");
#warning  mark--zkz--提前结束宏定义
#undef COUNT
    return 0;
}
