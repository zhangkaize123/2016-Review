//
//  main.c
//  c 语言数组
//
//  Created by 张凯泽 on 15/11/18.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
    
    int ages[5];
    
    //sizeof:简单的说其作用就是返回一个对象或者类型所占的内存字节数。
    //printf("%lu\n",sizeof(ages));
#pragma mark-zkz---- 数组的遍历
    int ages1[5] = {23,24,25,26,27};
    int count = sizeof(ages1)/sizeof(int);
    for (int index = 0; index<count; index++) {
        //printf("%d\n",ages1[index]);
    }
 #pragma mark-zkz---- 数组的注意事项
    //数组的初始化
    //1.int ages[5];
    //ages[0]=1;
    //...
    //ages[4]=5;
    //2.int ages[5]={[3]=3,[4]=4};//指定赋值
    //3.int ages[5]={3,4};//默认从0开始赋值
    //4int ages['A']={3,4,5};
    
    
    int ages2[5] = {1};
    int count1 = sizeof(ages2)/sizeof(int);
    for (int index = 0; index<count1; index++) {
        printf("%d\n",ages2[index]);
    }
#warning mark-zkz----数组中的[]只能放 常量 不可以放变量。
//    int lenth = 5;
//    int ages3[lenth]={1,2};在初始化数组的时候这种写法是错误的
    int ages4[3] ={1,2,3};
    int l = 2;
    printf("ages4[l]=%d\n",ages4[l]);
    return 0;
}
