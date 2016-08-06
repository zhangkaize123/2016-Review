//
//  main.c
//  指针类型要与变量类型一致
//
//  Created by 张凯泽 on 15/11/22.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    int b = 10;
    char c = 'a';
    int *p = &c;
    //定义指针时候制定的类型，是为了告诉指针变量取值的时候去几个字节。
    return 0;
}
