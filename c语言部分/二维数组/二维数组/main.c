//
//  main.c
//  二维数组
//
//  Created by 张凯泽 on 15/11/18.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    //2代表行（有多少个一维数组）
    //3代表列（每个一维数组有多少个元素）
    char cs[2][3]={{'a','b','c'},{'d','e','f'}};
#pragma mark--zkz--二维数组的地址就是它第一个角标的地址,还是第一个元素（数组）第一个角标的地址
    printf("cs =     %p\n",cs);         //0x7fff5fbff81a
    printf("cs[0]  = %p\n",&cs[0]);     //0x7fff5fbff81a
    printf("cs[0][0]=%p\n",&cs[0][0]);  //0x7fff5fbff81a
    printf("cs[1]=%p\n",&cs[1]);        //0x7fff5fbff81d
#pragma mark-zkz----二维数组的初始化
    //第一种方式
    char n[2][3] = {{'a','b','c'},{'d','e','f'}};
    //第二种方式
    char n1[2][3] = {'a','b','c','d','e','f'};
    //第三种方式-->因为明确了每一个一维数组的元素个数
    char n2[][3] = {'a','b','c','d','e','f'};
    int count = sizeof(n2)/sizeof(char);
    
    //获得列数
    int col = sizeof(n2[0])/sizeof(char);
    //获得行数
    int row = count/col;
    printf("n2 count=%d\n",count);
    printf("col count1=%d\n",col);
    return 0;
}
