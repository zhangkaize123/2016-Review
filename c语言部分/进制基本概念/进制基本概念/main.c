//
//  main.c
//  进制基本概念
//
//  Created by 张凯泽 on 15/11/16.
//  Copyright © 2015年 rytong_zkz. All rights reserved.
//

#include <stdio.h>

int main(int argc, const char * argv[]) {
#pragma mark-zkz---
    //八机制以 0 开头
    int num1 = 015;
    printf("%d\n",num1);
    //十六进制以0x 开头
    int num2 = 0xd;
    printf("%d\n",num2);
    int num4 =0b1101;
    printf("num4= %d\n",num4);
#pragma mark-zkz---
    int num = 13;
    //八进制以%o打印
    printf("%o\n",num);
    //十六进制以%x打印
    printf("%x\n",num);
  #pragma mark-zkz---十进制转二进制
    //除2取余,结束后从最后开始取
    /*
     9/2=4     1
     4/2=2     0
     2/2=1     0
     1/2=0     1
     */
  #pragma mark-zkz---二进制转十进制  
   // 1001      ->十进制
    //乘以2的冪数(冪从0开始)
   #pragma mark-zkz---二进制转八进制  
    //三个二进制表示一个八进制
    //000 001 101--->015
    int n = 0b000001101;
    printf("n = %o\n",n);
   #pragma mark-zkz---二进制转十六进制
    //四个二进制表示一个十六进制数
#pragma mark-zkz----原码，补码，反码
    int n1 = 0b00001101;
    printf("n1=%d\n",n1);
    //           0 8 4 1
    //正数的原码，补码，反码都是一个
    //计算机存储的都是补码
    /*
     -13  －－－》 1000 1101 （原码）  二进制的最高位如果是0就是正数，1代表的是负数
                  1111 0010 (反码)  负数的反码 最高位不变，剩下的是0变1，1变0
        1111 0010 +0000 0001    --->   1111 0011(补码)负数的补码就是反码＋1
     
     
     */
    int n2 = 0b11111111111111111111111111110011;//-13
    printf("n2=%d",n2);
    
    
    
    
    return 0;
}
